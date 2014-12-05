//
//  ImageDownloader.m
//  TVShowsCoreData
//
//  Created by Daniel García on 30/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "ImageDownloader.h"
#import "ImageDownloadOperation.h"

@interface ImageDownloader()
@property (strong,nonatomic) NSOperationQueue *operationQueue;
@end

@implementation ImageDownloader
+ (instancetype)defaultImageDownloader{
    static dispatch_once_t onceToken;
    static ImageDownloader *imageDownloader;
    dispatch_once(&onceToken, ^{
        imageDownloader = [[ImageDownloader alloc] init];
    });
    return imageDownloader;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _operationQueue = [[NSOperationQueue alloc] init];
    }
    return self;
}
- (NSOperation *)imageWithURL:(NSURL *)imageURL withCompletion:(ImageDownloadCompletion)completion{
    UIImage *image = [self cachedImageForURL:imageURL];
    ImageDownloadOperation *downloadOperation;
    if (!image) {
        downloadOperation = [[ImageDownloadOperation alloc] initWithImageURL:imageURL];
        __weak typeof(downloadOperation) weakOperation = downloadOperation;
        [downloadOperation setCompletionBlock:^{
            if (weakOperation) {
                UIImage *image = [UIImage imageWithData:weakOperation.imageData];
                completion(image);
                [self cacheImageData:weakOperation.imageData withURL:imageURL];
            }
        }];
        [self.operationQueue addOperation:downloadOperation];
    }else{
        completion(image);
    }
    return downloadOperation;
}
- (UIImage *)cachedImageForURL:(NSURL *)imageURL{
    NSString *cacheFilePath = [self imageCacheFilePathForURL:imageURL];
    UIImage *image;
    if ([[NSFileManager defaultManager] fileExistsAtPath:cacheFilePath]) {
        NSData *imageData = [NSData dataWithContentsOfFile:cacheFilePath];
        image = [UIImage imageWithData:imageData];
    }
    return image;
}
- (void)cacheImageData:(NSData *)imageData withURL:(NSURL *)imageURL{
    NSString *cacheFilePath = [self imageCacheFilePathForURL:imageURL];
    if (![[NSFileManager defaultManager] fileExistsAtPath:cacheFilePath]) {
        [imageData writeToFile:cacheFilePath atomically:YES];
    }
}
- (NSString *)imageCacheFilePathForURL:(NSURL *)imageURL{
    NSString *imageURLKey = [self imageKeyForURL:imageURL];
    NSString *cacheFilePath = [[self cacheDirectory] stringByAppendingPathComponent:imageURLKey];
    return cacheFilePath;
}
- (NSString *)cacheDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}
- (NSString *)imageKeyForURL:(NSURL *)imageURL{
    // http:\/\/thetvdb.com\/banners\/posters\/81189-22.jpg
    // httpthetvdbcombannersposters81189-22jpg
    
    return [[[[[imageURL description]
               stringByReplacingOccurrencesOfString:@"/" withString:@""]
                stringByReplacingOccurrencesOfString:@":" withString:@""]stringByReplacingOccurrencesOfString:@"\\" withString:@""] stringByReplacingOccurrencesOfString:@"." withString:@""];
}
@end
