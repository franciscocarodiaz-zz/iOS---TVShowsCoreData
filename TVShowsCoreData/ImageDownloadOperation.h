//
//  ImageDownloadOperation.h
//  TVShowsCoreData
//
//  Created by Daniel García on 30/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "IHOperation.h"
#import <UIKit/UIKit.h>

@interface ImageDownloadOperation : IHOperation
@property (strong,nonatomic) NSData *imageData;
- (instancetype)initWithImageURL:(NSURL *)imageURL;
@end
