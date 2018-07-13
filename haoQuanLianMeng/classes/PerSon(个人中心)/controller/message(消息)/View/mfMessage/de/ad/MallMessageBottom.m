//
//  MallMessageBottom.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MallMessageBottom.h"


@interface MallMessageBottom ()

@property (nonatomic,strong) UIView * sliderView;

@property (nonatomic,strong) UILabel * titleLable;

@end



@implementation MallMessageBottom


- (UIView *)sliderView{
    if (_sliderView == nil) {
        _sliderView = [[UIView alloc] init];
    }
    return _sliderView;
}

- (UILabel *)titleLable{
    if (_titleLable == nil) {
        _titleLable = [[UILabel alloc] init];
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
    [self addSubview:self.sliderView];
    [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
    }];
    
    [self addSubview:self.titleLable];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.sliderView.mas_bottom).mas_offset(5);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-5);
    }];
    
    
}

@end
