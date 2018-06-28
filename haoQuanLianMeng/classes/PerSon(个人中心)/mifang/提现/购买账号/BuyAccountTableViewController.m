//
//  BuyAccountTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "BuyAccountTableViewController.h"
#import "BuyAccountTableViewCell.h"
#import "ACBuildTableViewCell.h"
#import "BuyAccountCenTableViewCell.h"
#import "BuyAccountCell.h"
#import "AcFooterView.h"
@interface BuyAccountTableViewController ()


@property (nonatomic,strong) AcFooterView * acFooter;
@end

@implementation BuyAccountTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.acFooter = [[AcFooterView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 60)];
    self.tableView.tableFooterView = self.acFooter;
    
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    [self.tableView registerClass:[BuyAccountTableViewCell class] forCellReuseIdentifier:@"BuyAccountTableViewCell"];
    [self.tableView registerClass:[ACBuildTableViewCell class] forCellReuseIdentifier:@"ACBuildTableViewCell"];
    [self.tableView registerClass:[BuyAccountCenTableViewCell class] forCellReuseIdentifier:@"BuyAccountCenTableViewCell"];
    [self.tableView registerClass:[BuyAccountCell class] forCellReuseIdentifier:@"BuyAccountCell"];    // Uncomment the following line to preserve selection between presentations.
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

    return section == 0 ? 1 : 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        BuyAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BuyAccountTableViewCell" forIndexPath:indexPath];
        
        return cell;
    }else{
        
        if (indexPath.row == 0) {
            ACBuildTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ACBuildTableViewCell" forIndexPath:indexPath];
            
            return cell;
        }else if(indexPath.row == 1){
            BuyAccountCenTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BuyAccountCenTableViewCell" forIndexPath:indexPath];
            
            return cell;
            
        }else{
            BuyAccountCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BuyAccountCell" forIndexPath:indexPath];
            
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
