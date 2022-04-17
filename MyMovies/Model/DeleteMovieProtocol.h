//
//  DeleteMovieProtocol.h
//  MyMovies
//
//  Created by Abdelrhman Ahmed on 17/04/2022.
//

#import "Movie.h"

@protocol DeleteMovieProtocol <NSObject>

-(void) deleteMovie: (Movie *)movie;

@end
