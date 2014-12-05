//
//  MediaCellDrawer.m
//  TVShowsCoreData
//
//  Created by Daniel García on 31/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "MediaCellDrawer.h"
#import "MovieEntity.h"
#import "MovieCellDrawer.h"
#import "ShowEntity.h"
#import "ShowCellDrawer.h"

@implementation MediaCellDrawer
+ (instancetype)cellDrawerForMediaItem:(id)mediaItem{
    if ([mediaItem isKindOfClass:[MovieEntity class]]) {
        return [[MovieCellDrawer alloc]init];
    }else if ([mediaItem isKindOfClass:[ShowEntity class]]){
        return [[ShowCellDrawer alloc]init];
    }
    return nil;
}
- (void)drawCell:(UITableViewCell *)cell usingMediaItem:(id)mediaItem{
    
}
@end
