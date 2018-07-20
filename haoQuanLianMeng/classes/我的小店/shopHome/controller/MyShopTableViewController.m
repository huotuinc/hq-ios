//
//  MyShopTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/3.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MyShopTableViewController.h"
#import "ShopHomeHeader.h"
#import "ShuListTableViewCell.h"
#import "ShopSettingTableViewController.h"
#import "ShopGoodModel.h"
#import "ShopAccountModel.h"
#import "ShopHuoKuanController.h"
#import "ShopHomeRight.h"
#import "XDMenuView.h"
#import "GoodMoneyTableViewController.h"
#import <WXApi.h>

@interface MyShopTableViewController ()<ShopHomeHeaderDelegate>



@property (nonatomic,strong) ShopHomeHeader * Shopheader;


@property (nonatomic,strong) UIButton * leftBtn;

@property (nonatomic,strong) UIButton * rightBtn;

@end

@implementation MyShopTableViewController

- (UIButton *)rightBtn{
    if (_rightBtn == nil) {
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [_rightBtn setImage:[UIImage imageNamed:@"shopMore"] forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(rightClicl:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}



- (void)shareXiaoChengXu{
    
}

- (void)rightClicl:(UIButton *)btn{
    
    XDMenuView * menu = [XDMenuView menuViewWithSender:btn];
    menu.backColor = LWColor(63, 66, 79);
    XDMenuItem * item1 = [XDMenuItem item:@"小店充值" icon:@"shopInMoney" clickBlock:^(XDMenuItem *item, XDMenuView *menu) {
        ShopHuoKuanController * vc = [[ShopHuoKuanController alloc] initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    XDMenuItem * item2 = [XDMenuItem item:@"分享小店" icon:@"shopShare" clickBlock:^(XDMenuItem *item, XDMenuView *menu) {
        
        [[WXLoginShare shareInstance] WXShareXiaoChengXu:@""];
   
    }];
    XDMenuItem * item3 = [XDMenuItem item:@"货款流水" icon:@"shopHuoKuanLiuShui" clickBlock:^(XDMenuItem *item, XDMenuView *menu) {
        GoodMoneyTableViewController * vc = [[GoodMoneyTableViewController alloc] initWithStyle:UITableViewStylePlain];
        vc.title = @"货款流水";
        [self.navigationController pushViewController:vc animated:YES];
    }];

    [menu addItem:item1];
    [menu addItem:item2];
    [menu addItem:item3];
    //弹出
    [self presentViewController:menu animated:YES completion:nil];
}



- (UIButton *)leftBtn{
    if (_leftBtn == nil) {
        _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [_leftBtn setImage:[UIImage imageNamed:@"shopNavLeft"] forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}


- (void)btnclick{
    
    ShopSettingTableViewController * cx = [[UIStoryboard storyboardWithName:@"Shop" bundle:nil] instantiateViewControllerWithIdentifier:@"ShopSettingTableViewController"];
    [self.navigationController pushViewController:cx animated:YES];
}


- (void)ShopHomeHeaderClick:(int)option{
    
    
}


- (ShopHomeHeader *)Shopheader{
    if (_Shopheader == nil) {
        _Shopheader = [[ShopHomeHeader alloc] init];
        _Shopheader.backgroundColor = [UIColor whiteColor];
        _Shopheader.delegate = self;
    }
    return _Shopheader;
}


- (void)getShopAccount{

    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"user/userAccountInfo" parame:nil isHud:NO isHaseCache:NO success:^(id json) {
        
        ShopAccountModel * model = [ShopAccountModel mj_objectWithKeyValues:json[@"data"]];
        if (model != nil) {
            [self.Shopheader configure:model];
        }
        LWLog(@"%@",json);
    } failure:^(NSError *error) {
        
    }];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftBtn];
    
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    
    self.Shopheader.frame = CGRectMake(0, 0, KScreenWidth, 44);
    self.tableView.tableHeaderView = self.Shopheader;
    
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[ShuListTableViewCell class] forCellReuseIdentifier:@"ShuListTableViewCell"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self getShopAccount];
    [self getInitData:0];
}


- (void)refreshHeader{
    
    self.refreshPageIndex = 1;
    [self getInitData:0];
    
}

- (void)refreshFooter{
    
    self.refreshPageIndex += 1;
    [self getInitData:1];
    
}


- (void)getInitData:(int)type{

    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"page"] = @(self.refreshPageIndex);
    dict[@"pageSize"] = @(10);
    [[HTNetworkingTool HTNetworkingManager]
        HTNetworkingToolPost:@"store/index"
                      parame:dict
                       isHud:YES isHaseCache:NO
                     success:^(id json) {
                         
                         NSArray * dataArray = [ShopGoodModel mj_objectArrayWithKeyValuesArray:json[@"data"]];
                         if (type == 0) {
                             [self.dataArray removeAllObjects];
                         }
                         [self.dataArray addObjectsFromArray:dataArray];
                         [self.tableView reloadData];
                         [self.tableView.mj_header endRefreshing];
                         [self.tableView.mj_footer endRefreshing];
                         LWLog(@"%@",json);
                     } failure:^(NSError *error) {
            LWLog(@"%@",error);
        }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count / 2 + self.dataArray.count % 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ShuListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShuListTableViewCell" forIndexPath:indexPath];
    int a = (int)indexPath.row * 2;
    int b = a + 1;
    if (b + 1 <= self.dataArray.count) {
        cell.haveRight = YES;
        cell.rightdataModel = [self.dataArray objectAtIndex:b];
    }else{
        cell.haveRight = NO;
    }
    cell.leftdataModel = [self.dataArray objectAtIndex:a];
    // Configure the cell...
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * vc = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 10)];
    return vc;
}
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
