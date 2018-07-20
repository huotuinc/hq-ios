//
//  HTMessageCellModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTMessageModel.h"

typedef enum : NSUInteger {
    MessageSlideMoren = -1,
    MessageSlideXiTong = 0,
    MessageSlideZhuCe = 1,
    MessageSlideZhiFu = 2,
} MessageSlideType;


//推广类型(0普通1图片2视频)
typedef enum : NSUInteger {
    MessgaeMallNotice = 0, //系统消息
    MessgaeNutritionistExpire = 1, //营养师续费
    MessgaeNutritionisContinue = 2, //营养师续费
    MessgaeAgentMoneyNotEnough = 3, //代理商货款不足
    MessgaeDownMenberRegist = 4, //下线会员注册成功通知
    MessgaeUserBecomeAgent = 5, //升级为代理商
    MessageInviteBecomeNutritionis = 6, //邀请用户成为营养师
    MessageInviteBecomeAgent = 7, //邀请用户成为代理商
    //MessageMemberOrderPaySuccess = 8,
    MessageDownMemberPayOrder = 9, //下线会员支付成功通知
    MessageBuyGoodSuccess = 10  //代理商用户购买成功通知
    
} HTMessgaeType;



@interface HTMessageCellModel : NSObject


//服务端返回的数据的真实数据
@property (nonatomic,strong) id  messageModel;


//当前消息分类
@property (nonatomic,assign) HTMessgaeType messageType;


// 当前标题分类选项
@property(nonatomic,assign) MessageSlideType messageSlideType;



- (instancetype)initWithSlideType:(MessageSlideType)selectType messageType:(HTMessgaeType)articleType  message:(id)message;

- (UITableViewCell *)confirmCellWithTableView:(UITableView *)tableView withIndexPaht:(NSIndexPath *)indexPath witdDelegate:(id<HTArticleCenterViewDelegate>)delegate;



@end
