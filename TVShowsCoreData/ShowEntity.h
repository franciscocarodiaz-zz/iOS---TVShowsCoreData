//
//  ShowEntity.h
//  TVShowsCoreData
//
//  Created by Daniel García on 28/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ShowEntity : NSManagedObject

@property (nonatomic, retain) NSString * showAuthor;
@property (nonatomic, retain) NSString * showId;
@property (nonatomic, retain) NSString * showName;
@property (nonatomic, retain) NSString * showURL;
@property (nonatomic, retain) NSString * showRating;

@end
