//
//  HTStoryBottomView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/6.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTStoryBottomView.h"

@interface HTStoryBottomView()

@property (nonatomic,strong) UIImageView * iconView;

@property (nonatomic,strong) UILabel * selectLable;

@property (nonatomic,strong) UIButton * btnShare;

@end


@implementation HTStoryBottomView


- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"unSelect"];
    }
    return _iconView;
}


- (UILabel *)selectLable{
    if (_selectLable == nil) {
        _selectLable = [[UILabel alloc] init];
        _selectLable.text = @"已选(0)";
    }
    return _selectLable;
}


- (UIButton *)btnShare{
    if (_btnShare == nil) {
        _btnShare = [[UIButton alloc] init];
        _btnShare.backgroundColor = LWColor(136, 136, 136);
        [_btnShare setTitle:@"立即分享" forState:UIControlStateNormal];
        [_btnShare addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnShare;
}

- (void)btnClick{
    [self.delegate shareClick];
}

- (instancetype)init{
    if (self = [super init]) {
        
        [self setUpInit];
        
        
        
    }
    return self;
}


- (void)setNumber:(int)num{
    _selectLable.text =  [NSString stringWithFormat:@"已选(%d)",num];
    
    if (num > 0) {
        _iconView.image = [UIImage imageNamed:@"select"];
    }else{
       _iconView.image = [UIImage imageNamed:@"unSelect"];
    }
}

- (void)setUpInit{
    
    [self addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(kAdaptedWidth(20));
        make.centerY.mas_equalTo(self.centerY);
        make.left.mas_equalTo(self.mas_left).mas_offset(15);
    }];
    
    [self addSubview:self.selectLable];
    [self.selectLable mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(15);
        make.centerY.mas_equalTo(self.iconView.mas_centerY);
        
    }];
    
    
    [self addSubview:self.btnShare];
    [self.btnShare mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).mas_offset(0);
        make.top.mas_equalTo(self.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.width.mas_equalTo(kAdaptedWidth(141));
    }];
    
}

@end
