//
//  NetworkManager.h
//  MyMovies
//
//  Created by Abdelrhman Ahmed on 16/04/2022.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NetworkManager : NSObject

@property const NSString *BASE_URL;

-(void) getAllMovies:(UIViewController *) delegate;

@end
