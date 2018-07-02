//
//  AccountBuildController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "AccountBuildController.h"
#import "ACBuildTableViewCell.h"
#import "ACBuilTableViewCell.h"
#import "AcFooterView.h"
@interface AccountBuildController ()<AcFooterViewDelegate>


@property (nonatomic,strong) ACBuildTableViewCell * cell;;


@property (nonatomic,strong) ACBuilTableViewCell * name;

@property (nonatomic,strong) ACBuilTableViewCell * account;



@property (nonatomic,strong) AcFooterView * acFooter;

@end

@implementation AccountBuildController

- (void)btnClick{
    
    LWLog(@"xxxxxx");
    
    int a =  [self.cell getCurrentType];
    NSString * name = [self.name getText];
    NSString * acc  = [self.account getText];
    
//    RealName    是    string    真实姓名（支付宝必传，微信钱包可不传）
//    AccountInfo    是    string    提现账户（支付宝必传，微信钱包可不传）
//    AccountType    是    int    提现账户类型，1支付宝 2 银行卡 4 微信零钱 5 结算通 6 API打款
//    AccountId    是    int    默认账户Id
    
    if (!name.length) {
        [MBProgressHUD showError:@"姓名为空"];
        return;
    }
    
    if (a && !acc.length) {
        [MBProgressHUD showError:@"帐号不能为空"];
        return;
    }
    
    NSMutableDictionary * parame = [NSMutableDictionary dictionary];
    parame[@"RealName"] = name;
    parame[@"AccountInfo"] = acc;
    parame[@"AccountId"] = (self.model ? @(self.model.AccountId) : @"0");
    parame[@"AccountType"] =  @((a == 1 ? 4 : 1));
    [HTNetworkingTool HTNetworkingToolPost:@"user/EditAccount" parame:parame isHud:YES isHaseCache:NO success:^(id json) {
        [MBProgressHUD showSuccess:@"添加成功"];
    } failure:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.navigationItem.title = @"修改帐号";
    
    self.tableView.contentInset = UIEdgeInsetsMake(-36, 0, 0, 0);
    self.tableView.sectionFooterHeight = 0;
    self.acFooter = [[AcFooterView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 60)];
    self.acFooter.delegate = self;
    self.tableView.tableFooterView = self.acFooter;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    [self.tableView registerClass:[ACBuildTableViewCell class] forCellReuseIdentifier:@"ACBuildTableViewCell"];
    [self.tableView registerClass:[ACBuilTableViewCell class] forCellReuseIdentifier:@"ACBuilTableViewCell"];
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

    return section == 0 ? 1 : 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        ACBuildTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ACBuildTableViewCell" forIndexPath:indexPath];
        self.cell = cell;
        [cell configure:self.model];
        return cell;
    }else{
        ACBuilTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ACBuilTableViewCell" forIndexPath:indexPath];
        if (indexPath.row == 0) {
            self.name = cell;
        }else{
            self.account = cell;
        }
        cell.indexPath = indexPath;
        [cell configure:self.model];
        return cell;
    }
    
}



- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
//    [[NSNotificationCenter defaultCenter] removeObserver:nil name:@"accountSwich" object:nil];
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
