//
//  ListShowsInteractor.h
//  TVShowsCoreData
//
//  Created by Daniel García on 31/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "IHInteractor.h"

@interface ListShowsInteractor : IHInteractor
- (void)listOfShowsWithCompletionBlock:(void(^)(NSArray *shows))completion;
@end
