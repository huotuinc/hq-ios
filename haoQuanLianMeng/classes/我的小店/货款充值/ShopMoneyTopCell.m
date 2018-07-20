//
//  ShopTopCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ShopMoneyTopCell.h"

@implementation ShopMoneyTopCell


- (UILabel *)huokuanTitle{
    if (_huokuanTitle == nil) {
        _huokuanTitle = [[UILabel alloc] init];
        _huokuanTitle.text = @"可以贷款";
    }
    return _huokuanTitle;
}


- (UILabel *)huokanMoney{
    if (_huokanMoney == nil) {
        _huokanMoney = [[UILabel alloc] init];
        _huokanMoney.text = @"¥ 123";
    }
    return _huokanMoney;
}

- (UILabel *)subMoney{
    if (_subMoney == nil) {
        _subMoney = [[UILabel alloc] init];
    }
    return _subMoney;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.huokuanTitle];
        [self.huokuanTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.huokuanTitle.superview.mas_top).mas_offset(10);
            make.left.mas_equalTo(self.huokuanTitle.superview.mas_left).mas_equalTo(10);
        }];
        
        [self.contentView addSubview:self.huokanMoney];
        [self.huokanMoney mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.huokuanTitle.mas_bottom).mas_offset(kAdaptedWidth(10));
            make.left.mas_equalTo(self.huokuanTitle.mas_left);
            make.bottom.mas_equalTo(self.huokuanTitle.superview.mas_bottom).mas_offset(-10);
        }];
        
        [self.contentView addSubview:self.subMoney];
        [self.subMoney mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.huokuanTitle.mas_bottom).mas_offset(kAdaptedWidth(10));
            make.left.mas_equalTo(self.huokanMoney.mas_right).mas_offset(5);
            make.centerY.mas_equalTo(self.huokanMoney.mas_centerY);
        }];
        
    }
    return self;
}

- (void)configure:(ShopHuoKuanPage *)model{
    self.huokanMoney.text = [NSString stringWithFormat:@"¥ %.2f",model.MyDeposit];
    
    self.subMoney.text = [NSString stringWithFormat:@"(欠款¥%.2f元)",model.OweDeposit];
    
    
}

@end
