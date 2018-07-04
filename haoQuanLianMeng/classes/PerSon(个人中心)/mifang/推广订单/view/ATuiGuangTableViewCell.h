//
//  TuiGuangTableViewCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/22.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuiGuangListDelegate.h"

@class TuiGuangCellModel;

@interface ATuiGuangTableViewCell : UITableViewCell

- (void)configure:(TuiGuangCellModel *) model;


@property (nonatomic, strong) id<TuiGuangListDelegate>delegate;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andData:(TuiGuangCellModel *)model;


@end
