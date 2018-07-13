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


// 0 表示 业务  1 系统
@property (nonatomic,assign) MessageSlideType type;



@property (nonatomic,assign) CGFloat content;
@end
