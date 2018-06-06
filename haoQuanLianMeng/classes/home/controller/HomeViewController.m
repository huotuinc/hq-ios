//
//  HomeViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/29.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HomeViewController.h"
#import "ShuListTableViewCell.h"
#import "HomeContainerView.h"


@interface HomeViewController ()




//透视图
@property (nonatomic,strong) HomeContainerView * headContainer;




@end

@implementation HomeViewController

- (HomeContainerView *)headContainer{
    if (_headContainer == nil) {
        _headContainer = [[HomeContainerView alloc] init];
    }
    return _headContainer;
}






- (void)viewDidLoad {
    [super viewDidLoad];
    
    
 
    self.tableView.contentInset = UIEdgeInsetsMake(kAdaptedWidth(40), 0, 110, 0);
    
    self.tableView.tableHeaderView = self.headContainer;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
//    [self.tableView registerClass:[HomeRowTableViewCell class] forCellReuseIdentifier:@"HomeRowTableViewCell"];
    [self.tableView registerClass:[ShuListTableViewCell class] forCellReuseIdentifier:@"ShuListTableViewCell"];
//    [self.tableView registerClass:[FeedFocusonTableViewCell class] forCellReuseIdentifier:@"FeedFocusonTableViewCell"];
    
    
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
   
    
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
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    if (indexPath.section == 0) {
//        HomeRowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeRowTableViewCell" forIndexPath:indexPath];
//        return cell;
//    }else if (indexPath.section == 1){
//
//        FeedFocusonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedFocusonTableViewCell" forIndexPath:indexPath];
//        return cell;
//
//    }else{
        ShuListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShuListTableViewCell" forIndexPath:indexPath];
        return cell;
//    }

   
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
