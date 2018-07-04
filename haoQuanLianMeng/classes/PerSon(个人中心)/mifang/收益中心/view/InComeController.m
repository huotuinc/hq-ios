//
//  InComeController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/20.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "InComeController.h"
#import "InComeHeader.h"
#import "InComeTableViewCell.h"
#import "DayInComeTableViewController.h"
#import "InComeModel.h"

@interface InComeController ()<InComeTableViewCellDelegate>

@property (nonatomic,strong) InComeHeader * inComeHeader;


@property (nonatomic,strong) InComeModel * model;


@end

@implementation InComeController

- (InComeHeader *)inComeHeader{
    if (_inComeHeader == nil) {
        _inComeHeader = [[InComeHeader alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(93))];
    }
    return _inComeHeader;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"收益中心";
    self.tableView.tableHeaderView = self.inComeHeader;
    [self.tableView registerClass:[InComeTableViewCell class] forCellReuseIdentifier:@"InComeTableViewCell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    self.tableView.sectionHeaderHeight = 10;
    self.tableView.sectionFooterHeight = 0;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self getData];
}

- (void)getData{
    
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolGet:@"Profit/GetProfitIndex" parame:nil isHud:YES isHaseCache:NO success:^(id json) {
        InComeModel * model =  [InComeModel mj_objectWithKeyValues:json[@"data"]];
        self.model = model;
        [self.inComeHeader configure:model];
        [self.tableView reloadData];
        LWLog(@"%@",json);
    } failure:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    InComeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"InComeTableViewCell" forIndexPath:indexPath];
    cell.indexPath = indexPath;
    cell.delegate = self;
    [cell configure:self.model];
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * view =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 10)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}



-(void)InComeClicl:(int)index{
    
    DayInComeTableViewController * vc = [[DayInComeTableViewController alloc] initWithStyle:UITableViewStylePlain];
    vc.type = index;
    [self.navigationController pushViewController:vc animated:YES];
    LWLog(@"%d",index);
}



- (void)configure:(InComeModel *)model{
    
    
    
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
