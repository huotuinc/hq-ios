//
//  PerHeadViewContainer.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/1.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PerHeadViewContainerDelegate <NSObject>


//头部设置点击
- (void)PerHeadViewSettingClick;

// 0 昨日  1 今日  2 累计
- (void)PerHeadViewContainerCenterDownClick:(int)type;

// 0 推广订单  1 我的团队  2 团队收益  3 我的钻石
- (void)PerHeadViewOrderCenterDownClick:(int)type;

@end




@interface PerHeadViewContainer : UIView


+ (instancetype) PerHeadViewContainerShare;


@property(nonatomic,weak) id <PerHeadViewContainerDelegate> delegate;

@end

