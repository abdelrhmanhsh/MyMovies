//
//  DetailsViewController.h
//  MyMovies
//
//  Created by Abdelrhman Ahmed on 16/04/2022.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface DetailsViewController : UIViewController

@property Movie *movie;

@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UILabel *movieReleaseYear;
@property (weak, nonatomic) IBOutlet UILabel *movieRating;
@property (weak, nonatomic) IBOutlet UILabel *movieGenre;

@end
