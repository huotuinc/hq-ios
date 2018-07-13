//
//  HomeListItemView.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/31.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopGoodModel.h"


@interface HomeListItemView : UIView


+ (instancetype)shareHomeListItemView;



- (void)configure:(ShopGoodModel *)model;

@end
