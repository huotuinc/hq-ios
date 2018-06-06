//
//  TuiGuangViewDownView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TuiGuangViewDownView.h"


@interface TuiGuangViewDownView ()


@property (nonatomic,strong) UILabel * topLable;

@property (nonatomic,strong) UILabel * downLeftLable;

@property (nonatomic,strong) UILabel * downRightLable;

@property (nonatomic,strong) UILabel * downRightRightLable;

@property (nonatomic,strong) UIImageView * iconView;


@property (nonatomic,strong) UIView * slider;

@end


@implementation TuiGuangViewDownView

- (UIView *)slider{
    if (_slider == nil) {
        _slider = [[UIView alloc] init];
        _slider.backgroundColor = LWColor(225, 225, 225);
    }
    return _slider;
}

- (UILabel *)topLable{
    if (_topLable == nil) {
        _topLable = [[UILabel alloc] init];
        _topLable.textColor = LWColor(141, 141, 141);
        _topLable.text = @"2018-05-26 已成团";
        _topLable.font = kAdaptedFontSize(21 * 0.5);
    }
    return _topLable;
}

- (UILabel *)downLeftLable{
    if (_downLeftLable == nil) {
        _downLeftLable = [[UILabel alloc] init];
        _downLeftLable.textColor = LWColor(141, 141, 141);
        _downLeftLable.text = @"消费 ¥ 13.5";
        _downLeftLable.font = kAdaptedFontSize(21 * 0.5);
    }
    return _downLeftLable;
}


- (UILabel *)downRightLable{
    if (_downRightLable == nil) {
        _downRightLable = [[UILabel alloc] init];
        _downRightLable.textColor = LWColor(234, 23, 32);
        _downRightLable.text = @"佣金";
        _downRightLable.textColor = LWColor(234, 23, 32);
        _downRightLable.font = kAdaptedFontSize(26*0.5);
    }
    return _downRightLable;
}

- (UILabel *)downRightRightLable{
    if (_downRightRightLable == nil) {
        _downRightRightLable = [[UILabel alloc] init];
        _downRightRightLable.textColor = LWColor(141, 141, 141);
        _downRightRightLable.text = @"25";
        _downRightRightLable.textColor = LWColor(234, 23, 32);
        _downRightRightLable.font = kAdaptedFontSize(26*0.5);
    }
    return _downRightRightLable;
}




- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"wdzs"];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconView;
}


- (instancetype)init{
    if (self = [super init]) {
        
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    
    
    [self addSubview:self.slider];
    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right);
        make.left.mas_equalTo(self.mas_left).mas_equalTo(10);
        make.top.mas_equalTo(self.mas_top);
        make.height.mas_equalTo(.8f);
    }];
    
    
    [self addSubview:self.topLable];
    [self.topLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(kAdaptedWidth(14));
        make.right.mas_equalTo(self.mas_right).mas_offset(-10);
    }];
    
    [self addSubview:self.downRightRightLable];
    [self.downRightRightLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topLable.mas_bottom).mas_offset(kAdaptedWidth(7));
        make.right.mas_equalTo(self.mas_right).mas_offset(-10);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-kAdaptedWidth(14));
    }];
    
    [self addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.downRightRightLable.mas_left).mas_offset(0);
        //make.height.width.mas_equalTo(kAdaptedWidth(20));
        //make.centerY.mas_equalTo(self.downRightRightLable.centerY);
        make.top.mas_equalTo(self.downRightRightLable.mas_top);
        make.bottom.mas_equalTo(self.downRightRightLable.mas_bottom);
        make.width.mas_equalTo(self.iconView.mas_height);
        
    }];
    
    [self addSubview:self.downRightLable];
    [self.downRightLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.iconView.mas_left).mas_offset(0);
        make.top.mas_equalTo(self.downRightRightLable.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-kAdaptedWidth(14));
    }];
    
    
    [self addSubview:self.downLeftLable];
    [self.downLeftLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.downRightLable.mas_left).mas_offset(-2);
        make.top.mas_equalTo(self.downRightRightLable.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-kAdaptedWidth(14));
    }];
    
    
    
    
    
    
    
//    [self addSubview:self.downRightleftLable];
    
    
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
