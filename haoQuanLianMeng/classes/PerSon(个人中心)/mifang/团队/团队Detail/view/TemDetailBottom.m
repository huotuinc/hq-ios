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
        _left.textColor = LWColor(166, 166, 166);
        _left.font = kAdaptedFontSize(12);
    }
    return _left;
}

- (UILabel *)right{
    if (_right == nil) {
        _right = [[UILabel alloc] init];
        _right.text = @"推荐人: 小米";
        _right.textColor = LWColor(166, 166, 166);
        _right.font = kAdaptedFontSize(12);
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
            make.right.mas_equalTo(self.mas_right).mas_offset(-10);
        }];
    }
    return self;
}
- (void)configure:(TeamPListModel *)model{
    
    LWLog(@"%@",[NSString stringWithFormat:@"推荐人: %@ 注册时间: %@",model.Recommender,model.RegisterTime]);
    
    self.left.text = [NSString stringWithFormat:@"推荐人: %@ 注册时间: %@",model.Recommender,model.RegisterTime];
    self.right.text = [NSString stringWithFormat:@"最后登录时间: %@",model.LastLoginTime];
    
}

@end
