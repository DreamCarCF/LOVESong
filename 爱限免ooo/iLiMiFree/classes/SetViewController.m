//
//  SetViewController.m
//  iLiMiFree
//
//  Created by Flying meat on 9/2/15.
//  Copyright (c) 2015 CaoFeng. All rights reserved.
//

#import "SetViewController.h"
#import "CustomViewCell.h"
#import "ItemModel.h"
#import "colloctViewController.h"
@interface SetViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *_dataArray;
    NSMutableArray *_titleArray;
}
@end

@implementation SetViewController
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _dataArray=[NSMutableArray new];
        _titleArray=[NSMutableArray new];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label=[[UILabel alloc]init];
    label.frame=CGRectMake(self.view.frame.size.width/2-50, 20, 50,40);
    label.text=@"设置";
    label.font=[UIFont systemFontOfSize:30];
    label.textColor=[UIColor orangeColor];
    self.item.titleView=label;
    
  
    NSString *img1=@"account_setting.png";
    NSString*title1=@"我的设置";
    NSString*img2=@"account_user.png";
    NSString*title2=@"我的账户";
    NSString *img3=@"account_help.png";
    NSString*title3=@"我的帮助";
    NSString *img4=@"account_favorite.png";
    NSString*title4=@"扫描应用";
    NSString*img5=@"account_download.png";
    NSString*title5=@"我的下载";
    NSString*img6=@"account_comment.png";
    NSString*title6=@"查找附近";
    NSString*img7=@"account_collect.png";
    NSString*title7=@"我的收藏";
    NSString*img8=@"account_candou.png";
    NSString*title8=@"蚕豆应用";
    _dataArray=[[NSMutableArray alloc]initWithObjects:img1,img2,img3,img4,img5,img6,img7,img8,nil];
    _titleArray=[[NSMutableArray alloc]initWithObjects:title1,title2,title3,title4,title5,title6,title7,title8, nil];
    
    
    
}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    
    return 1;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _dataArray.count;
    
    
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSLog(@"model.imgName==%@",_dataArray[indexPath.row]);
    cell.imgview.image=[UIImage imageNamed:_dataArray[indexPath.row]];
    cell.myLabel.text=_titleArray[indexPath.row];
    return cell;    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_dataArray[indexPath.row] isEqualToString:@"account_collect.png"]) {
        colloctViewController*colloctVC=[self.storyboard instantiateViewControllerWithIdentifier:@"colloctViewController"];
        [self.navigationController pushViewController:colloctVC animated:YES];
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
