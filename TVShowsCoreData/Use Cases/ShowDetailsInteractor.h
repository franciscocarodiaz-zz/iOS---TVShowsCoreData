//
//  ShowDetailsInteractor.h
//  TVShowsCoreData
//
//  Created by Daniel García on 31/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "IHInteractor.h"

@class ShowEntity;
@interface ShowDetailsInteractor : IHInteractor
- (void)showDetailsForShow:(ShowEntity *)show withCompletionBlock:(void(^)(ShowEntity *showWithDetails))completion;
@end
