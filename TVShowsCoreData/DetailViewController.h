//
//  DetailViewController.h
//  TVShowsCoreData
//
//  Created by Daniel García on 29/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShowEntity;
@interface DetailViewController : UIViewController
- (instancetype)initWithShow:(ShowEntity *)show;
@end
