//
//  MediaCellDrawer.h
//  TVShowsCoreData
//
//  Created by Daniel García on 31/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface MediaCellDrawer : NSObject
+ (instancetype)cellDrawerForMediaItem:(id)mediaItem;
- (void)drawCell:(UITableViewCell *)cell usingMediaItem:(id)mediaItem;
@end
