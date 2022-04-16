//
//  Movie.h
//  MyMovies
//
//  Created by Abdelrhman Ahmed on 16/04/2022.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property NSString *title, *image;
@property double rating;
@property int releaseYear;
@property NSArray *genre;

@end

