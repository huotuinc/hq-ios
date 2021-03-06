//
//  VipTimeTableViewCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/15.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MiFangUserCenterModel.h"


@protocol VipTimeTableViewDelegate <NSObject>

- (void)xufeiClick;
@end


@interface VipTimeTableViewCell : UITableViewCell


@property (nonatomic,weak) id <VipTimeTableViewDelegate> delegate;


- (void)configWithData:(MiFangUserCenterModel *)model;

@end
