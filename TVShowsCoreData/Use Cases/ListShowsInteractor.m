//
//  ListShowsInteractor.m
//  TVShowsCoreData
//
//  Created by Daniel García on 31/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "ListShowsInteractor.h"
#import "ShowEntity.h"
#import "ShowsProvider.h"

@interface ListShowsInteractor()
@property (strong,nonatomic) ShowsProvider *showsProvider;
@end
@implementation ListShowsInteractor
- (ShowsProvider *)showsProvider{
    if (!_showsProvider) {
        _showsProvider = [[ShowsProvider alloc] init];
    }
    return _showsProvider;
}
- (void)listOfShowsWithCompletionBlock:(void (^)(NSArray *))completion{
    NSArray *cachedShows = [self loadCachedShows];
    if (cachedShows.count == 0) {
        [self.showsProvider loadShowsInManagedObjectContext:self.managedObjectContext withCompletionBlock:^(NSArray *shows) {
            completion(shows);
        }];
    }else{
        completion(cachedShows);
    }
}
- (NSArray *)loadCachedShows{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([ShowEntity class])];
    fetchRequest.predicate = [NSPredicate predicateWithValue:YES];
    NSArray *shows = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return shows;
}
@end
