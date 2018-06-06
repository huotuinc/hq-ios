//
//  MoneyHeaderCenterView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MoneyHeaderCenterView.h"

@interface MoneyHeaderCenterView()

@property (nonatomic,strong) UIImageView * iconView;

@property (nonatomic,strong) UILabel * leftLabel;

@property (nonatomic,strong) UILabel * rightLabel;





@end

@implementation MoneyHeaderCenterView


- (UILabel *)leftLabel {
    if (_leftLabel == nil){
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.text = @"兑换待到账";
        _leftLabel.textColor = LWColor(172, 172, 174);
     }
    return _leftLabel;
}

- (UILabel *)rightLabel {
    if (_rightLabel == nil){
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.text = @"0.0";
        _rightLabel.textColor = LWColor(175, 8, 16);
    }
    return _rightLabel;
}

- (UIImageView *)iconView {
    if (_iconView == nil){
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"wdzs"];
    }
    return _iconView;
}



- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

        [self setUpInit];
    }
    return self;
}

- (void)setUpInit {

    [self addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(kAdaptedHeight(20));
        make.left.mas_equalTo(self.mas_left).mas_offset(30);
    }];

    [self addSubview:self.leftLabel];
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(10);
        make.centerY.mas_equalTo(self.centerY);
    }];
    

    [self addSubview:self.rightLabel];
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).mas_offset(-20);
        make.centerY.mas_equalTo(self.centerY);
    }];

   



}

@end
