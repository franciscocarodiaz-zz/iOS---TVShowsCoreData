//
//  MovieCellDrawer.m
//  TVShowsCoreData
//
//  Created by Daniel García on 31/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "MovieCellDrawer.h"
#import "MovieEntity.h"
#import "ShowsTableViewCell.h"

@implementation MovieCellDrawer
- (void)drawCell:(ShowsTableViewCell *)cell usingMediaItem:(MovieEntity *)mediaItem{
    MovieEntity *movie  = mediaItem;
    cell.showTitleLabel.text = movie.movieTitle;
    NSURL *imageURL = [NSURL URLWithString:movie.moviePosterURL];
    [cell.showBannerImageView sd_setImageWithURL:imageURL completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}
@end
