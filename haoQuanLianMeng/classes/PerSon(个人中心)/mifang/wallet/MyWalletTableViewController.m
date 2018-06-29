//
//  MyWalletTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/19.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MyWalletTableViewController.h"
#import "TiXianViewController.h"


@interface MyWalletTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *midou;
@property (weak, nonatomic) IBOutlet UILabel *yue;
@property (weak, nonatomic) IBOutlet UILabel *daijiesuan;
@property (weak, nonatomic) IBOutlet UILabel *youhuiquan;

@property (weak, nonatomic) IBOutlet UIButton *tixuan;

@end



@implementation MyWalletTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的钱包";
    self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
    self.tixuan.layer.cornerRadius = 5;
    self.tixuan.layer.masksToBounds = YES;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    user/MyWallet
    [HTNetworkingTool HTNetworkingToolGet:@"user/MyWallet" parame:nil isHud:YES isHaseCache:NO success:^(id json) {
        LWLog(@"%@",json);
        self.youhuiquan.text = [NSString stringWithFormat:@"%d",[json[@"data"][@"CouponNum"] intValue]];
        self.midou.text = [NSString stringWithFormat:@"%d",[json[@"data"][@"UserMBean"] intValue]];
        self.yue.text = [NSString stringWithFormat:@"%d",[json[@"data"][@"UserIntegral"] intValue] / 1000];
        self.daijiesuan.text = [NSString stringWithFormat:@"%d",[json[@"data"][@"UserTempIntegral"] intValue] / 1000];
    } failure:^(NSError *error) {
        LWLog(@"%@",error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (IBAction)tixianClick:(id)sender {
    
    TiXianViewController * vc = [[TiXianViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:vc animated:YES];
}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

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
