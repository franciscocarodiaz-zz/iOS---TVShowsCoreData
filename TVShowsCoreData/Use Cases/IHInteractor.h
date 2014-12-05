//
//  IHInteractor.h
//  TVShowsCoreData
//
//  Created by Daniel García on 31/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface IHInteractor : NSObject
@property (strong,nonatomic,readonly) NSManagedObjectContext *managedObjectContext;
@end
