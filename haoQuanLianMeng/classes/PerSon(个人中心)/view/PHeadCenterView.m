//
//  PHeadCenterView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/1.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "PHeadCenterView.h"

@interface PHeadCenterView ()


@property (nonatomic,strong) UILabel * left;

@property (nonatomic,strong) UILabel * leftcenter;


@property (nonatomic,strong) UILabel * right;

@property (nonatomic,strong) UILabel * rightcenter;


@property (nonatomic,strong) UIView *centerview;
@property (nonatomic,strong) UIView *leftView;
@property (nonatomic,strong) UIView *rightView;

@end


@implementation PHeadCenterView


- (UIView *)centerview{
    if (_centerview == nil) {
        _centerview = [[UIView alloc] init];
        _centerview.backgroundColor = LWColor(203, 204, 205);
    }
    return _centerview;
}

- (UIView *)leftView{
    if (_leftView == nil) {
        _leftView = [[UIView alloc] init];
        _leftView.backgroundColor = LWColor(203, 204, 205);
    }
    return _leftView;
}

- (UIView *)rightView{
    if (_rightView== nil) {
        _rightView = [[UIView alloc] init];
        _rightView.backgroundColor = LWColor(203, 204, 205);
    }
    return _rightView;
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupInit];
    }
    return self;
}


- (void)setupInit{
    
    CGFloat height = [[HTTool HTToolShare] titleHeightWithFont:12];
    
    [self addSubview:self.centerview];
    [self.centerview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset((KScreenWidth - 1) * 0.5);
        make.height.mas_equalTo(height);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-3);
        make.width.mas_equalTo(1);
    }];
    
 
    
    self.left = [[UILabel alloc] init];
    self.left.text = @"直属推手 0";
    self.left.textColor = LWColor(100, 100, 100);
    self.left.font = kAdaptedFontSize(12);
    [self addSubview:self.left];
    [self.left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.centerview.mas_top);
        make.bottom.mas_equalTo(self.centerview.mas_bottom);
        make.right.mas_equalTo(self.centerview.mas_left).mas_offset(-10);
    }];
    
    
    [self addSubview:self.leftView];
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.centerview.mas_top);
        make.bottom.mas_equalTo(self.centerview.mas_bottom);
        make.right.mas_equalTo(self.left.mas_left).mas_offset(-10);
        make.width.mas_equalTo(1);
    }];
    
    
    self.right = [[UILabel alloc] init];
    self.right.font = kAdaptedFontSize(12);
    self.right.text = @"直属下级推手 1";
    self.right.textColor = LWColor(100, 100, 100);
    [self addSubview:self.right];
    [self.right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.centerview.mas_top);
        make.bottom.mas_equalTo(self.centerview.mas_bottom);
        make.left.mas_equalTo(self.centerview.mas_right).mas_offset(10);
    }];
    
    [self addSubview:self.rightView];
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.centerview.mas_top);
        make.bottom.mas_equalTo(self.centerview.mas_bottom);
        make.right.mas_equalTo(self.right.mas_right).mas_offset(10);
        make.width.mas_equalTo(1);
    }];
    
   
    
    
}

@end
