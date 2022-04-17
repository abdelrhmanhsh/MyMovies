//
//  HomeViewController.h
//  MyMovies
//
//  Created by Abdelrhman Ahmed on 16/04/2022.
//

#import <UIKit/UIKit.h>
#import "NetworkManager.h"
#import "DeleteMovieProtocol.h"

@interface HomeViewController : UITableViewController<NSURLConnectionDelegate, NSURLConnectionDataDelegate, DeleteMovieProtocol>

@property NetworkManager *networkManager;
@property NSMutableData *responseData; //collect response
@property NSMutableArray *movieList; //convert data to array of movies

@property (weak, nonatomic) IBOutlet UIImageView *movieImage;

// NSURLConnectionDataDelegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;

@end
