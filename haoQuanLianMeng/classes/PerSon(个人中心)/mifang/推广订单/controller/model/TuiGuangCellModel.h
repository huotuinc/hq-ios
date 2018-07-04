//
//  TuiGuangCellModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/4.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TuiGuangListDelegate.h"
#import "OrderItemModel.h"
@class TuiGuangModel;
@class ATuiGuangTableViewCell;

@interface TuiGuangCellModel : NSObject


@property (nonatomic,strong) TuiGuangModel * dataModel;


// //发货状态(默认-1全部,0-待发货,1-待收货,4-已退货,5-确认收货)
@property(nonatomic,assign) TuiGuangOrderStatus orderType;



+ (ATuiGuangTableViewCell *)confirmCellWithArticle:(TuiGuangModel *)dateModel slideType:(TuiGuangOrderStatus)selectType WithTableView:(UITableView *)tableView witdDelegate:(id<TuiGuangListDelegate>)delegate;


- (instancetype)initWithTuiGuangCellModel:(TuiGuangOrderStatus)orderType  data:(TuiGuangModel *)model;


@end
