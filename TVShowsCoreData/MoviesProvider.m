//
//  MoviesProvider.m
//  TVShowsCoreData
//
//  Created by Daniel García on 31/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "MoviesProvider.h"
#import <CoreData/CoreData.h>
#import "RequestManager.h"
#import "MovieEntity.h"

@interface MoviesProvider()
@property (strong,nonatomic) RequestManager *requestManager;
@end

@implementation MoviesProvider
- (RequestManager *)requestManager{
    if (!_requestManager) {
        _requestManager = [[RequestManager alloc] init];
    }
    return _requestManager;
}

- (void)loadMoviesInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext withCompletionBlock:(void(^)(NSArray *movies))completionBlock{
    
    [self.requestManager GET:@"movies/trending.json/df2880909bafa2689135188bf47fe5f9" parameters:nil successBlock:^(id data) {
        
        NSMutableArray *movies = [NSMutableArray array];
        NSError *error;
        for (NSDictionary *movieData in data) {
            MovieEntity *movie = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([MovieEntity class]) inManagedObjectContext:managedObjectContext];
            
            movie.movieId = movieData[@"imdb_id"];
            movie.movieTitle = movieData[@"title"];
            movie.moviePosterURL = movieData[@"images"][@"fanart"];
            [movies addObject:movie];
        }
        
        [managedObjectContext save:&error];
        completionBlock(movies);
        
        
    } errorBlock:^(NSError *error) {
        
    }];
}
@end