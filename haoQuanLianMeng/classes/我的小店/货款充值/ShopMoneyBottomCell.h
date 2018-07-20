//
//  ShopBottomCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectLable.h"


@interface ShopMoneyBottomCell : UITableViewCell


@property (strong, nonatomic)  UILabel *payChanel;
@property (strong, nonatomic)  SelectLable *zhifubao;
@property (strong, nonatomic)  SelectLable *weixinLable;

@property (strong, nonatomic)  SelectLable * lianlianPay;


- (void)configure:(NSArray *)dataArray;
@end
