//
//  MoviesProvider.h
//  TVShowsCoreData
//
//  Created by Daniel García on 31/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSManagedObjectContext;
@interface MoviesProvider : NSObject
- (void)loadMoviesInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext withCompletionBlock:(void(^)(NSArray *movies))completionBlock;
@end
