//
//  ShopHomeHeader.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/3.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopAccountModel.h"


@protocol ShopHomeHeaderDelegate <NSObject>
@required
- (void)ShopHomeHeaderClick:(int)option;

@end



@interface ShopHomeHeader : UIView


@property (nonatomic,weak) id <ShopHomeHeaderDelegate> delegate;


- (void)configure:(ShopAccountModel *)model;
@end
