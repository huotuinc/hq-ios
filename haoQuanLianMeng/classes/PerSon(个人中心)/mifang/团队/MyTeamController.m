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
#import "Team.h"

@interface MyTeamController ()

@property (nonatomic,strong) Team * model;
@end

@implementation MyTeamController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.sectionHeaderHeight = 42;
    self.navigationItem.title = @"我的团队";
    
    [self getInit];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)getInit{
    
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"User/TeamIndex" parame:nil isHud:YES isHaseCache:NO success:^(id json) {
        
        LWLog(@"%@",json);
        Team * model = [Team mj_objectWithKeyValues:json[@"data"]];
        self.model = model;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.model ? 2 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return section == 0 ? (self.model.TeamInfo.count + 1) : 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
            TeamTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TeamTableViewCell"];
            if (cell == nil) {
                cell = [[TeamTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TeamTableViewCell" withType:0];
            }
            cell.indexPath = indexPath;
            return cell;
        }else{
            TeamTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TeamTableViewCell"];
            if (cell == nil) {
                cell = [[TeamTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TeamTableViewCell"];
            }
            cell.indexPath = indexPath;
            [cell configure:self.model];
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
            cell.indexPath = indexPath;
            [cell configure:self.model];
            return cell;
        }
        
        
        
        
    }
    
    
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    KWeakSelf(self);
    if (section == 0) {
        MyTeamHead * vc = [[MyTeamHead alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kAdaptedWidth(42))];
        vc.userInteractionEnabled = YES;
        
        //[vc setTitle:@""];
        [vc bk_whenTapped:^{
            TeamDetailViewController * vc = [[TeamDetailViewController alloc] init];
            vc.navigationItem.title = @"团队详情";
            vc.type = 0;
            [weakself.navigationController pushViewController:vc animated:YES];
        }];
        return vc;
    }else{
        MyTeamHead * vc = [[MyTeamHead alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kAdaptedWidth(42))];
        vc.userInteractionEnabled = YES;
        [vc setTitle:@"团队新增"];
        [vc bk_whenTapped:^{
            TeamDetailViewController * vc = [[TeamDetailViewController alloc] init];
            vc.navigationItem.title = @"团队新增";
            vc.type = 1;
            [weakself.navigationController pushViewController:vc animated:YES];
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
