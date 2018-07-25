//
//  MyWalletTitleView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/15.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MyWalletTitleView.h"

@interface MyWalletTitleView ()



@property (nonatomic,strong) UILabel * downLabel;


@end


@implementation MyWalletTitleView


- (UILabel *)upLabel{
    if (_upLabel == nil) {
        _upLabel = [[UILabel alloc] init];
        _upLabel.text = @"0";
        _upLabel.font = kAdaptedFontSize(20);
        _upLabel.textColor = [UIColor redColor];
    }
    return _upLabel;
}

- (UILabel *)downLabel{
    if (_downLabel == nil) {
        _downLabel = [[UILabel alloc] init];
        _downLabel.text = @"积分";
        _downLabel.font = kAdaptedFontSize(12);
        _downLabel.textColor = LWColor(75, 75, 75);
    }
    return _downLabel;
}



- (instancetype)init{
    if (self = [super init]) {
        
        [self setUpInit];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}



- (void)setUpInit{
    
    [self addSubview:self.upLabel];
    [self.upLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY).mas_offset(kAdaptedWidth(-7));
    }];
    
    [self addSubview:self.downLabel];
    [self.downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.upLabel.mas_bottom).mas_offset(3);
    }];
    
}

- (void)setTitle:(NSString *) title{
    self.downLabel.text = title;
}

- (void)setValue:(int) value{
    self.upLabel.text = [NSString stringWithFormat:@"%d",value];
}



@end
