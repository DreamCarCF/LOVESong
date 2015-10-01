//
//  DetailViewController.h
//  iLiMiFree
//
//  Created by Flying meat on 9/1/15.
//  Copyright (c) 2015 CaoFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UINavigationItem *ItemDetail;
@property(nonatomic,copy)NSString*sendID;
@property(nonatomic,copy)NSString*appID;
@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@property (weak, nonatomic) IBOutlet UILabel *GameNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *filesizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *starsLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *detailimgViewOne;
@property (weak, nonatomic) IBOutlet UIImageView *detailimgViewTwo;
@property (weak, nonatomic) IBOutlet UIImageView *detailimgViewThree;
@property (weak, nonatomic) IBOutlet UIImageView *detailimgViewFour;

@property (weak, nonatomic) IBOutlet UIImageView *detailimgViewFive;

@property (weak, nonatomic) IBOutlet UIImageView *appimgViewOne;

@property (weak, nonatomic) IBOutlet UIImageView *appimgViewTwo;

@property (weak, nonatomic) IBOutlet UIImageView *appimgThree;
@property (weak, nonatomic) IBOutlet UIImageView *appimgFour;
@property (weak, nonatomic) IBOutlet UIImageView *appimgFive;
@property (weak, nonatomic) IBOutlet UILabel *oneLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;
@property (weak, nonatomic) IBOutlet UILabel *fourthLabel;
@property (weak, nonatomic) IBOutlet UILabel *fifthLabel;

@property (weak, nonatomic) IBOutlet UIButton *buttonCollect;
 


@end
