//
//  HTMessageListTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTMessageListTableViewController.h"
#import "HTMessageModel.h"
#import "HTSysMessageModel.h"
#import "MessageContainerModel.h"
#import "HTMessageModel.h"
#import "HTMessageInModel.h"
#import "MessgeXiTableViewCell.h"
#import "MallMessageCell.h"
#import "HTDaiLiOrderPayModel.h"
#import "OrderPayModel.h"
#import "HTYinYangShiModel.h"
#import "HTMessageNoMoney.h"
#import "HTMessageUpdate.h"



@interface HTMessageListTableViewController ()

@end

@implementation HTMessageListTableViewController


//- (void)setContent:(CGFloat)content{
//    
//    self.tableView.contentInset = UIEdgeInsetsMake(kAdaptedWidth(50), 0, 0, 0);
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
//    self.tableView.contentInset = UIEdgeInsetsMake(kAdaptedWidth(50), 0, 75, 0);
    
//    [self.tableView registerClass:[MessgeXiTableViewCell class] forCellReuseIdentifier:@"MessgeXiTableViewCell"];
//    [self.tableView registerClass:[MallMessageCell class] forCellReuseIdentifier:@"MallMessageCell"];
    
    
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
//    [self.tableView registerClass:[HTMessageTableViewCell class] forCellReuseIdentifier:@"HTMessageTableViewCell"];
    
    self.tableView.contentInset = UIEdgeInsetsMake(kAdaptedWidth(50)+ 1, 0, kAdaptedWidth(50), 0);
    self.tableView.backgroundColor = LWColor(241, 242, 243);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self getInitData:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)refreshHeader{
    self.refreshPageIndex = 1;
    [self getInitData:0];
    
}

- (void)refreshFooter{
    self.refreshPageIndex += 1;
    [self getInitData:1];
    
}

- (void)getInitData:(int)type{
//    默认 = -1,
//    系统消息 = 0,
//    注册通知 = 1,
//    支付通知 = 2
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"Type"] = @(self.type);
    dict[@"PageIndex"] = @(self.refreshPageIndex);
    dict[@"PageSize"] = @(10);
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"User/GetJPushList" parame:dict isHud:YES isHaseCache:NO success:^(id json) {
        
        LWLog(@"%@",json);
        NSArray * data = [MessageContainerModel mj_objectArrayWithKeyValuesArray:json[@"data"]];
        if (data.count) {
            [self detailOriginData:data withFooter:type];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        
    }];
}


- (void)detailOriginData:(NSArray <MessageContainerModel *>*)data withFooter:(int)type{
    
    if (type == 0) {
        [self.dataArray removeAllObjects];
    }
    
    //[self.dataArray addObjectsFromArray:data];
    
    for (int i = 0; i < data.count; i++) {
        MessageContainerModel * dict = [data objectAtIndex:i];
        int messageType =  [dict.JpushType intValue];
        switch (messageType) {
            case MessgaeNutritionistExpire:{ //营养师到期续费通知
                HTYinYangShiModel * model = [HTYinYangShiModel mj_objectWithKeyValues:[dict.NotificationContent mj_JSONObject]];
                HTMessageCellModel * cellModel = [[HTMessageCellModel alloc] initWithSlideType:self.type messageType:MessgaeNutritionistExpire message:model];
                [self.dataArray addObject:cellModel];
                LWLog(@"tt");
                break;
            }
            case MessgaeNutritionisContinue :{ //营养师续费成功通知
                HTYinYangShiModel * model = [HTYinYangShiModel mj_objectWithKeyValues:[dict.NotificationContent mj_JSONObject]];
                HTMessageCellModel * cellModel = [[HTMessageCellModel alloc] initWithSlideType:self.type messageType:MessgaeNutritionisContinue message:model];
                [self.dataArray addObject:cellModel];
                LWLog(@"tt");
                break;
            }
            case MessgaeAgentMoneyNotEnough:{ //代理商货款不足
                HTMessageNoMoney * model = [HTMessageNoMoney mj_objectWithKeyValues:[dict.NotificationContent mj_JSONObject]];
                HTMessageCellModel * cellModel = [[HTMessageCellModel alloc] initWithSlideType:self.type messageType:MessgaeAgentMoneyNotEnough message:model];
                [self.dataArray addObject:cellModel];
                LWLog(@"tt");
                break;
            }
            case MessgaeMallNotice:{ //系统通知
                HTSysMessageModel * model = [HTSysMessageModel mj_objectWithKeyValues:[dict.NotificationContent mj_JSONObject]];
                HTMessageCellModel * cellModel = [[HTMessageCellModel alloc] initWithSlideType:self.type messageType:MessgaeMallNotice message:model];
                [self.dataArray addObject:cellModel];
                break;
            }
            case MessgaeDownMenberRegist:{ //下线会员注册成功通知
                HTMessageInModel * model = [HTMessageInModel mj_objectWithKeyValues:[dict.NotificationContent mj_JSONObject]];
                HTMessageCellModel * cellModel = [[HTMessageCellModel alloc] initWithSlideType:self.type messageType:MessgaeDownMenberRegist message:model];
                [self.dataArray addObject:cellModel];
                LWLog(@"tt");
                break;
            }
            case MessageInviteBecomeNutritionis | MessageInviteBecomeAgent | MessgaeUserBecomeAgent :{ //好友成为代理商 营养师
                
                HTMessageUpdate * model = [HTMessageUpdate mj_objectWithKeyValues:[dict.NotificationContent mj_JSONObject]];
                HTMessageCellModel * cellModel = [[HTMessageCellModel alloc] initWithSlideType:self.type messageType:MessgaeDownMenberRegist message:model];
                [self.dataArray addObject:cellModel];
                LWLog(@"tt");
                break;
                
            }case MessageDownMemberPayOrder :{ //下线会员订单支付成功通知
                HTDaiLiOrderPayModel * model = [HTDaiLiOrderPayModel mj_objectWithKeyValues:[dict.NotificationContent mj_JSONObject]];
                HTMessageCellModel * cellModel = [[HTMessageCellModel alloc] initWithSlideType:self.type messageType:MessageDownMemberPayOrder message:model];
                [self.dataArray addObject:cellModel];
                break;
            }
            case MessageBuyGoodSuccess :{ //用户商品购买成功通知
                OrderPayModel * model = [OrderPayModel mj_objectWithKeyValues:[dict.NotificationContent mj_JSONObject]];
                HTMessageCellModel * cellModel = [[HTMessageCellModel alloc] initWithSlideType:self.type messageType:MessageBuyGoodSuccess message:model];
                [self.dataArray addObject:cellModel];
                break;
            }
            default:
                break;
        }
    }
    
    
    [self.tableView reloadData];
    
}


#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HTMessageCellModel * model =  [self.dataArray objectAtIndex:indexPath.row];
    return [model confirmCellWithTableView:tableView withIndexPaht:indexPath witdDelegate:self];

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
