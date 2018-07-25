//
//  SettPayPassTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/25.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "SettPayPassTableViewController.h"
#import "HTSettingTableViewController.h"

@interface SettPayPassTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *first;
@property (weak, nonatomic) IBOutlet UITextField *second;
@property (weak, nonatomic) IBOutlet UIButton *ntn;

@end

@implementation SettPayPassTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置支付密码";
//    self.nextBtn.layer.cornerRadius = 5;
    self.tableView.backgroundColor = LWColor(242, 242, 242);
    self.ntn.layer.cornerRadius = 5;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnConfime:(id)sender {
    
    if(!self.first.text.length || !self.second.text.length){
        [MBProgressHUD showError:@"请输入密码"];
        return;
    }
    if(![self.first.text  isEqualToString:self.second.text]){
        [MBProgressHUD showError:@"输入密码不一致"];
        return;
    }
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"payPassword"] = [MD5Encryption md5by32:self.first.text];
    
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"user/updatePayPassword" parame:dict isHud:YES isHaseCache:NO success:^(id json) {
        
        for (UIViewController * vc  in self.navigationController.viewControllers) {
            if ([vc isKindOfClass:[HTSettingTableViewController class]]) {
                [self.navigationController popToViewController:vc animated:YES];
            }
        }
        
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - Table view data source

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
