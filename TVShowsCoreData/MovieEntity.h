//
//  MovieEntity.h
//  TVShowsCoreData
//
//  Created by Daniel García on 31/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MovieEntity : NSManagedObject

@property (nonatomic, retain) NSString * movieId;
@property (nonatomic, retain) NSString * movieTitle;
@property (nonatomic, retain) id moviePosterURL;

@end
