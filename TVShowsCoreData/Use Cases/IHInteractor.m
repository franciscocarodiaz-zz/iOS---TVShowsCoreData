//
//  IHInteractor.m
//  TVShowsCoreData
//
//  Created by Daniel García on 31/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "IHInteractor.h"
#import "CoreDataManager.h"

@implementation IHInteractor
- (NSManagedObjectContext *)managedObjectContext{
    return [CoreDataManager defaultCoreDataManager].managedObjectContext;
}
@end
