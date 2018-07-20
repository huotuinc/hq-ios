//
//  ShopCenterCellCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectLable.h"
#import "ShopHuoKuanPage.h"


@interface ShopMoneyCenterCellCell : UITableViewCell
@property (strong, nonatomic)  UILabel *chongzhiTitle;
@property (strong, nonatomic)  SelectLable *first;
@property (strong, nonatomic)  SelectLable *second;
@property (strong, nonatomic)  SelectLable *third;

//第四个选项
@property (strong, nonatomic)  SelectLable *fourth;


//选择的
@property (nonatomic,assign) int selectNum;


- (void)configure:(ShopHuoKuanPage *)model;


@end
