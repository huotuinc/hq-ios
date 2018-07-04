//
//  OrderItemModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/4.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

//发货状态(默认-1全部,0-待发货,1-待收货,4-已退货,5-确认收货)
typedef enum : NSUInteger {
    TuiGuangOrderPlane = -1,
    TuiGuangOrderWaitSendGoood = 0,
    TuiGuangOrderWaitGetGood = 1,
    TuiGuangOrderBackGood = 4,
    TuiGuangOrderGetGood = 5,
} TuiGuangOrderStatus;

@interface OrderItemModel : NSObject

@property (nonatomic, copy) NSString * OrderID;
@property (nonatomic, copy) NSString * ProductImgUrl;
@property (nonatomic, copy) NSString * ProductName;
@property (nonatomic, assign) int ProductNum;
@property (nonatomic, strong) NSNumber * ProductPrice;
@property (nonatomic, strong) NSNumber *  ProductSpec;

@end
