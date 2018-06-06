//
//  HTMoneyTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTMoneyTableViewController.h"
#import "MoneyHeaderContainer.h"
#import "HTMoneyListTableViewCell.h"
#import "HTDuiHuanTableViewController.h"

@interface HTMoneyTableViewController ()<MoneyHeaderContainerDelegate>


@property (nonatomic,strong) MoneyHeaderContainer * moneyHeaderContainer;
@end

@implementation HTMoneyTableViewController


- (MoneyHeaderContainer *)moneyHeaderContainer {
    if (_moneyHeaderContainer == nil){
        _moneyHeaderContainer = [MoneyHeaderContainer MoneyHeaderContainerShare];
        _moneyHeaderContainer.frame = CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(90) + kAdaptedHeight(56));
        _moneyHeaderContainer.delegate = self;
    }
    return _moneyHeaderContainer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title = @"余额明细";


    self.tableView.rowHeight = kAdaptedHeight(58);
    self.tableView.tableHeaderView = self.moneyHeaderContainer;
    [self.tableView registerClass:[HTMoneyListTableViewCell class] forCellReuseIdentifier:@"HTMoneyListTableViewCell"];
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
#warning Incomplete implementation, return the number of rows
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HTMoneyListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HTMoneyListTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    UIView * vc =  [[UIView alloc] initWithFrame:CGRectMake(0, 0,     KScreenWidth
        , 6)];

    vc.backgroundColor = LWColor(241, 242, 243);
    return vc;
 }


- (void)MoneyHeaderContainerChange{
   
    HTDuiHuanTableViewController * vc = [[UIStoryboard storyboardWithName:@"Person" bundle:nil] instantiateViewControllerWithIdentifier:@"HTDuiHuanTableViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"xxxx");
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
