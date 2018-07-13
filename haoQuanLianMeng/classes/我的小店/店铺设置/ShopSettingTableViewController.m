//
//  ShopSettingTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/9.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ShopSettingTableViewController.h"

@interface ShopSettingTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *shopHeadLable;
@property (weak, nonatomic) IBOutlet UIImageView *shopIcon;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLable;
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *shareLable;
@property (weak, nonatomic) IBOutlet UILabel *shareName;
@property (weak, nonatomic) IBOutlet UILabel *shareContentLable;
@property (weak, nonatomic) IBOutlet UILabel *shareContenName;
@property (weak, nonatomic) IBOutlet UIButton *yulan;

@end

@implementation ShopSettingTableViewController

- (IBAction)yulanclick:(id)sender {
    
    
}


- (void)setUpInit{
    
    self.yulan.layer.cornerRadius = 5;
    self.yulan.layer.masksToBounds = YES;
    
    [self.shopIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(kAdaptedWidth(60));
        make.top.mas_equalTo(self.shopIcon.superview.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.shopIcon.superview.mas_bottom).mas_offset(-10);
        
        make.right.mas_equalTo(self.shopIcon.superview.mas_right).mas_equalTo(-10);
    }];
    
    
    [self.shopHeadLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(self.shopIcon.centerY);
        make.left.mas_equalTo(self.shopHeadLable.superview.mas_left).mas_equalTo(10);
    }];
    
    
    [self.shopNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //make.centerY.mas_equalTo(self.shopIcon.centerY);
        make.top.mas_equalTo(self.shopNameLable.superview.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.shopNameLable.superview.mas_bottom).mas_offset(-10); make.left.mas_equalTo(self.shopNameLable.superview.mas_left).mas_equalTo(10);
    }];
    
    [self.shopName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.shopName.superview.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.shopName.superview.mas_bottom).mas_offset(-10); make.right.mas_equalTo(self.shopName.superview.mas_right).mas_equalTo(-10);
    }];
    
    
    [self.shareLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //make.centerY.mas_equalTo(self.shopIcon.centerY);
        make.top.mas_equalTo(self.shareLable.superview.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.shareLable.superview.mas_bottom).mas_offset(-10); make.left.mas_equalTo(self.shareLable.superview.mas_left).mas_equalTo(10);
    }];
    
    [self.shareName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.shareName.superview.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.shareName.superview.mas_bottom).mas_offset(-10); make.right.mas_equalTo(self.shareName.superview.mas_right).mas_equalTo(-10);
    }];
    
    [self.shareContentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //make.centerY.mas_equalTo(self.shopIcon.centerY);
        make.top.mas_equalTo(self.shareContentLable.superview.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.shareContentLable.superview.mas_bottom).mas_offset(-10); make.left.mas_equalTo(self.shareContentLable.superview.mas_left).mas_equalTo(10);
    }];
    
    [self.shareContenName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.shareContenName.superview.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.shareContenName.superview.mas_bottom).mas_offset(-10); make.right.mas_equalTo(self.shareContenName.superview.mas_right).mas_equalTo(-10);
    }];
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0; // 设置为一个接近“平均”行高的值
    self.navigationItem.title = @"店铺设置";
    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
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
