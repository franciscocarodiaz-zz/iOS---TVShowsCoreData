//
//  ViewController.m
//  TVShowsCoreData
//
//  Created by Daniel García on 28/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "ViewController.h"
#import "ShowEntity.h"
#import "DetailViewController.h"
#import "ListShowsInteractor.h"
#import "ListMoviesInteractor.h"
#import "MediaTableViewManager.h"

@interface ViewController ()<MediaTableViewManagerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ListShowsInteractor *listShowsInteractor;
@property (strong, nonatomic) ListMoviesInteractor *listMoviesInteractor;
@property (strong, nonatomic) MediaTableViewManager *tableViewManager;
@end

@implementation ViewController

- (ListShowsInteractor *)listShowsInteractor{
    if (!_listShowsInteractor) {
        _listShowsInteractor = [[ListShowsInteractor alloc]init];
    }
    return _listShowsInteractor;
}
- (ListMoviesInteractor *)listMoviesInteractor{
    if (!_listMoviesInteractor) {
        _listMoviesInteractor = [[ListMoviesInteractor alloc]init];
    }
    return _listMoviesInteractor;
}
- (MediaTableViewManager *)tableViewManager{
    if (!_tableViewManager) {
        _tableViewManager = [[MediaTableViewManager alloc]initWithDelegate:self];
    }
    return _tableViewManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewManager.tableView = self.tableView;
    [self.listShowsInteractor listOfShowsWithCompletionBlock:^(NSArray *shows) {
        [self.tableViewManager addItemsFromArray:shows];
    }];
    [self.listMoviesInteractor listOfMoviesWithCompletionBlock:^(NSArray *movies) {
        [self.tableViewManager addItemsFromArray:movies];
    }];
    
}
#pragma mark - MediaTableViewManagerDelegate
- (void)tableViewManager:(MediaTableViewManager *)tableViewManager didSelectShow:(ShowEntity *)show{
    DetailViewController *detailVC = [[DetailViewController alloc]initWithShow:show];
    [self.navigationController pushViewController:detailVC animated:YES];
}
@end
