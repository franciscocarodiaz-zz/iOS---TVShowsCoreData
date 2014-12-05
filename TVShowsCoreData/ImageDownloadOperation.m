//
//  ImageDownloadOperation.m
//  TVShowsCoreData
//
//  Created by Daniel García on 30/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "ImageDownloadOperation.h"

@interface ImageDownloadOperation()
@property (copy,nonatomic) NSURL *imageURL;
@end

@implementation ImageDownloadOperation
- (instancetype)initWithImageURL:(NSURL *)imageURL
{
    self = [super init];
    if (self) {
        _imageURL = [imageURL copy];
    }
    return self;
}
- (void)start{
    [super start];
    [self downloadImageWithURL:self.imageURL];
}
- (void)cancel{
    [super cancel];
    
}
- (void)downloadImageWithURL:(NSURL *)imageURL{
    self.imageData = [NSData dataWithContentsOfURL:imageURL];
    [self finish];
}
@end
