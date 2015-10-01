//
//  colloctViewController.m
//  iLiMiFree
//
//  Created by Flying meat on 9/2/15.
//  Copyright (c) 2015 CaoFeng. All rights reserved.
//

#import "colloctViewController.h"
#import "AppDelegate.h"
#import "CustomViewcollection.h"
#import "Collect.h"
#import <CoreData/CoreData.h>
@interface colloctViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>



{
    NSManagedObjectContext *_context;
    NSMutableArray *_dataArray;
}
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@end

@implementation colloctViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _dataArray=[NSMutableArray new];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label=[[UILabel alloc]init];
    label.frame=CGRectMake(self.view.frame.size.width/2-50, 20, 50,40);
    label.text=@"我的收藏";
    label.font=[UIFont systemFontOfSize:20];
    label.textColor=[UIColor brownColor];
    self.item.titleView=label;
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    _context = [appDelegate managedObjectContext];
    [self loadFromCore];
}

-(void)loadFromCore
{
    [_dataArray removeAllObjects];
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    //读取的实体
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Collect" inManagedObjectContext:_context];
    
    //设置实体
    request.entity=entity;
    
    NSArray *resultArray=[_context executeFetchRequest:request error:nil];
    [_dataArray addObjectsFromArray:resultArray];

    

    
    
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
    
    CustomViewcollection *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"CustomViewcollect" forIndexPath:indexPath];


//    cell.imgview.image=[UIImage imageNamed:_dataArray[indexPath.row]];
    Collect*model=_dataArray[indexPath.row];
    cell.collectimgView.image=[UIImage imageWithData:model.img];
    cell.collectNameLabel.text=model.name;
    cell.collectNameLabel.adjustsFontSizeToFitWidth=YES;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    [_context deleteObject:_dataArray[indexPath.row]];

    [_dataArray removeObjectAtIndex:indexPath.row];
    
    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
    
    [_context save:nil];
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
