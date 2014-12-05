//
//  UIImageView+IHWebImage.m
//  TVShowsCoreData
//
//  Created by Daniel García on 30/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "UIImageView+IHWebImage.h"
#import "ImageDownloader.h"
#import <objc/runtime.h>

static NSString * const downloadOperationKey = @"downloadOperationKey";

@interface UIImageView (_IHWebImage)
@property (strong,nonatomic) NSOperation *downloadOperation;
@end
@implementation UIImageView (IHWebImage)
- (void)setImageFromURL:(NSURL *)imageURL withCompletionBlock:(void (^)(UIImage *))completionBlock{
    self.image = nil;
    if (self.downloadOperation) {
        if ([self.downloadOperation isExecuting] || [self.downloadOperation isReady]) {
            [self.downloadOperation cancel];
        }
        self.downloadOperation = nil;
    }
    self.downloadOperation = [[ImageDownloader defaultImageDownloader] imageWithURL:imageURL withCompletion:^(UIImage *image) {
        self.downloadOperation = nil;
        dispatch_async(dispatch_get_main_queue(), ^{
            if (image) {
                self.image = image;
            }
            completionBlock(image);
        });
    }];
}
- (void)setDownloadOperation:(NSOperation *)downloadOperation{
    objc_setAssociatedObject(self, (__bridge const void *)(downloadOperationKey), downloadOperation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSOperation *)downloadOperation{
    return objc_getAssociatedObject(self, (__bridge const void *)(downloadOperationKey));
}
@end
