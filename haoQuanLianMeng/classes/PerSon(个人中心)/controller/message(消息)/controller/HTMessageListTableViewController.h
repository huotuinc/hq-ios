//
//  HTMessageListTableViewController.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTMessageCellModel.h"

@interface HTMessageListTableViewController : LWTableViewController

// 默认 = -1
//  系统消息 = 0,
//注册通知 = 1,
//支付通知 = 2
@property (nonatomic,assign) MessageSlideType type;



@property (nonatomic,assign) CGFloat content;
@end
