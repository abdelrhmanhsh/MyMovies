//
//  NetworkManager.m
//  MyMovies
//
//  Created by Abdelrhman Ahmed on 16/04/2022.
//

#import "NetworkManager.h"

@implementation NetworkManager

 
- (void)getAllMovies:(UIViewController *)delegate{
    _BASE_URL = @"https://api.androidhive.info/json/movies.json";
    
    NSURL *url = [NSURL URLWithString:_BASE_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:delegate];
    
    [connection start];
}

@end
