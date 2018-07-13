//
//  DianZhuTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/23.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "DianZhuTableViewController.h"
#import "DianZhueTableViewCell.h"
#import "DZClassList.h"



@interface DianZhuTableViewController ()

@property (nonatomic,assign) int pageIndex;

@end

@implementation DianZhuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[DianZhueTableViewCell class] forCellReuseIdentifier:@"DianZhueTableViewCell"];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.pageIndex = 1;
    self.tableView.contentInset = UIEdgeInsetsMake(kAdaptedWidth(40)+1, 0, 0, 0  );
    
    [self dataInitWith:1];
}



- (void)refreshHeader{
    
    self.pageIndex = 1;
    [self dataInitWith:1];
}

- (void)refreshFooter{
    self.pageIndex ++;
    [self dataInitWith:0];
    
}



- (void)dataInitWith:(int)header{
//    #import "DZClassList.h"
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"typeId"] = @(self.type);
    dict[@"pageIndex"] = @(self.pageIndex);
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"ShopClassRoom/list" parame:dict isHud:YES isHaseCache:YES success:^(id json) {
        NSArray * dataArray =  [DZClassList mj_objectArrayWithKeyValuesArray:json[@"data"]];
        if (header) {
            [self.dataArray removeAllObjects];
        }
        [self.dataArray addObjectsFromArray:dataArray];
        [self.tableView reloadData];
        LWLog(@"%@",json);
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DianZhueTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DianZhueTableViewCell" forIndexPath:indexPath];
    cell.dataModel = [self.dataArray objectAtIndex:indexPath.row];
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
