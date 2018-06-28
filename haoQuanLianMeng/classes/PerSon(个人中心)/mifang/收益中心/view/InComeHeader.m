//
//  InComeHeader.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/20.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "InComeHeader.h"
@interface InComeHeader ()

@property (nonatomic,strong) UILabel * yuE;

@property (nonatomic,strong) UILabel * yuMoneyLable;


@property (nonatomic,strong) UILabel * daiJieSuan;


@property (nonatomic,strong) UILabel * daiJieMoneyLable;


@end

@implementation InComeHeader


- (UILabel *)yuE{
    if (_yuE == nil) {
        _yuE = [[UILabel alloc] init];
        _yuE.text = @"余额";
        _yuE.textColor = [UIColor whiteColor];
    }
    return _yuE;
}

- (UILabel *)yuMoneyLable{
    if (_yuMoneyLable == nil) {
        _yuMoneyLable = [[UILabel alloc] init];
        _yuMoneyLable.text = @"1.25";
        _yuMoneyLable.font = kAdaptedFontSize(36);
        _yuMoneyLable.textColor = [UIColor whiteColor];
    }
    return _yuMoneyLable;
}

- (UILabel *)daiJieSuan{
    if (_daiJieSuan == nil) {
        _daiJieSuan = [[UILabel alloc] init];
        _daiJieSuan.text = @"带结算";
        _daiJieSuan.textColor = [UIColor whiteColor];
    }
    
    return _daiJieSuan;
}

- (UILabel *)daiJieMoneyLable{
    if (_daiJieMoneyLable == nil) {
        _daiJieMoneyLable = [[UILabel alloc] init];
        _daiJieMoneyLable.text = @"1.25";
        _daiJieMoneyLable.font = kAdaptedFontSize(36);
        _daiJieMoneyLable.textColor = [UIColor whiteColor];
    }
    return _daiJieMoneyLable;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = LWColor(255, 51, 52);
        [self setUpInit];
    }
    return self;
}


/**
 *
 **/
- (void)setUpInit{
    
    [self addSubview:self.yuMoneyLable];
    [self.yuMoneyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).multipliedBy(0.5);
        make.centerY.mas_equalTo(self.mas_centerY).mas_offset(kAdaptedWidth(7));
    }];
    
    
    [self addSubview:self.yuE];
    [self.yuE mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).multipliedBy(0.5);
        make.bottom.mas_equalTo(self.yuMoneyLable.mas_top).mas_offset(-1);
    }];
    
    
    [self addSubview:self.daiJieMoneyLable];
    [self.daiJieMoneyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).multipliedBy(1.5);
        make.centerY.mas_equalTo(self.mas_centerY).mas_offset(kAdaptedWidth(7));
    }];
    
    
    [self addSubview:self.daiJieSuan];
    [self.daiJieSuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).multipliedBy(1.5);
        make.bottom.mas_equalTo(self.daiJieMoneyLable.mas_top).mas_offset(-1);
    }];
    
    
    
    
    
}
@end
