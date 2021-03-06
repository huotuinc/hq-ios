//
//  GoodMoneyTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "GoodMoneyTableViewController.h"
#import "GoodMoneyListCell.h"
#import "GoodMoneyModel.h"

@interface GoodMoneyTableViewController ()

@end

@implementation GoodMoneyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self.tableView registerClass:[GoodMoneyListCell class]
           forCellReuseIdentifier:@"GoodMoneyListCell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    self.tableView.tableFooterView = [[UIView alloc] init];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self getDate:0];
}


- (void)refreshHeader{
    self.refreshPageIndex = 1;
    [self getDate:0];
}

- (void)refreshFooter{
    self.refreshPageIndex += 1;
    [self getDate:1];
}

- (void)getDate:(int)type{

    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"page"] = @(self.refreshPageIndex);
    dict[@"pageSize"] = @(10);
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"store/frozenFlow" parame:dict isHud:YES isHaseCache:YES success:^(id json) {

        NSArray * t =  [GoodMoneyModel mj_objectArrayWithKeyValuesArray:json[@"data"]];
        if (type == 0) {
            [self.dataArray removeAllObjects];
            
            if (t.count) {
                [self.tableView dissmissEmptyView];
            }else{
                KWeakSelf(self);
                [self.tableView showEmptyViewClickImageViewBlock:^(id sender) {
                    [weakself getDate:0];
                }];
            }
        }
        [self.dataArray addObjectsFromArray:t];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSError *error) {

    }];
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

    GoodMoneyListCell *cell = [tableView
        dequeueReusableCellWithIdentifier:@"GoodMoneyListCell"
                                          forIndexPath:indexPath];
    cell.model = [self.dataArray objectAtIndex:indexPath.row];
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
