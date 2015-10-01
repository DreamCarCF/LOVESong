//
//  DetailViewController.m
//  iLiMiFree
//
//  Created by Flying meat on 9/1/15.
//  Copyright (c) 2015 CaoFeng. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
#import "TimeFreeViewController.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "HttpRequestManager.h"
#import "TimeFree.h"
#import "AllInterFace.h"
#import "Collect.h"
#import <CoreData/CoreData.h>
@interface DetailViewController ()

{
    NSManagedObjectContext *_context;
    NSMutableArray *_detailAppArray;
    
    NSMutableArray *_collectArray;
    NSData *_imgdata;
    NSString*_str;
}
@end

@implementation DetailViewController
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _detailAppArray=[[NSMutableArray alloc]init];
        _collectArray=[NSMutableArray new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label=[[UILabel alloc]init];
    label.frame=CGRectMake(self.view.frame.size.width/2-50, 20, 50,40);
    label.text=@"应用详情";
    label.font=[UIFont systemFontOfSize:26];
    label.textColor=[UIColor brownColor];
    self.ItemDetail.titleView=label;
    
//    [_collectArray removeAllObjects];
//    
//    NSFetchRequest *request=[[NSFetchRequest alloc]init];
//    //读取的实体
//    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Collect" inManagedObjectContext:_context];
//    
//    //设置实体
//    request.entity=entity;
//    
//    NSArray *resultArray=[_context executeFetchRequest:request error:nil];
//    [_collectArray addObjectsFromArray:resultArray];
    
    
    
    //在调试中出现如下错误，添加委托代码可解决。
/*    'NSInvalidArgumentException', reason: '+entityForName: nil is not a legal NSManagedObjectContext parameter searching for entity name 'Events''*/
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    _context = [appDelegate managedObjectContext];
    
    
    //2.监测网络状态,如果有网,则从网络获取
    [self observeNetStatus];
}
-(void)observeNetStatus
{
    //检测网络状态
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
    //状态发生改变
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status==AFNetworkReachabilityStatusNotReachable) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"没有网络连接" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }else
        {
            //从网络上获取数据
            [self loadDataFromNet];
            
        }
    }];
    
}
-(void)loadDataFromNet
{
    AFHTTPRequestOperationManager *managerapp=[AFHTTPRequestOperationManager manager];

     NSString *url2=[NSString stringWithFormat:NearByURL];

    [managerapp GET:url2 parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSArray *appArray=responseObject[@"applications"];

        [self.appimgViewOne setImageWithURL:[NSURL URLWithString:appArray[0][@"iconUrl"]]];
        self.oneLabel.text=appArray[0][@"name"];
        self.oneLabel.adjustsFontSizeToFitWidth=YES;
        self.appimgViewOne.userInteractionEnabled=YES;
        UITapGestureRecognizer *tap0=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(one:)];
        NSString *str1=appArray[0][@"applicationId"];
        [_detailAppArray addObject:str1];
        self.appimgViewOne.tag=1;
        [self.appimgViewOne addGestureRecognizer:tap0];
        
        
        
        [self.appimgViewTwo setImageWithURL:[NSURL URLWithString:appArray[1][@"iconUrl"]]];
        self.secondLabel.text=appArray[1][@"name"];
        self.secondLabel.adjustsFontSizeToFitWidth=YES;
        self.appimgViewTwo.userInteractionEnabled=YES;
        UITapGestureRecognizer *tap1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(one:)];
        NSString *str2=appArray[1][@"applicationId"];
        [_detailAppArray addObject:str2];
        self.appimgViewTwo.tag=2;
        [self.appimgViewTwo addGestureRecognizer:tap1];
       
        
        [self.appimgThree setImageWithURL:[NSURL URLWithString:appArray[2][@"iconUrl"]]];
        self.thirdLabel.text=appArray[2][@"name"];
        self.thirdLabel.adjustsFontSizeToFitWidth=YES;
        self.appimgThree.userInteractionEnabled=YES;
        UITapGestureRecognizer *tap2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(one:)];
        NSString *str3=appArray[2][@"applicationId"];
        [_detailAppArray addObject:str3];
        self.appimgThree.tag=3;
        [self.appimgThree addGestureRecognizer:tap2];
        
        [self.appimgFour setImageWithURL:[NSURL URLWithString:appArray[3][@"iconUrl"]]];
        self.fourthLabel.text=appArray[3][@"name"];
        self.fourthLabel.adjustsFontSizeToFitWidth=YES;
        self.appimgFour.userInteractionEnabled=YES;
        UITapGestureRecognizer *tap3=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(one:)];
        NSString *str4=appArray[3][@"applicationId"];
        [_detailAppArray addObject:str4];
        self.appimgFour.tag=4;
        [self.appimgFour addGestureRecognizer:tap3];
        
        [self.appimgFive setImageWithURL:[NSURL URLWithString:appArray[4][@"iconUrl"]]];
        self.fifthLabel.text=appArray[4][@"name"];
        self.fifthLabel.adjustsFontSizeToFitWidth=YES;
        self.appimgFive.userInteractionEnabled=YES;
        UITapGestureRecognizer *tap4=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(one:)];
        NSString *str5=appArray[4][@"applicationId"];
        [_detailAppArray addObject:str5];
        self.appimgFive.tag=5;
        [self.appimgFive addGestureRecognizer:tap4];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"请求数据失败,error==%@",error);
    }];
    
    
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    
    NSString *url=[NSString stringWithFormat:AppDetailURL,_sendID];
   [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
       [self.headImgView setImageWithURL:[NSURL URLWithString:responseObject[@"iconUrl"]]];
       
     _imgdata=[NSData dataWithContentsOfURL:[NSURL URLWithString:responseObject[@"iconUrl"]]];
       NSArray *detailArray=responseObject[@"photos"];
       if (detailArray.count>4) {
           
       [self.detailimgViewOne setImageWithURL:[NSURL URLWithString:detailArray[0][@"originalUrl"]]];
       [self.detailimgViewTwo setImageWithURL:[NSURL URLWithString:detailArray[1][@"originalUrl"]]];
       [self.detailimgViewThree setImageWithURL:[NSURL URLWithString:detailArray[2][@"originalUrl"]]];
       [self.detailimgViewFour setImageWithURL:[NSURL URLWithString:detailArray[3][@"originalUrl"]]];
       [self.detailimgViewFive setImageWithURL:[NSURL URLWithString:detailArray[4][@"originalUrl"]]];
       }
       else if (detailArray.count==4)
       {[self.detailimgViewOne setImageWithURL:[NSURL URLWithString:detailArray[0][@"originalUrl"]]];
           [self.detailimgViewTwo setImageWithURL:[NSURL URLWithString:detailArray[1][@"originalUrl"]]];
           [self.detailimgViewThree setImageWithURL:[NSURL URLWithString:detailArray[2][@"originalUrl"]]];
           [self.detailimgViewFour setImageWithURL:[NSURL URLWithString:detailArray[3][@"originalUrl"]]];
           self.detailimgViewFive=nil;
           
           
       }else if (detailArray.count==3)
       {
           [self.detailimgViewOne setImageWithURL:[NSURL URLWithString:detailArray[0][@"originalUrl"]]];
           [self.detailimgViewTwo setImageWithURL:[NSURL URLWithString:detailArray[1][@"originalUrl"]]];
           [self.detailimgViewThree setImageWithURL:[NSURL URLWithString:detailArray[2][@"originalUrl"]]];
           self.detailimgViewFour=nil;
           self.detailimgViewFive=nil;
       }
       
       

        self.GameNameLabel.text=responseObject[@"name"];
       _str=self.GameNameLabel.text;
       
       [_collectArray removeAllObjects];
       NSFetchRequest *request=[[NSFetchRequest alloc]init];
       
       NSEntityDescription *entity=[NSEntityDescription entityForName:@"Collect" inManagedObjectContext:_context];
       request.entity=entity;
       NSArray *resultArray=[_context executeFetchRequest:request error:nil];
       
       
       
       [_collectArray addObjectsFromArray:resultArray];
       
       for (Collect *model in _collectArray) {
           if ([model.name isEqualToString:self.GameNameLabel.text]) {
               [self.buttonCollect setTitle:@"取消收藏" forState:UIControlStateNormal];
           }
       }
       
        self.priceLabel.text=responseObject[@"lastPrice"];
        self.filesizeLabel.text=responseObject[@"fileSize"];
        self.starsLabel.text=responseObject[@"starCurrent"];
        self.contentLabel.text=responseObject[@"description_long"];
//       self.contentLabel.adjustsFontSizeToFitWidth=YES;
       [_collectArray addObject:self.GameNameLabel.text];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求数据失败,error==%@",error);
        
    }];
    
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
   
    
    
}

-(void)one:(UITapGestureRecognizer*)tap
{
   
    DetailViewController *detailVC=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
    detailVC.sendID=_detailAppArray[tap.view.tag-1];

    
    
    
}

- (IBAction)collect:(id)sender {
    if ([self.buttonCollect.currentTitle isEqualToString:@"收藏"]) {
        

        
        Collect*model=[NSEntityDescription insertNewObjectForEntityForName:@"Collect" inManagedObjectContext:_context];
        NSLog(@"self===%@",self.GameNameLabel.text);
        model.img=_imgdata;
        model.name=self.GameNameLabel.text;
        [_context save:nil];
     
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"已收藏" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        [self.buttonCollect setTitle:@"取消收藏" forState:UIControlStateNormal];

        
        
        
    }else
    {
        

       
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Collect" inManagedObjectContext:_context];
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        [request setIncludesPropertyValues:NO];
        [request setEntity:entity];
        NSError *error = nil;
        NSArray *datas = [_context executeFetchRequest:request error:&error];
        if (!error && datas && [datas count])
        {

            
                [_context deleteObject:datas.lastObject];
            
            if (![_context save:&error])
            {
                NSLog(@"error:%@",error);
            }    
        }
        
        [self.buttonCollect setTitle:@"收藏" forState:UIControlStateNormal];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"已取消收藏" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];

    }
}



- (IBAction)back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
