//
//  ShopCenterCellCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ShopMoneyCenterCellCell.h"

@implementation ShopMoneyCenterCellCell

- (UILabel *)chongzhiTitle{
    if (_chongzhiTitle == nil) {
        _chongzhiTitle = [[UILabel alloc] init];
        _chongzhiTitle.text = @"充值金额";
    }
    return _chongzhiTitle;
}


- (SelectLable *)first{
    if (_first == nil) {
        _first = [[SelectLable alloc] init];
        _first.text = @"  1000  ";
        _first.layer.borderWidth = .3f;
        _first.textAlignment = NSTextAlignmentCenter;
        _first.layer.borderColor = LWColor(205, 205, 205).CGColor;
        _first.select = 1;
    }
    return _first;
}

- (SelectLable *)second{
    if (_second == nil) {
        _second = [[SelectLable alloc] init];
        _second.text = @"  2000  ";
        _second.layer.borderWidth = .3f;
        _second.textAlignment = NSTextAlignmentCenter;
        _second.layer.borderColor = LWColor(205, 205, 205).CGColor;
    }
    return _second;
}

- (SelectLable *)third{
    if (_third == nil) {
        _third = [[SelectLable alloc] init];
        _third.text = @"  5000  ";
        _third.layer.borderWidth = .3f;
        _third.textAlignment = NSTextAlignmentCenter;
        _third.layer.borderColor = LWColor(205, 205, 205).CGColor;
    }
    return _third;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.chongzhiTitle];
        [self.chongzhiTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.chongzhiTitle.superview.mas_top).mas_offset(10);
            make.left.mas_equalTo(self.chongzhiTitle.superview.mas_left).mas_equalTo(10);
        }];
    
        [self.contentView addSubview:self.first];
        [self.first mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.chongzhiTitle.mas_bottom).mas_offset(kAdaptedWidth(10));
            make.left.mas_equalTo(self.chongzhiTitle.mas_left);
            make.height.mas_equalTo(kAdaptedWidth(35));
            make.width.mas_equalTo(70);
            make.bottom.mas_equalTo(self.first.superview.mas_bottom).mas_offset(-10);
        }];
    
        [self.contentView addSubview:self.second];
        [self.second mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.first.mas_top);
            make.left.mas_equalTo(self.first.mas_right).mas_offset(6);
            make.height.mas_equalTo(kAdaptedWidth(35));
            make.width.mas_equalTo(70);
            make.bottom.mas_equalTo(self.first.mas_bottom);
        }];
    
        [self.contentView addSubview:self.third];
        [self.third mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.first.mas_top);
            make.left.mas_equalTo(self.second.mas_right).mas_offset(6);
            make.height.mas_equalTo(kAdaptedWidth(35));
            make.width.mas_equalTo(70);
            make.bottom.mas_equalTo(self.first.mas_bottom);
        }];
    }
    return self;
}
@end
