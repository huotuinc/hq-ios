//
//  ShuListTableViewCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/31.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopGoodModel.h"

@interface ShuListTableViewCell : UITableViewCell

@property (nonatomic,strong) ShopGoodModel * leftdataModel;

@property (nonatomic,strong) ShopGoodModel * rightdataModel;

//shi
@property (nonatomic,assign) bool haveRight;

@end
