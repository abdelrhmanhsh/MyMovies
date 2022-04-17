//
//  DetailsViewController.m
//  MyMovies
//
//  Created by Abdelrhman Ahmed on 16/04/2022.
//

#import "DetailsViewController.h"
#import <SDWebImage/SDWebImage.h>

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _movieTitle.text = _movie.title;
    _movieReleaseYear.text = [NSString stringWithFormat:@"%d", _movie.releaseYear];
    _movieRating.text = [NSString stringWithFormat:@"%.2lf", _movie.rating];
    _movieGenre.text = [_movie.genre componentsJoinedByString:@", "];
    
    [_movieImage sd_setImageWithURL:[NSURL URLWithString:_movie.image]
             placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnDelete:(UIBarButtonItem *)sender {
    [_homeVCDelegate deleteMovie:_movie];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
