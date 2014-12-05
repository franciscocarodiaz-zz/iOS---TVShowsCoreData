//
//  ListMoviesInteractor.m
//  TVShowsCoreData
//
//  Created by Daniel García on 31/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "ListMoviesInteractor.h"
#import "MoviesProvider.h"

@interface ListMoviesInteractor()
@property (strong,nonatomic) MoviesProvider *showsProvider;
@end
@implementation ListMoviesInteractor
- (MoviesProvider *)showsProvider{
    if (!_showsProvider) {
        _showsProvider = [[MoviesProvider alloc] init];
    }
    return _showsProvider;
}
- (void)listOfMoviesWithCompletionBlock:(void(^)(NSArray *movies))completion{
    [self.showsProvider loadMoviesInManagedObjectContext:self.managedObjectContext withCompletionBlock:^(NSArray *movies) {
        completion(movies);
    }];
}
@end
