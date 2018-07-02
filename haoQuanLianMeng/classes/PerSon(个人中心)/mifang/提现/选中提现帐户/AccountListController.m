//
//  AccountListController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "AccountListController.h"
#import "AccountTableViewCell.h"
#import "AccountBuildController.h"
#import "AccountList.h"


@interface AccountListController ()<AccountTableViewDelegate>



@property (nonatomic,strong) UIButton  * right;

@property (nonatomic,strong) NSIndexPath  * index;


@end

@implementation AccountListController


- (UIButton *)right{
    if (_right == nil) {
        _right = [UIButton buttonWithType:UIButtonTypeCustom];
        _right.size = CGSizeMake(40, 40);
        [_right setImage:[UIImage imageNamed:@"A_add"] forState:UIControlStateNormal];
        [_right sizeToFit];
        [_right addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _right;
}


- (void)addClick:(UIButton *)btn{
    AccountBuildController * vc = [[AccountBuildController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)getAccountList{
    [HTNetworkingTool HTNetworkingToolGet:@"user/GetAccountList" parame:nil isHud:YES isHaseCache:NO success:^(id json) {
        NSArray * data =  [AccountList mj_objectArrayWithKeyValuesArray:json[@"data"][@"list"]];
        [self.dataArray addObjectsFromArray:data];
        [self.tableView reloadData];
        LWLog(@"%@",json);
    } failure:^(NSError *error) {
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"选择提现账户";
    [self.tableView registerClass:[AccountTableViewCell class] forCellReuseIdentifier:@"AccountTableViewCell"];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    
    [self getAccountList];
    
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithCustomView:self.right];
    
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



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}

- (void)refreshCell:(AccountList *)model andIndex:(NSIndexPath *)index{
    
    if (index == self.index) {
        return;
    }
    
    AccountList * omodel = [self.dataArray objectAtIndex:self.index.row];
    omodel.IsDefault = 0;
    AccountList * nmodel = [self.dataArray objectAtIndex:index.row];
    nmodel.IsDefault = 1;
    
    [self.tableView reloadRowsAtIndexPaths:@[self.index,index] withRowAnimation:UITableViewRowAnimationAutomatic];
    self.index = index;
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"AccountId"] = @(model.AccountId);
    [HTNetworkingTool HTNetworkingToolPost:@"user/SetDefaultAccount" parame:dict isHud:YES isHaseCache:NO success:^(id json) {
        [self.navigationController popViewControllerAnimated:YES];
        if ([self.delegate respondsToSelector:@selector(accountSelect:)]) {
            [self.delegate accountSelect:model];
        }
    } failure:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccountTableViewCell" forIndexPath:indexPath];
    cell.delegate = self;
    AccountList * model = [self.dataArray objectAtIndex:indexPath.row];
    cell.model = model;
    if (model.IsDefault) {
        self.index = indexPath;
    }
    KWeakSelf(self);
    cell.selectClcik = ^(AccountList *model) {
        [weakself refreshCell:model andIndex:indexPath];
    };
    return cell;
}


- (void)BuildClick:(AccountList *) model{
    
    LWLog(@"xxxx");
    UIAlertController * vc = [UIAlertController alertControllerWithTitle:@"编辑" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * ac1 = [UIAlertAction actionWithTitle:@"修改提现帐号" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        AccountBuildController * vc = [[AccountBuildController alloc] initWithStyle:UITableViewStyleGrouped];
        vc.model = model;
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    UIAlertAction * ac2 = [UIAlertAction actionWithTitle:@"设为默认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        AccountList * modelx = [self.dataArray objectAtIndex:self.index.row];
        if (modelx == model) {
            return ;
        }
        modelx.IsDefault = 0;
        model.IsDefault = 1;
        [self.tableView reloadData];
    }];
    
    UIAlertAction * ac3 = [UIAlertAction actionWithTitle:@"删除提现帐号" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.dataArray removeObject:model];
        [self.tableView reloadData];
    }];
    
//    UIAlertAction * ac3 = [UIAlertAction actionWithTitle:@"删除提现帐号" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        
//    }];
    
    
    [vc addAction:ac1];
    [vc addAction:ac2];
    [vc addAction:ac3];
    [self presentViewController:vc animated:YES completion:nil];
    
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
