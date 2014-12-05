//
//  UIImageView+IHWebImage.h
//  TVShowsCoreData
//
//  Created by Daniel García on 30/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (IHWebImage)
- (void)setImageFromURL:(NSURL *)imageURL withCompletionBlock:(void(^)(UIImage *image))completionBlock;
@end
