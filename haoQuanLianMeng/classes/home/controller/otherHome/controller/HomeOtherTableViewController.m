//
//  HomeOtherTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HomeOtherTableViewController.h"
#import "HomeIconContainer.h"
#import "HomeOtherSectionHeaderView.h"
#import "ShuListTableViewCell.h"


@interface HomeOtherTableViewController ()<HomeOtherSectionHeaderViewDelegate>


@property (nonatomic,strong) HomeIconContainer * homeIconContainer;


@property (nonatomic,strong) HomeOtherSectionHeaderView * homeOtherSectionHeaderView;
@end

@implementation HomeOtherTableViewController


- (void)selectItem:(int)type{
    
    LWLog(@"xxxxxxxxx");
}

- (HomeOtherSectionHeaderView *)homeOtherSectionHeaderView{
    if (_homeOtherSectionHeaderView == nil) {
        _homeOtherSectionHeaderView = [[HomeOtherSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(43))];
        _homeOtherSectionHeaderView.delegate = self;
    }
    return _homeOtherSectionHeaderView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    self.homeIconContainer = [[HomeIconContainer alloc] initWithDatas:@[@"1",@"2",@"3",@"1",@"2",@"3"]];
    self.tableView.tableHeaderView = self.homeIconContainer;
    self.tableView.contentInset = UIEdgeInsetsMake(kAdaptedWidth(40), 0, 110, 0);
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    [self.tableView registerClass:[ShuListTableViewCell class] forCellReuseIdentifier:@"ShuListTableViewCell"];
    
    
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
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 ShuListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShuListTableViewCell" forIndexPath:indexPath];
 return cell;
}




- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kAdaptedHeight(43);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return self.homeOtherSectionHeaderView;
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
