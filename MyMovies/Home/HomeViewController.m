//
//  HomeViewController.m
//  MyMovies
//
//  Created by Abdelrhman Ahmed on 16/04/2022.
//

#import "HomeViewController.h"
#import <SDWebImage/SDWebImage.h>
#import "Movie.h"
#import "DetailsViewController.h"


@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _networkManager = [NetworkManager new];
    [_networkManager getAllMovies:self];
    printf("Home viewDidLoad\n");
    
}

// NSURLConnectionDataDelegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    printf("didReceiveResponse\n");
    _responseData = [NSMutableData new];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    printf("didReceiveData\n");
    [_responseData appendData:data];
}

// convert incoming data to array of movies
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    printf("connectionDidFinishLoading\n");
    _movieList = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingAllowFragments error:nil];
    [self.tableView reloadData];
    printf("Movies Count: %d\n", _movieList.count);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _movieList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary *dict = _movieList[indexPath.row];
    
    Movie *movie = [self convertDictionaryToMovie:dict];
    
    cell.textLabel.text = movie.title;
    
    NSString *image_url = movie.image;
    
    _movieImage = cell.imageView;
    [_movieImage sd_setImageWithURL:[NSURL URLWithString:image_url]
             placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];
    
    _movieImage.layer.cornerRadius = 25;
    _movieImage.layer.masksToBounds = true;
    
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 50;
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    NSDictionary *dict = _movieList[self.tableView.indexPathForSelectedRow.row];
    Movie *movie = [self convertDictionaryToMovie:dict];
    ((DetailsViewController *)segue.destinationViewController).movie = movie;
    
}

-(Movie *)convertDictionaryToMovie:(NSDictionary *)dict{
        
    Movie *movie = [Movie new];
    movie.title = [dict objectForKey:@"title"];
    movie.image = [dict objectForKey:@"image"];
    movie.releaseYear = [[dict objectForKey:@"releaseYear"] doubleValue];
    movie.rating = [[dict objectForKey:@"rating"] integerValue];
    movie.genre = [dict objectForKey:@"genre"];
    
    return movie;
    
}


@end
