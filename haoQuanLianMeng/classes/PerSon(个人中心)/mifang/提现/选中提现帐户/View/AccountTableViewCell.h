//
//  AccountTableViewCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/20.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AccountList.h"

typedef void(^selectClcik)(AccountList * model);


@protocol AccountTableViewDelegate <NSObject>


- (void)BuildClick:(AccountList *)model;


@end


@interface AccountTableViewCell : UITableViewCell


@property (nonatomic, copy) selectClcik selectClcik;// 点击按钮

@property (nonatomic,strong) AccountList * model;

@property (nonatomic,weak) id <AccountTableViewDelegate> delegate;

@end
