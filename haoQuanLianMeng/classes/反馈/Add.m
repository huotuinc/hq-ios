//
//  Add.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/23.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "Add.h"

@interface Add()

@property (nonatomic,strong) UIImageView  * iconView;


@property (nonatomic,strong) UIButton  * btn;


@end


@implementation Add


- (UIImageView *)iconView{
    
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}


- (UIButton *)btn{
    
    if (_btn == nil) {
        _btn = [[UIButton alloc] init];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside ];
    }
    return _btn;
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    [self addSubview:self.iconView];
    
    [self addSubview:self.btn];
}


- (void)btnClick{
    
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
