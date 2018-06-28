//
//  TuiGuangCenter.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/22.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TuiGuangCenter.h"

@interface TuiGuangCenter ()

@property (nonatomic,strong) UIImageView  * iconView;

@property (nonatomic,strong) UILabel * leftLable;

@property (nonatomic,strong) UILabel * rightLable;

@property (nonatomic,strong) UILabel * rightDownLable;


@end


@implementation TuiGuangCenter


- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}


- (UILabel *)leftLable{
    if (_leftLable == nil) {
        _leftLable = [[UILabel alloc] init];
        _leftLable.text = @"女装";
    }
    return _leftLable;
}


- (UILabel *)rightLable{
    if (_rightLable == nil) {
        _rightLable = [[UILabel alloc] init];
        _rightLable.text = @"¥1";
    }
    return _rightLable;
}


- (UILabel *)rightDownLable{
    if (_rightDownLable == nil) {
        _rightDownLable = [[UILabel alloc] init];
        _rightDownLable.text = @"x1";
    }
    return _rightDownLable;
}


- (instancetype)init{
    if(self = [super init]){
        
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    self.backgroundColor = LWColor(250, 250, 250);
    [self addSubview:self.iconView];
    self.iconView.backgroundColor = [UIColor redColor];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(kAdaptedWidth(60));
        make.top.mas_equalTo(self.mas_top).mas_offset(kAdaptedWidth(15));
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-kAdaptedWidth(15));
        make.left.mas_equalTo(self.mas_left).mas_offset(kAdaptedWidth(10));
    }];
    
    [self addSubview:self.leftLable];
    [self.leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(kAdaptedWidth(10));
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(kAdaptedWidth(10));
    }];
    
    [self addSubview:self.rightLable];
    [self.rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.leftLable.mas_top);
        make.right.mas_equalTo(self.mas_right).mas_offset(-kAdaptedWidth(10));
    }];
    
    [self addSubview:self.rightDownLable];
    [self.rightDownLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.rightLable.mas_bottom).mas_offset(5);
        make.right.mas_equalTo(self.rightLable.mas_right);
    }];
    
}

@end
