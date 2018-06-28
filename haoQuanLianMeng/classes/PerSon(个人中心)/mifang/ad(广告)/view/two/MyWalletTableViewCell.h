//
//  MyWalletTableViewCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/15.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MiFangUserCenterModel.h"

@protocol MyWalletTableViewDelegate <NSObject>

- (void)MyWalletTopViewClick:(int)type;

@end


@interface MyWalletTableViewCell : UITableViewCell

@property (nonatomic,weak) id <MyWalletTableViewDelegate> delegate;


- (void)configWithData:(MiFangUserCenterModel *)model;

@end
