//
//  ShopHuoKuanController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/9.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ShopHuoKuanController.h"
#import "ShopMoneyTopCell.h"
#import "ShopMoneyBottomCell.h"
#import "ShopMoneyCenterCellCell.h"
#import "ShopHuoKuanController.h"
#import "AcFooterView.h"

@interface ShopHuoKuanController ()<AcFooterViewDelegate>


@property (nonatomic,strong) AcFooterView * acFooter;
@end

@implementation ShopHuoKuanController


- (void)btnClick{
    
    
    
    
}


- (void)setUpInit{
    
    
    [self.tableView registerClass:[ShopMoneyTopCell class] forCellReuseIdentifier:@"ShopMoneyTopCell"];
    [self.tableView registerClass:[ShopMoneyCenterCellCell class] forCellReuseIdentifier:@"ShopMoneyCenterCellCell"];
    [self.tableView registerClass:[ShopMoneyBottomCell class] forCellReuseIdentifier:@"ShopMoneyBottomCell"];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    self.navigationItem.title = @"货款充值";
    self.tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    self.tableView.sectionFooterHeight = 0;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setUpInit];
    
    
    self.acFooter = [[AcFooterView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 60)];
    self.acFooter.delegate = self;
    self.tableView.tableFooterView = self.acFooter;
    [self.acFooter settitle:@"立即充值"];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 2;
}
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return section == 0 ? 1 : 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
       ShopMoneyTopCell * cell =  [tableView dequeueReusableCellWithIdentifier:@"ShopMoneyTopCell" forIndexPath:indexPath];
        return cell;
    }else{
        
        if (indexPath.row == 0) {
            ShopMoneyCenterCellCell * cell =  [tableView dequeueReusableCellWithIdentifier:@"ShopMoneyCenterCellCell" forIndexPath:indexPath];
            LWLog(@"xxxxxx");
            return cell;
        }else{
            ShopMoneyBottomCell * cell =  [tableView dequeueReusableCellWithIdentifier:@"ShopMoneyBottomCell" forIndexPath:indexPath];
            LWLog(@"xxxxxx");
            return cell;
        }
    }
    
   
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
