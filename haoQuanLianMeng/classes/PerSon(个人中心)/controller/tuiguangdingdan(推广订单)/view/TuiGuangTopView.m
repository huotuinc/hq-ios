//
//  TuiGuangTopView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TuiGuangTopView.h"

@interface TuiGuangTopView ()

@property (nonatomic,strong) UILabel * leftTitle;
@property (nonatomic,strong) UILabel * rightTitle;
@property (nonatomic,strong) UIButton * rightBtn;

@end


@implementation TuiGuangTopView

- (UILabel *)leftTitle{
    if (_leftTitle == nil) {
        _leftTitle = [[UILabel alloc] init];
        _leftTitle.text = @"拼多多订单";
        _leftTitle.textColor = LWColor(75, 75, 75);
        _leftTitle.font = kAdaptedFontSize(25*0.5);
    }
    return _leftTitle;
}

- (UILabel *)rightTitle{
    if (_rightTitle == nil) {
        _rightTitle = [[UILabel alloc] init];
        _rightTitle.text = @"不限";
        _rightTitle.textColor = LWColor(75, 75, 75);
        _rightTitle.font = kAdaptedFontSize(25*0.5);
    }
    return _rightTitle;
}


- (UIButton *)rightBtn{
    if (_rightBtn == nil) {
        _rightBtn = [[UIButton alloc] init];
        [_rightBtn setImage:[UIImage imageNamed:@"dingdanL"] forState:UIControlStateNormal];
    }
    return _rightBtn;
}

- (instancetype)init{
    if (self = [super init]) {
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit {

    [self addSubview:self.leftTitle];
    [self.leftTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(10);
        make.centerY.mas_equalTo(self.centerY);
    }];

    [self addSubview:self.rightBtn];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(18);
        make.centerY.mas_equalTo(self.centerY);
        make.right.mas_equalTo(self.mas_right).mas_offset(-10);
    }];


    [self addSubview:self.rightTitle];
    [self.rightTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.rightBtn.mas_left).mas_offset(-10);
        make.centerY.mas_equalTo(self.centerY);
    }];



}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
