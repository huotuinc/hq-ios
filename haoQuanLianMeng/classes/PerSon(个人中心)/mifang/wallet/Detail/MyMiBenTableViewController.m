//
//  MyMiBenTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/3.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MyMiBenTableViewController.h"
#import "MiBenLTableViewCell.h"
#import "MiBenModel.h"
#import "MiFangWalletHeader.h"

@interface MyMiBenTableViewController ()

@property (nonatomic,strong) MiBenModel * model;

@property (nonatomic,strong) MiFangWalletHeader * headerxx;


@property (nonatomic,assign) int pageIndex;


@end

@implementation MyMiBenTableViewController

- (MiFangWalletHeader *)headerxx{
    if (_headerxx == nil) {
        _headerxx = [[MiFangWalletHeader alloc] init];
        _headerxx.backgroundColor = [UIColor whiteColor];
    }
    return _headerxx;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
//    self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.tableView registerClass:[MiBenLTableViewCell class] forCellReuseIdentifier:@"MiBenLTableViewCell"];
    
//    [self.tableView registerClass:[MiFangWalletHeader class] forCellReuseIdentifier:@"MiFangWalletHeader"];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    
    

    if (self.type == 1) { // 待结算
        self.headerxx.frame = CGRectMake(0, 0, KScreenWidth, 44);
        self.tableView.tableHeaderView = self.headerxx;
        self.tableView.sectionHeaderHeight = 5;
        self.navigationItem.title = @"待结算";
    }else {
        self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
        if (self.type == 0) {
            self.navigationItem.title = @"余额";
        }else{
           self.navigationItem.title = @"觅豆";
        }
    }
    
    [self getData];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)getData{
//    /user/GetIntegralList
    if (self.type > 0) {
        NSMutableDictionary * dict = [NSMutableDictionary dictionary];
        dict[@"SearchType"] = @(self.type - 1);
        dict[@"pageIndex"] = @"1";
        dict[@"pageSize"] = @"10";
        [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolGet:@"user/GetIntegralList" parame:dict isHud:YES isHaseCache:NO success:^(id json) {
            MiBenModel * model =  [MiBenModel mj_objectWithKeyValues:json[@"data"]];
            self.model = model;
            if (model.Items) {
                [self.dataArray removeAllObjects];
                [self.dataArray addObjectsFromArray:model.Items];
                [self.tableView reloadData];
                if (self.type) {
                    [self.headerxx configure:model];
                }
            }
            LWLog(@"%@",[model mj_keyValues]);
        } failure:^(NSError *error) {
            
        }];
    }else{
        NSMutableDictionary * dict = [NSMutableDictionary dictionary];
        dict[@"pageIndex"] = @"1";
        dict[@"pageSize"] = @"10";
        [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolGet:@"User/GetMiBeanList" parame:dict isHud:YES isHaseCache:NO success:^(id json) {
            
            LWLog(@"%@",json);
            MiBenModel * model =  [MiBenModel mj_objectWithKeyValues:json[@"data"]];
            self.model = model;
            if (model.Items) {
                [self.dataArray removeAllObjects];
                [self.dataArray addObjectsFromArray:model.Items];
                [self.tableView reloadData];
                if (self.type) {
                    [self.headerxx configure:model];
                }
            }
            LWLog(@"%@",[model mj_keyValues]);
        } failure:^(NSError *error) {
            
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;//self.dataArray.count;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 10)];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    MiBenLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MiBenLTableViewCell" forIndexPath:indexPath];
    cell.type = self.type;
    cell.data = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
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
