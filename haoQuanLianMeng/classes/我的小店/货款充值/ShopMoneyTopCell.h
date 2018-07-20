//
//  ShopTopCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopHuoKuanPage.h"


@interface ShopMoneyTopCell : UITableViewCell

@property (strong, nonatomic)  UILabel *huokuanTitle;

@property (strong, nonatomic)  UILabel *huokanMoney;

@property (strong, nonatomic)  UILabel *subMoney;


- (void)configure:(ShopHuoKuanPage *)model;

@end
