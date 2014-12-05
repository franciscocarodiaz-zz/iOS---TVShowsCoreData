//
//  MediaTableViewManager.h
//  TVShowsCoreData
//
//  Created by Daniel García on 31/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MediaTableViewManager,ShowEntity;
@protocol MediaTableViewManagerDelegate <NSObject>
- (void)tableViewManager:(MediaTableViewManager *)tableViewManager didSelectShow:(ShowEntity *)show;
@end

@interface MediaTableViewManager : NSObject<UITableViewDataSource,UITableViewDelegate>
@property (weak,nonatomic) UITableView *tableView;
@property (weak,nonatomic) id<MediaTableViewManagerDelegate> delegate;
- (instancetype)initWithDelegate:(id<MediaTableViewManagerDelegate>)delegate;
- (void)addItemsFromArray:(NSArray *)items;
@end
