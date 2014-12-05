//
//  ShowCellDrawer.m
//  TVShowsCoreData
//
//  Created by Daniel García on 31/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "ShowCellDrawer.h"
#import "ShowEntity.h"
#import "ShowsTableViewCell.h"

@implementation ShowCellDrawer
- (void)drawCell:(ShowsTableViewCell *)cell usingMediaItem:(ShowEntity *)mediaItem{
    ShowEntity *show = mediaItem;
    cell.showTitleLabel.text = show.showName;
    NSURL *imageURL = [NSURL URLWithString:show.showURL];
    [cell.showBannerImageView sd_setImageWithURL:imageURL completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}
@end
