//
//  TuiGuanListTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/23.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TuiGuanListTableViewController.h"
#import "ATuiGuangTableViewCell.h"
#import "TuiGuangModel.h"
#import "TuiGuangCellModel.h"


@interface TuiGuanListTableViewController ()

    
@end

@implementation TuiGuanListTableViewController

- (void)refreshHeader{
    self.refreshPageIndex = 1;
    [self getInitData:1];
}

- (void)refreshFooter{
    
    self.refreshPageIndex += 1;
    [self getInitData:0];
    
}

- (void)timePick{
    
    [self refreshHeader];
}

// 1 是头 
- (void)getInitData:(int)type{

//    /Order/GetProfitOrderList

    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"SearchTime"] = @"2";
    dict[@"ShipStatus"] = @(_orderStatus);
    dict[@"SearchYear"] = @(self.year);
    dict[@"SearchMonth"] = @(self.month);
    dict[@"SearchDay"] = @"-1";
    dict[@"WeekNum"] = @"-1";
    dict[@"PageIndex"] = @(self.refreshPageIndex);
    dict[@"PageSize"] = @"10";
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"Order/GetProfitOrderList" parame:dict
                                                          isHud:YES isHaseCache:NO success:^(id json) {
            LWLog(@"%@",json);

            NSArray * data =  [TuiGuangModel mj_objectArrayWithKeyValuesArray:[json objectForKey:@"data"]];
                                                              if (type == 1) {
                                                                  [self.dataArray removeAllObjects];
                                                                  if (data.count) {
                                                                      [self.tableView dissmissEmptyView];
                                                                  }else{
                                                                      KWeakSelf(self);
                                                                      [self.tableView showEmptyViewClickImageViewBlock:^(id sender) {
                                                                          [weakself getInitData:1];
                                                                      }];
                                                                  }
                                                            }
            [self.dataArray addObjectsFromArray:data];
            [self.tableView reloadData];

                                                              [self.tableView.mj_header endRefreshing];
                                                              [self.tableView.mj_footer endRefreshing];
        } failure:^(NSError *error) {
            LWLog(@"%@",error.description);

    }];

}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    

   // [self.tableView registerClass:[ATuiGuangTableViewCell class] forCellReuseIdentifier:@"ATuiGuangTableViewCell"];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(kAdaptedWidth(40), 0, 0, 0 );
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self getInitData:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ATuiGuangTableViewCell * cell = [TuiGuangCellModel confirmCellWithArticle:[self.dataArray objectAtIndex:indexPath.row]
                                    slideType:self.orderStatus
                                WithTableView:tableView
                                 witdDelegate:self];
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
