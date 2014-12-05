//
//  ShowsTableViewCell.h
//  TVShowsCoreData
//
//  Created by Daniel García on 30/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *showTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *showBannerImageView;

@end
