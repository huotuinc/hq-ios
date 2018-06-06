//
//  PerSonTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/1.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "PerSonTableViewController.h"
#import "PerHeadViewContainer.h"
#import "HTPersonTableViewCell.h"
#import "MessageContainViewController.h"
#import "HTSettingTableViewController.h"
#import "HTMoneyTableViewController.h"
#import "HTTuiGuangViewController.h"


@interface PerSonTableViewController ()<PerHeadViewContainerDelegate>

@property (nonatomic,strong) PerHeadViewContainer * perHeadContainer;


@property (nonatomic,strong) NSArray * titleContainer;

@property (nonatomic,strong) NSArray * imageContainer;

@end

@implementation PerSonTableViewController


- (NSArray *)titleContainer {
    if (_titleContainer == nil){
        _titleContainer = @[@"邀请好友",@"收藏夹",@"消息动态",@"使用教程",@"客服与帮助"];
    }
    return _titleContainer;
}

- (NSArray *)imageContainer {
    if (_imageContainer == nil){
        _imageContainer = @[@"pyqhy",@"pscj",@"pxxdt",@"psyjc",@"pkf"];
    }
    return _imageContainer;
}

- (PerHeadViewContainer *)perHeadContainer{
    if (_perHeadContainer == nil) {
        _perHeadContainer = [PerHeadViewContainer PerHeadViewContainerShare];
        _perHeadContainer.delegate = self;
    }
    return _perHeadContainer;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = self.perHeadContainer;
    
    
    self.tableView.backgroundColor = [UIColor whiteColor];

//    self.tableView.rowHeight = 48;


    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    [self.tableView registerClass:[HTPersonTableViewCell class] forCellReuseIdentifier:@"HTPersonTableViewCell"];
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

    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    HTPersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HTPersonTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    [cell setHTPersonName:self.titleContainer[indexPath.row] andIconName:self.imageContainer[indexPath.row]];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kAdaptedWidth(30);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
   UIView * view =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kAdaptedWidth(30))];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
//    MessageContainViewController * vc = [[MessageContainViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
    
    HTPersonTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell cellClickAT:indexPath andVC:self];
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

//设置点击
- (void)PerHeadViewSettingClick{
    HTSettingTableViewController * vc = [[UIStoryboard storyboardWithName:@"Person" bundle:nil] instantiateViewControllerWithIdentifier:@"HTSettingTableViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)PerHeadViewContainerCenterDownClick:(int)type{
    LWLog(@"%d",type);
    
    HTMoneyTableViewController * vc = [[HTMoneyTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)PerHeadViewOrderCenterDownClick:(int)type{
    LWLog(@"%d",type);
    if(type == 0){
        HTTuiGuangViewController * vc = [[HTTuiGuangViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
