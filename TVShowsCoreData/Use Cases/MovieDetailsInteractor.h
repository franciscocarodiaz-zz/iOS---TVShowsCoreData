//
//  MovieDetailsInteractor.h
//  TVShowsCoreData
//
//  Created by Daniel García on 31/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "IHInteractor.h"

@class MovieEntity;
@interface MovieDetailsInteractor : IHInteractor
- (void)showDetailsForMovie:(MovieEntity *)movie withCompletionBlock:(void(^)(MovieEntity *movieWithDetails))completion;
@end
