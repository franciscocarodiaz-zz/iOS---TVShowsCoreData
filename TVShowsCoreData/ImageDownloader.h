//
//  ImageDownloader.h
//  TVShowsCoreData
//
//  Created by Daniel García on 30/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^ImageDownloadCompletion)(UIImage *image);

@interface ImageDownloader : NSObject
+ (instancetype)defaultImageDownloader;
- (NSOperation *)imageWithURL:(NSURL *)imageURL withCompletion:(ImageDownloadCompletion)completion;
@end
