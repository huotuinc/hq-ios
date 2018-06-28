//
//  MyTeamController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MyTeamController.h"
#import "MyTeamHead.h"
#import "TeamTableViewCell.h"
#import "TeamDetailViewController.h"


@interface MyTeamController ()

@end

@implementation MyTeamController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.sectionHeaderHeight = 42;
    
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

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return section == 0 ? 4 : 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
            TeamTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TeamTableViewCell"];
            if (cell == nil) {
                cell = [[TeamTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TeamTableViewCell" withType:0];
            }
            return cell;
        }else{
            TeamTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TeamTableViewCell"];
            if (cell == nil) {
                cell = [[TeamTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TeamTableViewCell"];
            }
            return cell;
        }
        
        
    }else{
        if (indexPath.row == 0) {
            TeamTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TeamTableViewCell"];
            if (cell == nil) {
                cell = [[TeamTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TeamTableViewCell" withType:1];
            }
            return cell;
           
        }else{
            TeamTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TeamTableViewCell"];
            if (cell == nil) {
                cell = [[TeamTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TeamTableViewCell"];
            }
            return cell;
        }
        
        
        
        
    }
    
    
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        MyTeamHead * vc = [[MyTeamHead alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kAdaptedWidth(42))];
        vc.userInteractionEnabled = YES;
        KWeakSelf(self);
        [vc bk_whenTapped:^{
            TeamDetailViewController * vc = [[TeamDetailViewController alloc] init];
            [weakself.navigationController pushViewController:vc animated:YES];
        }];
        return vc;
    }else{
        MyTeamHead * vc = [[MyTeamHead alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kAdaptedWidth(42))];
        vc.userInteractionEnabled = YES;
        [vc bk_whenTapped:^{
            LWLog(@"xxxx");
        }];
        return vc;
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
