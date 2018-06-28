//
//  TuiGuangTop.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/22.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TuiGuangTop.h"

@interface TuiGuangTop ()

@property (nonatomic,strong) UILabel * leftLable;
@property (nonatomic,strong) UILabel * rightLable;


@end


@implementation TuiGuangTop

- (UILabel *)leftLable{
    if (_leftLable == nil) {
        _leftLable = [[UILabel alloc] init];
        _leftLable.text = @"订单号1234561";
    }
    return _leftLable;
}

- (UILabel *)rightLable{
    if (_rightLable == nil) {
        _rightLable = [[UILabel alloc] init];
        _rightLable.text = @"待发货";
    }
    return _rightLable;
}


- (instancetype)init{
    if (self = [super init]) {
        
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    [self addSubview:self.leftLable];
    [self.leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(10);
        make.top.mas_equalTo(self.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-10);
    }];
    
    [self addSubview:self.rightLable];
    [self.rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).mas_equalTo(-10);
        make.centerY.mas_equalTo(self.leftLable.mas_centerY);
    }];
    
}

@end
