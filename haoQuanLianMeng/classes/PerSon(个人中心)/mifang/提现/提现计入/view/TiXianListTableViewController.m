//
//  TiXianListTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/20.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TiXianListTableViewController.h"
#import "TiXianCell.h"
#import "MTiXianModel.h"

@interface TiXianListTableViewController ()

@end

@implementation TiXianListTableViewController


- (void)refreshHeader{
    self.refreshPageIndex = 1;
    [self getDate:1];
}

- (void)refreshFooter{
    self.refreshPageIndex += 1;
    [self getDate:0];
    
}


- (void)getDate:(int)type{
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"pageIndex"] = @(self.refreshPageIndex);
    dict[@"pageSize"] = @"10";
    
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"user/ApplyList" parame:dict isHud:YES isHaseCache:NO success:^(id json) {
        LWLog(@"%@",json);
        NSArray * data =  [MTiXianModel mj_objectArrayWithKeyValuesArray:[json objectForKey:@"data"] ];
        if (type == 1) {
            [self.dataArray removeAllObjects];
            
            if(data.count){
                [self.tableView dissmissEmptyView];
            }else{
                [self.tableView showEmptyViewClickImageViewBlock:^(id sender) {
                    
                }];
            }
        }
        [self.dataArray addObjectsFromArray:data];
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"提现记录";
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.tableView registerClass:[TiXianCell class] forCellReuseIdentifier:@"TiXianCell"];
    
    self.tableView.backgroundColor = LWColor(239, 239, 244);
    
    [self getDate:1];
    
    
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TiXianCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TiXianCell" forIndexPath:indexPath];
    cell.model = [self.dataArray objectAtIndex:indexPath.row];
    // Configure the cell...
    
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
