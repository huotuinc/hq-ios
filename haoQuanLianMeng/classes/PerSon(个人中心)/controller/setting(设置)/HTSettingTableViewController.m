//
//  HTSettingTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTSettingTableViewController.h"

@interface HTSettingTableViewController ()

@property (weak, nonatomic) IBOutlet UILabel *cacheLable;

@property (weak, nonatomic) IBOutlet UILabel *versionLable;

@property (weak, nonatomic) IBOutlet UILabel *accountLable;

@property (weak, nonatomic) IBOutlet UILabel *bindLable;

@property (weak, nonatomic) IBOutlet UILabel *shangJiLable;

@property (weak, nonatomic) IBOutlet UIButton *accountBtn;

@end

@implementation HTSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.accountBtn.layer.cornerRadius = 5;
    self.accountBtn.layer.masksToBounds = YES;
    
    self.tableView.contentInset = UIEdgeInsetsMake(-40, 0, 0, 0 );
    [self.navigationController setNavigationBarHidden:NO];
    
    self.navigationItem.title = @"设置";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (IBAction)accountClick:(id)sender {
    
    
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
