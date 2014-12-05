//
//  MediaTableViewManager.m
//  TVShowsCoreData
//
//  Created by Daniel García on 31/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "MediaTableViewManager.h"
#import "ShowsTableViewCell.h"
#import "MediaCellDrawer.h"

@interface MediaTableViewManager ()
@property (strong,nonatomic) NSMutableArray *items;
@end
@implementation MediaTableViewManager

- (instancetype)initWithDelegate:(id<MediaTableViewManagerDelegate>)delegate
{
    self = [super init];
    if (self) {
        _delegate = delegate;
        _items = [NSMutableArray array];
    }
    return self;
}
- (void)addItemsFromArray:(NSArray *)items{
    [_items addObjectsFromArray:items];
    [self.tableView reloadData];
}
- (void)setTableView:(UITableView *)tableView{
    if (_tableView) {
        _tableView.delegate = nil;
        _tableView.dataSource = nil;
    }
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"ShowsTableViewCell";
    ShowsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[UINib nibWithNibName:cellIdentifier bundle:nil] instantiateWithOwner:self options:nil] firstObject];
    }
    id item = [self.items objectAtIndex:indexPath.row];
    
    MediaCellDrawer *cellDrawer = [MediaCellDrawer cellDrawerForMediaItem:item];
    [cellDrawer drawCell:cell usingMediaItem:item];
    
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    ShowEntity *show = [self.items objectAtIndex:indexPath.row];
//    [self.delegate tableViewManager:self didSelectShow:show];
}
@end
