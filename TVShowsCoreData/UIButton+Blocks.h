//
//  UIButton+Blocks.h
//  TVShowsCoreData
//
//  Created by Daniel García on 29/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonActionBlock)();

@interface UIButton (Blocks)
@property (copy, nonatomic) ButtonActionBlock actionBlock;
- (instancetype)initWithActionBlock:(ButtonActionBlock)actionBlock;
- (void)setActionBlock:(ButtonActionBlock)actionBlock;
@end
