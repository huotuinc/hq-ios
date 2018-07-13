//
//  BuyAccountTableViewCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BuyAccountModel.h"


@interface BuyAccountTableViewCell : UITableViewCell

- (void)configure:(BuyAccountModel * )model;

@property (nonatomic,strong) UILabel * numLable;


@property (nonatomic,assign) int  num;

@end
