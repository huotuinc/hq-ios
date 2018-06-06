//
//  HomeIconTitleView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HomeIconTitleView.h"

@interface HomeIconTitleView ()

@property (nonatomic,strong) UIImageView * iconView;


@property (nonatomic,strong) UILabel * titleView;

@end


@implementation HomeIconTitleView


- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.backgroundColor = [UIColor redColor];
    }
    return _iconView;
}

- (UILabel *)titleView{
    if (_titleView == nil) {
        _titleView = [[UILabel alloc] init];
        _titleView.textColor = LWColor(131, 131, 131);
        _titleView.font = kAdaptedFontSize(12);
        _titleView.text = @"查看全部";
    }
    return _titleView;
}

- (instancetype)init{
    if (self = [super init]) {
        
        [self setUpInit];
        
    }
    return self;
}


- (void)setUpInit{
    
    [self addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(kAdaptedWidth(50));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.centerY).multipliedBy(0.8);
    }];
    
    [self addSubview:self.titleView];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.iconView.mas_bottom).mas_offset(kAdaptedWidth(5));
    }];
}

@end
