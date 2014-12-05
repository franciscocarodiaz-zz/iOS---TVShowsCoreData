//
//  DetailViewController.m
//  TVShowsCoreData
//
//  Created by Daniel García on 29/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "DetailViewController.h"
#import "UIButton+Blocks.h"
#import "ShowEntity.h"
#import "ShowDetailView.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (strong, nonatomic) ShowEntity *show;
@property (weak,nonatomic) ShowDetailView *detailView;
@end

@implementation DetailViewController
- (ShowDetailView *)detailView{
    return (ShowDetailView *)self.view;
}
- (instancetype)initWithShow:(ShowEntity *)show
{
    self = [super init];
    if (self) {
        _show = show;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.showTitleLabel.text = self.show.showName;
    
    __weak typeof(self) weakSelf = self;
    [self.likeButton setActionBlock:(void(^)())^{
        __strong typeof(weakSelf) self = weakSelf;
        
        [self.showTitleLabel setText:[NSString stringWithFormat:@"%@ like!",self.showTitleLabel.text]];
        
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)dealloc{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}
@end
