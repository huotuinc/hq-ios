//
//  HTSettingTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTSettingTableViewController.h"
#import "MfBangDingTableViewController.h"

@interface HTSettingTableViewController ()

@property (weak, nonatomic) IBOutlet UILabel *phoneLable;

@property (weak, nonatomic) IBOutlet UILabel *cacheLable;

@property (weak, nonatomic) IBOutlet UILabel *banBenLable;

@property (weak, nonatomic) IBOutlet UILabel *payPass;

@property (weak, nonatomic) IBOutlet UISwitch *openPayPass;

@property (weak, nonatomic) IBOutlet UIButton *accountBtn;

@end

@implementation HTSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    [self.openPayPass addTarget:self action:@selector(openPassWordStatus:) forControlEvents:UIControlEventValueChanged];
    NSUInteger size =  [[SDImageCache sharedImageCache] getSize];
    LWLog(@"%lul",(unsigned long)size);
    
    self.cacheLable.text = [NSString stringWithFormat:@"%.2fM",size / 1024.0 /1024.0];
    self.banBenLable.text = [NSString stringWithFormat:@"v %@",AppVersion];
    self.accountBtn.layer.cornerRadius = 5;
    self.accountBtn.layer.masksToBounds = YES;
    
    self.tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0 );
    [self.navigationController setNavigationBarHidden:NO];
    
    self.navigationItem.title = @"设置";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[HTNetworkingTool  HTNetworkingManager]  HTNetworkingToolGet:@"user/setting" parame:nil isHud:NO isHaseCache:NO success:^(id json) {
        self.phoneLable.text = [json[@"data"] objectForKey:@"UserMobile"];
        self.payPass.text = ([[json[@"data"] objectForKey:@"PayPassworded"] intValue] ? @"已重置" : @"未重置");
        [self.openPayPass setOn:([[json[@"data"] objectForKey:@"PayPasswordStatus"] intValue]) animated:YES];
//        self.openPayPass.isOn = ([[json[@"data"] objectForKey:@"PayPasswordStatus"] intValue]);
        
        LWLog(@"%@",json);
    } failure:^(NSError *error) {
        LWLog(@"%@",error);
    }];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (IBAction)accountClick:(id)sender {
    
    
}


- (void)openPassWordStatus:(UISwitch *)sw{
    
    LWLog(@"%d",sw.isOn);
//    user/updatePayPasswordStatus
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"status"] = @(sw.isOn);
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"user/updatePayPasswordStatus" parame:dict isHud:NO isHaseCache:NO success:^(id json) {
        if (sw.isOn) {
          [MBProgressHUD showSuccess:@"开启成功"];
        }else{
           [MBProgressHUD showSuccess:@"关闭成功"];
        }
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
        MfBangDingTableViewController * vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MfBangDingTableViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }
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
