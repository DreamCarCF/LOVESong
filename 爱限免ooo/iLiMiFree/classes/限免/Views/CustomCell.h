//
//  CustomCell.h
//  iLiMiFree
//
//  Created by Flying meat on 9/1/15.
//  Copyright (c) 2015 CaoFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *starsLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *cateNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sharesLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoritesLabel;
@property (weak, nonatomic) IBOutlet UILabel *downloadsLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *frontView;
@property (weak, nonatomic) IBOutlet UIImageView *backStars;
@property (weak, nonatomic) IBOutlet UIImageView *frontStarView;
@property (weak, nonatomic) IBOutlet UIView *imgStarsView;
@property (copy,nonatomic) NSString*applicationId;
@end
