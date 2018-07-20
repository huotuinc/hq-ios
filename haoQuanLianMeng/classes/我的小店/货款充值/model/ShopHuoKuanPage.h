//
//  ShopHuoKuanPage.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/15.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GoodsItems : NSObject

@property (nonatomic,assign) int GoodsId;
@property (nonatomic,assign) int ProductId;
@property (nonatomic,copy) NSString * DepositPrice;

@end


@interface ShopHuoKuanPage : NSObject

@property (nonatomic,assign) double MyDeposit;
@property (nonatomic,assign) double OweDeposit;

@property (nonatomic,strong) NSArray * GoodsItems;
            
            
            
@end
