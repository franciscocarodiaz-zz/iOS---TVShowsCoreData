//
//  ShowsProvider.m
//  TVShowsCoreData
//
//  Created by Daniel García on 28/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "ShowsProvider.h"
#import <CoreData/CoreData.h>
#import "RequestManager.h"
#import "ShowEntity.h"

@interface ShowsProvider()
@property (strong,nonatomic) RequestManager *requestManager;
@end

@implementation ShowsProvider
- (RequestManager *)requestManager{
    if (!_requestManager) {
        _requestManager = [[RequestManager alloc] init];
    }
    return _requestManager;
}

- (void)loadShowsInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext withCompletionBlock:(void(^)(NSArray *shows))completionBlock{
    
    [self.requestManager GET:@"shows/trending.json/df2880909bafa2689135188bf47fe5f9" parameters:nil successBlock:^(id data) {
        
        NSMutableArray *shows = [NSMutableArray array];
        NSError *error;
        for (NSDictionary *showData in data) {
            ShowEntity *show = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([ShowEntity class]) inManagedObjectContext:managedObjectContext];
            show.showId = showData[@"imdb_id"];
            show.showName = showData[@"title"];
            show.showURL = showData[@"images"][@"banner"];
            [shows addObject:show];
        }
        
        [managedObjectContext save:&error];
        completionBlock(shows);
        
        
    } errorBlock:^(NSError *error) {
        
    }];
}
@end
