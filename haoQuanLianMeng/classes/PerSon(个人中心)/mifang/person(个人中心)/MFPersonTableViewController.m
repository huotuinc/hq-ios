//
//  MFPersonTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/14.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MFPersonTableViewController.h"
#import "MFPersonHeaderView.h"
#import "VipTimeTableViewCell.h"
#import "MyWalletTableViewCell.h"
#import "EightTableViewCell.h"
#import "YiJianViewController.h"
#import "MessageContainViewController.h"
#import "HTSettingTableViewController.h"
#import "MyWalletTableViewController.h"
#import "InComeController.h"
#import "BuyAccountTableViewController.h"
#import "MyTeamController.h"
#import "TuiGuangViewController.h"
#import "DianZhuViewController.h"
#import "MiFangUserCenterModel.h"
#import "ErWeiMaView.h"
#import "MPBannerTableViewCell.h"


@interface MFPersonTableViewController ()<MFPersonHeaderViewDelegate,MyWalletTableViewDelegate,VipTimeTableViewDelegate>


@property (nonatomic,strong) MFPersonHeaderView * mpPersonHeaderView;

@property (nonatomic,strong) MiFangUserCenterModel * model;


@property (nonatomic,strong) ErWeiMaView * erView;


@property (nonatomic,strong) NSMutableArray * bannerList;

@end

@implementation MFPersonTableViewController



- (NSMutableArray *)bannerList{
    if (_bannerList == nil) {
        _bannerList = [NSMutableArray array];
    }
    return _bannerList;
}

- (ErWeiMaView *)erView{
    if (_erView == nil) {
        _erView = [[ErWeiMaView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    }
    return _erView;
}


- (MFPersonHeaderView *)mpPersonHeaderView{
    if (_mpPersonHeaderView == nil) {
        _mpPersonHeaderView = [[MFPersonHeaderView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kAdaptedWidth(156))];
        _mpPersonHeaderView.delegate = self;
//        _mpPersonHeaderView.backgroundColor = [UIColor redColor];
    }
    return _mpPersonHeaderView;
}



- (void)MFPersonHeaderViewClick:(int)opetion{
    
    if (!opetion) {
        HTSettingTableViewController * vc = [[UIStoryboard storyboardWithName:@"Person" bundle:nil] instantiateViewControllerWithIdentifier:@"HTSettingTableViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        
//        UIView * a = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
//        a.backgroundColor = [UIColor co];
        [self.view.window addSubview:self.erView];
        
    }
    LWLog(@"%d",opetion);
}



- (void)setUpInit:(MiFangUserCenterModel *)model{
    
    LWLog(@"%@",model.UserName);
    [self.mpPersonHeaderView configWithData:model];
    self.model = model;
    [self.tableView reloadData];
}


- (void)viewWillAppear:(BOOL)animate{
    [super viewWillAppear:animate];
    
    [self aspect_hookSelector:@selector(MFPersonHeaderViewClick:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo)
     {
         //NSLog(@"viewDidLoad调用了 --- %@ --- %@ --- %@",aspectInfo.instance,aspectInfo.arguments, aspectInfo.originalInvocation);
         
         
         if (aspectInfo) {
             if (aspectInfo.arguments[0]) {
                 [HTNetworkingTool HTNetworkingToolGet:@"user/getqrcode" parame:nil isHud:YES isHaseCache:NO success:^(id json) {
                     LWLog(@"%@",json);
                     self.erView.url = json[@"data"][@"QRCodeImgURL"];
                 } failure:nil];
             }
         }
         /**
          *  添加我们要执行的代码，由于withOptions是AspectPositionAfter。
          *  所以每个控制器的viewDidLoad触发都会执行下面的方法
          */
//         [self doSomethings];
     } error:NULL];
    
}
    
  

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
//    http://api.mingshz.com/mock/65/user/Index
    [HTNetworkingTool HTNetworkingToolGet:@"user/Index" parame:nil isHud:YES isHaseCache:NO success:^(id json) {
        LWLog(@"%@",json);
        MiFangUserCenterModel * model = [MiFangUserCenterModel mj_objectWithKeyValues:json[@"data"]];
        [self setUpInit:model];
    } failure:^(NSError *error) {
        LWLog(@"%@",error);
    }];

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableHeaderView = self.mpPersonHeaderView;
    
    self.tableView.sectionHeaderHeight = 10;
    self.tableView.sectionFooterHeight = 1;
    
    [self.tableView registerClass:[VipTimeTableViewCell class] forCellReuseIdentifier:@"VipTimeTableViewCell"];
    [self.tableView registerClass:[MyWalletTableViewCell class] forCellReuseIdentifier:@"MyWalletTableViewCell"];
    [self.tableView registerClass:[EightTableViewCell class] forCellReuseIdentifier:@"EightTableViewCell"];
    [self.tableView registerClass:[MPBannerTableViewCell class] forCellReuseIdentifier:@"MPBannerTableViewCell"];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 2 ) {
        
        return self.model.ADList.count ? 1 : 0;
        //return 0;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

        if (indexPath.section == 0){
            VipTimeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"VipTimeTableViewCell" forIndexPath:indexPath];
            cell.delegate = self;
            [cell configWithData:self.model];
            return cell;
        } else if(indexPath.section == 1){

            MyWalletTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MyWalletTableViewCell" forIndexPath:indexPath];
            cell.delegate = self;
            [cell configWithData:self.model];
            return cell;
        }else if(indexPath.section == 2){
            
            MPBannerTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MPBannerTableViewCell" forIndexPath:indexPath];
            [cell configWithData:self.model];
            return cell;
        }else{
            EightTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"EightTableViewCell" forIndexPath:indexPath];
            KWeakSelf(self);
            cell.block = ^(NSUInteger item) {
                LWLog(@"%lu",(unsigned long)item);
                [weakself click:item];
            };
            return cell;
            
        }

    
    

}



- (void)click:(NSUInteger) index{
    
   
    switch (index) {
        
        case 0:{
            InComeController * vc =  [[InComeController alloc] initWithStyle:UITableViewStyleGrouped];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:{
            TuiGuangViewController * vc =  [[TuiGuangViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:{
            MyTeamController * vc =  [[MyTeamController alloc] initWithStyle:UITableViewStyleGrouped];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:{
            DianZhuViewController * vc =  [[DianZhuViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 4:{
            MessageContainViewController * vc =  [[MessageContainViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case 6:{
            YiJianViewController * vc =  [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"YiJianViewController"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 7:{
            HTSettingTableViewController * vc = [[UIStoryboard storyboardWithName:@"Person" bundle:nil] instantiateViewControllerWithIdentifier:@"HTSettingTableViewController"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
            
        default:
            break;
    }
}
//YiJianViewController

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
     UIView * view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, KScreenWidth, 10);
    view.backgroundColor = [UIColor clearColor];
    return view;
}




- (void)MyWalletTopViewClick:(int)type{
    LWLog(@"xxxx");
    
    MyWalletTableViewController * vc = [[UIStoryboard storyboardWithName:@"Person" bundle:nil] instantiateViewControllerWithIdentifier:@"MyWalletTableViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}



- (void)xufeiClick{
  
    BuyAccountTableViewController * vc = [[BuyAccountTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:vc animated:YES];
}
//HTSettingTableViewController * vc = [[UIStoryboard storyboardWithName:@"Person" bundle:nil] instantiateViewControllerWithIdentifier:@"HTSettingTableViewController"];
//[self.navigationController pushViewController:vc animated:YES];
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 10;
//}
////脚视图高度
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 1;
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
