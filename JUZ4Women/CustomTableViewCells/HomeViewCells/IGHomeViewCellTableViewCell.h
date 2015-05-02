//
//  IGHomeViewCellTableViewCell.h
//  IGBeacon
//
//  Created by Kailash on 1/6/15.
//  Copyright (c) 2015 IG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IGHomeViewCellTableViewCell : UITableViewCell

@property (nonatomic) UILabel *cellLabel;
@property (weak, nonatomic) IBOutlet UILabel *offerLabel;

@property (weak, nonatomic) IBOutlet UIImageView *offerImageView;

@property (weak, nonatomic) IBOutlet UIImageView *borderImageView;
@end
