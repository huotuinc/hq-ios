//
//  InComeBottom.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/20.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "InComeBottom.h"


@interface InComeBottom ()


@property (nonatomic,strong) UILabel * titleLable;

@property (nonatomic,strong) UILabel * moneyLable;

@property (nonatomic,strong) UILabel * subLable;


@end


@implementation InComeBottom

- (UILabel *)titleLable{
    if (_titleLable == nil) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.text = @"今日收益";
    }
    return _titleLable;
}

- (UILabel *)moneyLable{
    if (_moneyLable == nil) {
        _moneyLable = [[UILabel alloc] init];
        _moneyLable.text = @"1000";
        _moneyLable.textColor = [UIColor redColor];
    }
    return _moneyLable;
}


- (UILabel *)subLable{
    if (_subLable == nil) {
        _subLable = [[UILabel alloc] init];
        _subLable.text = @"预估5收益";
        _subLable.textColor = LWColor(146, 146, 146);
        _subLable.font = kAdaptedFontSize(12);
    }
    return _subLable;
}


- (instancetype)init{
    if (self = [super init]) {
        [self setUpInit];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)setUpInit{
    
    [self addSubview:self.moneyLable];
    [self.moneyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    
    [self addSubview:self.titleLable];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(self.moneyLable.mas_top).mas_offset(kAdaptedWidth(-5));
    }];
    
    
    
    [self addSubview:self.subLable];
    [self.subLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.moneyLable.mas_bottom).mas_offset(kAdaptedWidth(5));
    }];
    
}

- (void)setTitle:(NSString *)title{
    _titleLable.text = title;
}


- (void)setMoney:(int)money andDan:(int)dan{
    _moneyLable.text = [NSString stringWithFormat:@"%d元",money];
    _subLable.text = [NSString stringWithFormat:@"预估%d单",dan];
}
@end
