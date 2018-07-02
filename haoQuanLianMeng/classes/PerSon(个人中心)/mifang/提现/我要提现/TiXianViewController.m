//
//  TiXianViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/20.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TiXianViewController.h"
#import "TiXianTopView.h"
#import "TiXianCenterCell.h"
#import "TiXianBottomTableViewCell.h"
#import "TiXianFooterView.h"
#import "TiXianListTableViewController.h"
#import "AccountListController.h"
#import "WoYaoTiXian.h"


@interface TiXianViewController ()<TiXianFooterViewDelegate,AccountListControllerDelegate>


@property (nonatomic,strong) TiXianFooterView * footer;

@property (nonatomic,strong) WoYaoTiXian * model;



@property (nonatomic,strong) TiXianBottomTableViewCell * cell;

@property (nonatomic,strong) TiXianTopView * accountCell;

@end

@implementation TiXianViewController


- (TiXianFooterView *)footer{
    if (_footer == nil) {
        _footer = [[TiXianFooterView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 500)];
        _footer.delegate = self;
    }
    return _footer;
}


//提现记录
- (void)TiXianListClick{
    
    TiXianListTableViewController * vc = [[TiXianListTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:vc animated:YES];
    LWLog(@"xxx");
}

//提现记录
- (void)TiXianBtnClick{
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:1];
//    TiXianBottomTableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:@"TiXianBottomTableViewCell" forIndexPath:indexPath];
    int a =  [self.cell getTixinMoney];
    LWLog(@"%d",a);
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"AccountId"] = @(self.model.AccountId);
    dict[@""] = @(a * 1000);
    [HTNetworkingTool HTNetworkingToolPost:@"user/SubmitApply" parame:dict isHud:YES isHaseCache:NO success:^(id json) {
        LWLog(@"%@",json);
    } failure:nil];
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [HTNetworkingTool HTNetworkingToolGet:@"user/ApplyIndex" parame:nil isHud:YES isHaseCache:NO success:^(id json) {
        WoYaoTiXian * model = [WoYaoTiXian mj_objectWithKeyValues:json[@"data"]];
        LWLog(@"%@",[model mj_keyValues]);
        self.model = model;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我要提现";
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0,0, 0);
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    
    self.tableView.tableFooterView = self.footer;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    [self.tableView registerClass:[TiXianTopView class] forCellReuseIdentifier:@"TiXianTopView"];
    [self.tableView registerClass:[TiXianCenterCell class] forCellReuseIdentifier:@"TiXianCenterCell"];
    [self.tableView registerClass:[TiXianBottomTableViewCell class] forCellReuseIdentifier:@"TiXianBottomTableViewCell"];
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return section == 1 ? 2 : 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 0){
        TiXianTopView * cell = [tableView dequeueReusableCellWithIdentifier:@"TiXianTopView" forIndexPath:indexPath];
        [cell configure:self.model];
        _accountCell = cell;
        return cell;
    } else if(indexPath.section == 1 && indexPath.row == 0){
        
        TiXianCenterCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TiXianCenterCell" forIndexPath:indexPath];
        [cell configure:self.model];
        return cell;
    }else{
        TiXianBottomTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TiXianBottomTableViewCell" forIndexPath:indexPath];
        [cell configure:self.model];
        self.cell = cell;
        LWLog(@"%p",&cell);
        return cell;
        
    }
    
    
    
    
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView * v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth , 10)];
    v.backgroundColor = [UIColor clearColor];
    return v;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        AccountListController * ac = [[AccountListController alloc] initWithStyle:UITableViewStylePlain];
        ac.delegate = self;
        [self.navigationController pushViewController:ac animated:YES];
    }
}


- (void)accountSelect:(AccountList *)model{
    LWLog(@"%@",model.AccountInfo);
    self.model.AccountId = model.AccountId;
    self.model.AccountInfo = model.AccountInfo;
//    self.tableView reloadRowsAtIndexPaths:@[] withRowAnimation:<#(UITableViewRowAnimation)#>
//    [self.accountCell configure:self.model];
    [self.tableView reloadData];
    
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
