//
//  UIButton+Blocks.m
//  TVShowsCoreData
//
//  Created by Daniel García on 29/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "UIButton+Blocks.h"
#import <objc/runtime.h>

static NSString * const actionBlockKey = @"actionBlock";

@implementation UIButton (Blocks)
- (void)setActionBlock:(ButtonActionBlock)actionBlock{
    objc_setAssociatedObject(self, (__bridge const void *)(actionBlockKey), actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(blockButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
}
- (ButtonActionBlock)actionBlock{
    return objc_getAssociatedObject(self, (__bridge const void *)(actionBlockKey));
}
- (instancetype)initWithActionBlock:(ButtonActionBlock)actionBlock{
    self = [super init];
    if (self) {
        self.actionBlock = actionBlock;
    }
    return self;
}
- (void)blockButtonWasPressed{
    self.actionBlock();
}
@end
