//
//  TuiGuangModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/4.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>


@class OrderItemModel;

@interface TuiGuangModel : NSObject


@property (nonatomic, copy) NSString * CreatTime;
@property (nonatomic, copy) NSString * DepthName;
@property (nonatomic, assign) int Integral;
@property (nonatomic, copy) NSString * LevelName;
@property (nonatomic, copy) NSString * OrderFinalAmount;
@property (nonatomic, copy) NSString * OrderGoodsNum;
@property (nonatomic, copy) NSString * OrderID;
@property (nonatomic, copy) NSString * OrderShipStatus;
@property (nonatomic, copy) NSString * wxNickName;
@property (nonatomic, strong) NSArray <OrderItemModel *>* OrderItemInfo;




@end
