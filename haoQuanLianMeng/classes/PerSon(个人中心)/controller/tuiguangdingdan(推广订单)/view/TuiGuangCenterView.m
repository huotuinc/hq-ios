//
//  TuiGuangCenterView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TuiGuangCenterView.h"

@interface TuiGuangCenterView ()

@property (nonatomic,strong) UIImageView  *iconView;


@property (nonatomic,strong) UILabel  *titleLable;

@end


@implementation TuiGuangCenterView


- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.backgroundColor = [UIColor redColor];
    }
    return _iconView;
}


- (UILabel *)titleLable{
    if (_titleLable == nil) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.numberOfLines = 3;
    }
    return _titleLable;
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
        make.top.mas_equalTo(self.mas_top);
        make.left.mas_equalTo(self.mas_left).mas_offset(10);
        make.height.width.mas_equalTo(kAdaptedHeight(70));
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-18);
    }];
    
    
    [self addSubview:self.titleLable];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconView.mas_top);
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(-10);
        make.right.mas_equalTo(self.mas_right).mas_offset(-18);
        
    }];
    
}

@end
