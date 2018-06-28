//
//  TuiGuangBottom.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/22.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TuiGuangBottom.h"

@interface TuiGuangBottom ()

@property (nonatomic,strong) UILabel * leftLable;

@property (nonatomic,strong) UILabel * rightLable;

@property (nonatomic,strong) UILabel * rightDownLable;


@end



@implementation TuiGuangBottom


- (UILabel *)leftLable{
    if (_leftLable == nil) {
        _leftLable = [[UILabel alloc] init];
        _leftLable.text = @"20190000";
    }
    return _leftLable;
}


- (UILabel *)rightLable{
    if (_rightLable == nil) {
        _rightLable = [[UILabel alloc] init];
        _rightLable.text = @"获取20积分";
    }
    return _rightLable;
}


- (UILabel *)rightDownLable{
    if (_rightDownLable == nil) {
        _rightDownLable = [[UILabel alloc] init];
        _rightDownLable.text = @"获取20积分";
    }
    return _rightDownLable;
}


- (instancetype)init{
    if (self = [super init]) {
        
        [self addSubview:self.rightLable];
        [self.rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).mas_offset(kAdaptedWidth(5));
            make.right.mas_equalTo(self.mas_right).mas_offset(kAdaptedWidth(-10));
        }];
        
        [self addSubview:self.rightDownLable];
        [self.rightDownLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.rightLable.mas_bottom).mas_offset(kAdaptedWidth(5));
            make.right.mas_equalTo(self.mas_right).mas_offset(kAdaptedWidth(-10));
            make.bottom.mas_equalTo(self.mas_bottom).mas_offset(kAdaptedWidth(-10));
        }];
        
        
        
        [self addSubview:self.leftLable];
        [self.leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).mas_offset(10);
            make.baseline.mas_equalTo(self.rightDownLable.mas_baseline);
        }];
    }
    return self;
}

@end
