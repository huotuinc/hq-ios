//
//  MoneyHeaderView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MoneyHeaderView.h"


@interface MoneyHeaderView ()

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel * moneyLabel;

@property (nonatomic, strong) UIButton * moneyChangeBtn;

@end


@implementation MoneyHeaderView



- (UILabel *)titleLabel {
    if (_titleLabel == nil){
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = kAdaptedFontSize(16);
        _titleLabel.text = @"可兑换(钻):";
        _titleLabel.textColor = LWColor(255, 255, 255);
    }
    return _titleLabel;
}


- (UILabel *)moneyLabel {
    if (_moneyLabel == nil){
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.font = kAdaptedFontSize(45);
        _moneyLabel.textColor = LWColor(255, 255, 255);
        _moneyLabel.text = @"0.00";
    }
    return _moneyLabel;
}


- (UIButton *)moneyChangeBtn {
    if (_moneyChangeBtn == nil){
        _moneyChangeBtn = [[UIButton alloc] init];
        [_moneyChangeBtn setTitle:@"体现" forState:UIControlStateNormal];
        [_moneyChangeBtn setTitleColor:LWColor(172, 172, 174) forState:UIControlStateNormal];
        [_moneyChangeBtn setBackgroundColor:LWColor(255, 255, 255)];
        [_moneyChangeBtn addTarget:self action:@selector(changeMoney) forControlEvents:UIControlEventTouchUpInside];
        _moneyChangeBtn.layer.cornerRadius = 5;
        _moneyChangeBtn.layer.masksToBounds = YES;
    }
    return _moneyChangeBtn;
}


- (instancetype)init{
    if (self = [super init]){
        [self setUpInit];
    }
    return self;
}

- (void)setUpInit{

    self.backgroundColor = LWColor(175, 8, 16);

    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.centerY);
        make.left.mas_equalTo(self).mas_offset(30);

    }];


    [self addSubview:self.moneyLabel];
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.centerY);
        make.left.mas_equalTo(self.titleLabel.mas_right).mas_offset(5);
    }];



    [self addSubview:self.moneyChangeBtn];
    [self.moneyChangeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(kAdaptedWidth(31));
        make.width.mas_equalTo(kAdaptedWidth(72));
        make.centerY.mas_equalTo(self.centerY);
        make.right.mas_equalTo(self.mas_right).mas_offset(-20);

    }];
}


- (void)changeMoney{
    if ([self.delegate respondsToSelector:@selector(moneyHeaderViewChangeMoney)]){
        [self.delegate moneyHeaderViewChangeMoney];
    }
}


- (CGFloat)getHeight{
    return kAdaptedHeight(90);
}

@end
