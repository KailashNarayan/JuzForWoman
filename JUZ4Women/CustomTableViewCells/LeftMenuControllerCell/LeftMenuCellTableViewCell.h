//
//  LeftMenuCellTableViewCell.h
//  IGBeacon
//
//  Created by Kailash on 1/19/15.
//  Copyright (c) 2015 IG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftMenuCellTableViewCell : UITableViewCell

@property (nonatomic) IBOutlet UIImageView *cellImageView;
@property (nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) IBOutlet UIImageView *borderImageView;


@end
