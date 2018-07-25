//
//  QuanDetailBottomView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/31.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "QuanDetailBottomView.h"

@interface QuanDetailBottomView ()


@property (nonatomic,strong) UILabel * titleLable;

@end


@implementation QuanDetailBottomView


- (UILabel *)titleLable{
    if (_titleLable == nil) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.text = @"立即分享";
        _titleLable.textColor = [UIColor whiteColor];
    }
    return _titleLable;
}


- (void)setTitle:(NSString *)title{
    self.titleLable.text = title;
}
- (instancetype)init{
    if (self = [super init]) {
        [self addSubview:self.titleLable];
        [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
    }
    return self;
}

@end
