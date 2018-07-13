//
//  MiFangYaoQingController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/19.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MiFangYaoQingController.h"
#import "MiFangYaoHeader.h"
#import "MiFangAccountTableViewCell.h"
#import "MiFangFooter.h"
#import "MiFangYaoViewController.h"
#import "MiFangYaoQingModel.h"


@interface MiFangYaoQingController ()<MiFangAccountTableViewDelegate>

@property (nonatomic,strong) MiFangYaoHeader * miFangYaoHeader;

@property (nonatomic,strong) MiFangFooter * miFangYaoFooter;


@property (nonatomic,strong) MiFangAccountTableViewCell *cell;

@end

@implementation MiFangYaoQingController



- (MiFangFooter *)miFangYaoFooter{
    if (_miFangYaoFooter == nil) {
        _miFangYaoFooter = [[MiFangFooter alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 60)];
        
    }
    return _miFangYaoFooter;
}

- (MiFangYaoHeader *)miFangYaoHeader{
    if (_miFangYaoHeader == nil) {
        _miFangYaoHeader = [[MiFangYaoHeader alloc] init];
        _miFangYaoHeader.frame = CGRectMake(0, 0, KScreenWidth, [_miFangYaoHeader getHeight]);
    }
    return _miFangYaoHeader;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = self.miFangYaoHeader;
    self.tableView.tableFooterView = self.miFangYaoFooter;
    
    self.tableView.sectionHeaderHeight = 10;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    [self.tableView registerClass:[MiFangAccountTableViewCell class] forCellReuseIdentifier:@"MiFangAccountTableViewCell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self getData];
}


- (void)getData{
//
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolGet:@"Profit/Invitations" parame:nil isHud:YES isHaseCache:NO success:^(id json) {
        LWLog(@"%@",json);
        
        MiFangYaoQingModel * model = [MiFangYaoQingModel mj_objectWithKeyValues:[json objectForKey:@"data"]];
        [self.miFangYaoHeader configure:model];
        [self.cell configure:model];
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MiFangAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MiFangAccountTableViewCell" forIndexPath:indexPath];
    cell.delegate = self;
    self.cell = cell;
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    UIView * v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 10)];
    return v;
}



- (void)MiFangAccountClick:(NSUInteger)index{
    
    MiFangYaoViewController * vc = [[MiFangYaoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
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
