//
//  TemDetailBottom.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TemDetailBottom.h"


@interface TemDetailBottom ()

@property (nonatomic,strong) UILabel  * left;

@property (nonatomic,strong) UILabel  * right;

@end

@implementation TemDetailBottom


- (UILabel *)left{
    if (_left == nil) {
        _left = [[UILabel alloc] init];
        _left.text = @"推荐人: 小米";
    }
    return _left;
}

- (UILabel *)right{
    if (_right == nil) {
        _right = [[UILabel alloc] init];
        _right.text = @"推荐人: 小米";
    }
    return _right;
}



- (instancetype)init{
    if (self = [super init]) {
        
        [self addSubview:self.left];
        [self.left mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).mas_offset(12);
            make.top.mas_equalTo(self.mas_top).mas_offset(10);
            make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-10);
        }];
        
        [self addSubview:self.right];
        [self.right mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.left.mas_centerY);
            make.right.mas_equalTo(self.mas_right).mas_offset(-12);
        }];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
