//
//  ShowsProvider.h
//  TVShowsCoreData
//
//  Created by Daniel García on 28/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSManagedObjectContext;
@interface ShowsProvider : NSObject
- (void)loadShowsInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext withCompletionBlock:(void(^)(NSArray *shows))completionBlock;
@end
