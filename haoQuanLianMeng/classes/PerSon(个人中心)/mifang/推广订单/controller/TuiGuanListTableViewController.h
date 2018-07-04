//
//  TuiGuanListTableViewController.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/23.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuiGuangModel.h"
#import "OrderItemModel.h"

@interface TuiGuanListTableViewController : LWTableViewController


//当前的选择状态
@property (nonatomic,assign) TuiGuangOrderStatus orderStatus;


@end
