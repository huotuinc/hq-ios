//
//  PHHeadCenterDown.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/1.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "PHHeadCenterDown.h"

@interface PHHeadCenterDown ()

@property (nonatomic,strong) UILabel * left;

@property (nonatomic,strong) UILabel * leftDown;


@property (nonatomic,strong) UILabel * centerTitle;

@property (nonatomic,strong) UILabel * centerDown;


@property (nonatomic,strong) UILabel * right;

@property (nonatomic,strong) UILabel * rightDown;

@end


@implementation PHHeadCenterDown


- (UILabel *)left{
    if (_left == nil) {
        _left = [[UILabel alloc] init];
        _left.textAlignment = NSTextAlignmentCenter;
        _left.text = @"0";
        _left.font = kAdaptedFontSize(26);
        _left.userInteractionEnabled = YES;
        KWeakSelf(self);
        [_left bk_whenTapped:^{
            [weakself.delegate PHHeadCenterDownClick:0];
        }];
    }
    return _left;
}

- (UILabel *)leftDown{
    if (_leftDown == nil) {
        _leftDown = [[UILabel alloc] init];
        _leftDown.textAlignment = NSTextAlignmentCenter;
        _leftDown.text = @"昨日预估";
        _leftDown.font = kAdaptedFontSize(14);
        _leftDown.textColor = LWColor(100, 100, 100);
        _leftDown.userInteractionEnabled = YES;
        KWeakSelf(self);
        [_leftDown bk_whenTapped:^{
            [weakself.delegate PHHeadCenterDownClick:0];
        }];
    }
    return _leftDown;
}


- (UILabel *)centerTitle{
    if (_centerTitle == nil) {
        _centerTitle = [[UILabel alloc] init];
        _centerTitle.textAlignment = NSTextAlignmentCenter;
        _centerTitle.text = @"0";
        _centerTitle.font = kAdaptedFontSize(26);
        _centerTitle.userInteractionEnabled = YES;
        KWeakSelf(self);
        [_centerTitle bk_whenTapped:^{
            [weakself.delegate PHHeadCenterDownClick:1];
        }];
    }
    return _centerTitle;
}


- (UILabel *)centerDown{
    if (_centerDown == nil) {
        _centerDown = [[UILabel alloc] init];
        _centerDown.textAlignment = NSTextAlignmentCenter;
        _centerDown.text = @"今日预估";
        _centerDown.font = kAdaptedFontSize(14);
        _centerDown.textColor = LWColor(100, 100, 100);
        _centerDown.userInteractionEnabled = YES;
        KWeakSelf(self);
        [_centerDown bk_whenTapped:^{
            [weakself.delegate PHHeadCenterDownClick:1];
        }];
    }
    return _centerDown;
}

- (UILabel *)right{
    if (_right == nil) {
        _right = [[UILabel alloc] init];
        _right.textAlignment = NSTextAlignmentCenter;
        _right.text = @"0";
        _right.font = kAdaptedFontSize(26);
        _right.userInteractionEnabled = YES;
        KWeakSelf(self);
        [_right bk_whenTapped:^{
            [weakself.delegate PHHeadCenterDownClick:2];
        }];
    }
    return _right;
}

- (UILabel *)rightDown{
    if (_rightDown == nil) {
        _rightDown = [[UILabel alloc] init];
        _rightDown.textAlignment = NSTextAlignmentCenter;
        _rightDown.text = @"累计收益";
        _rightDown.font = kAdaptedFontSize(14);
        _rightDown.textColor = LWColor(100, 100, 100);
        _rightDown.userInteractionEnabled = YES;
        KWeakSelf(self);
        [_rightDown bk_whenTapped:^{
            [weakself.delegate PHHeadCenterDownClick:2];
        }];
    }
    return _rightDown;
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpInit];
    }
    return self;
}

- (void)setUpInit{
    
    
    CGFloat he =  [[HTTool HTToolShare] titleHeightWithFont:26];
    CGFloat dhe =  [[HTTool HTToolShare] titleHeightWithFont:14];
    self.left.frame = CGRectMake(0, 75 - he - dhe, KScreenWidth / 3.0, he);
    [self addSubview:self.left];
    
    
    
    self.leftDown.frame = CGRectMake(0, CGRectGetMaxY(self.left.frame), KScreenWidth / 3.0, dhe);
    [self addSubview:self.leftDown];
    
    
    
    self.centerTitle.frame = CGRectMake(CGRectGetMaxX(self.left.frame), 75 - he - dhe, KScreenWidth / 3.0, he);
    self.centerTitle.text = @"0";
    [self addSubview:self.centerTitle];
    
    self.centerDown.frame = CGRectMake(CGRectGetMaxX(self.left.frame), CGRectGetMaxY(self.left.frame), KScreenWidth / 3.0, dhe);
    [self addSubview:self.centerDown];

    
    
    self.right.frame = CGRectMake(CGRectGetMaxX(self.centerTitle.frame), 75 - he - dhe, KScreenWidth / 3.0, he);
    self.right.text = @"0";
    [self addSubview:self.right];
    
    self.rightDown.frame = CGRectMake(CGRectGetMaxX(self.centerTitle.frame), CGRectGetMaxY(self.left.frame), KScreenWidth / 3.0, dhe);
    [self addSubview:self.rightDown];
//    [self.centerTitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(self.centerTitle.centerX);
//        make.top.mas_equalTo(self.centerTitle.mas_bottom);
//    }];
    
}

@end
