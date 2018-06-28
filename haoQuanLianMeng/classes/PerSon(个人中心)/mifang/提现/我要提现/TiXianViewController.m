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

@interface TiXianViewController ()<TiXianFooterViewDelegate>


@property (nonatomic,strong) TiXianFooterView * footer;
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
        return cell;
    } else if(indexPath.section == 1 && indexPath.row == 0){
        
        TiXianCenterCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TiXianCenterCell" forIndexPath:indexPath];
        return cell;
    }else{
        TiXianBottomTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TiXianBottomTableViewCell" forIndexPath:indexPath];

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
        [self.navigationController pushViewController:ac animated:YES];
    }
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
