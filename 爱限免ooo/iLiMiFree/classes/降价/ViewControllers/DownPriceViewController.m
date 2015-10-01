//
//  DownPriceViewController.m
//  iLiMiFree
//
//  Created by Flying meat on 9/1/15.
//  Copyright (c) 2015 CaoFeng. All rights reserved.
//

#import "DownPriceViewController.h"
#import "AFNetworking.h"
#import "MJRefresh.h"
#import "DetailViewController.h"
#import "Helper.h"
#import "UIImageView+AFNetworking.h"
#import "HttpRequestManager.h"
#import "TimeFree.h"
#import "CustomdownCell.h"
#import "SetViewController.h"
@interface DownPriceViewController ()<UITableViewDataSource,UITableViewDelegate,MJRefreshBaseViewDelegate>
{
    int _currentPage;//上拉刷新需要修改
    NSMutableArray *_dataArray;
    BOOL _isDragDown;
    MJRefreshFooterView *_foot;
    MJRefreshHeaderView *_head;
}
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@end

@implementation DownPriceViewController
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _currentPage=1;
        _dataArray=[NSMutableArray new];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel*label=[[UILabel alloc]init];
    label.frame=CGRectMake(self.view.frame.size.width/2-50, 5, 50, 50);
    label.text=@"降 价";
    label.font=[UIFont systemFontOfSize:30];
    label.textColor=[UIColor redColor];
    self.item.titleView=label;
   
    _foot = [[MJRefreshFooterView alloc]init];
    _foot.scrollView = _myTableView;
    _foot.delegate =self;
    
    _head = [[MJRefreshHeaderView alloc]init];
    _head.scrollView = _myTableView;
    _head.delegate =self;
    
    
    
    
    
    
    
    [self addobserve];
}
-(void)addobserve
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

    [[HttpRequestManager shareInstance]getLimitInfoByPage:_currentPage tag:11 success:^(id responseObj) {
        
        if (_isDragDown) {
            [_dataArray removeAllObjects];
            
        }
        for (NSDictionary *dic in responseObj) {
            
            TimeFree *model=[TimeFree new];
            
            model.applicationId=dic[@"applicationId"];
            model.name=dic[@"name"];
            model.imgName=dic[@"iconUrl"];
            model.time=dic[@"expireDatetime"];
            model.stars=dic[@"starOverall"];
            model.price=dic[@"lastPrice"];
            model.categoryName=dic[@"categoryName"];
            model.shares=dic[@"shares"];
            model.favorites=dic[@"favorites"];
            model.downloads=dic[@"downloads"];

            [_dataArray addObject:model];



        }
        [_myTableView reloadData];
        
        //结束上下拉动画
        [_foot endRefreshing];
        [_head endRefreshing];
        
    } failure:^(NSError *error) {
        if (error) {
            NSLog(@"error==%@",error);
        }
        
    }];
    

    
    
    
}
- (IBAction)sey:(id)sender {
    
    SetViewController *setVC=[self.storyboard instantiateViewControllerWithIdentifier:@"SetViewController"];
    [self.navigationController pushViewController:setVC animated:YES];

}

#pragma mark -MJRefreshBaseViewDelegate
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if (refreshView == _head) {
        _isDragDown = YES;
        _currentPage=1;
    }else
    {
        _isDragDown = NO;
        _currentPage++;
    }
    //重新请求数据
    [self addobserve];
}
#pragma mark -UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _dataArray.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

   CustomdownCell*cell=[tableView dequeueReusableCellWithIdentifier:@"CustomdownCell"];
    TimeFree *model=_dataArray[indexPath.row];
    
    [cell.myImgView setImageWithURL:[NSURL URLWithString:model.imgName]];
    cell.nameLabel.text=model.name;
    

    cell.nameLabel.adjustsFontSizeToFitWidth=YES;
    
    NSDate *today=[NSDate date];
    NSDateFormatter *dateFormatter=[NSDateFormatter new];
    dateFormatter.dateFormat=@"YYYY--MM--dd HH:mm:ss.s";
    dateFormatter.timeZone=[NSTimeZone timeZoneWithName:@"Shenzhen"];
    NSString *dateString=[dateFormatter stringFromDate:today];
    NSDate *newtoday=[dateFormatter dateFromString:dateString];
    NSDate *newDate=[dateFormatter dateFromString:model.time];
    NSString *new=[Helper compareFromDate:newtoday toDate:newDate];
    
    cell.timeLabel.text=new;
    cell.starsLabel.text=model.stars;
    cell.starsimgView.clipsToBounds=YES;
    cell.starsimgView.frame=CGRectMake(124, 78, 20*[cell
                                                    .starsLabel.text floatValue], 30);
    cell.priceLabel.text=model.price;
    cell.cateNameLabel.text=model.categoryName;
    cell.sharesLabel.text=model.shares;
    cell.favoritesLabel.text=model.favorites;
    cell.downloadsLabel.text=model.downloads;
    cell.applicationId=model.applicationId;
    
    

    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor=[UIColor lightGrayColor];
    return cell;

        

    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailVC=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    [self.navigationController pushViewController:detailVC animated:YES];
    TimeFree *model=_dataArray[indexPath.row];
    detailVC.sendID=model.applicationId;
    
    
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
