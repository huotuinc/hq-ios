//
//  HeadIconView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/1.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HeadIconView.h"


@interface HeadIconView ()

@property (nonatomic,strong) UIImageView * bkView;

@property (nonatomic,strong) UIImageView * iconView;


@property (nonatomic,strong) UILabel * levelLable;


@property (nonatomic,strong) UILabel * nameLable;


@property (nonatomic,strong) UILabel * lookSearch;


@property (nonatomic,strong) UIButton * sett;


@end




@implementation HeadIconView


- (UIButton *)sett{
    if (_sett == nil) {
        _sett = [[UIButton alloc] init];
        [_sett setImage:[UIImage imageNamed:@"pSet"] forState:UIControlStateNormal];
        _sett.frame = CGRectMake(0, 0, 18, 18);
        [_sett addTarget:self action:@selector(settClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sett;
}

- (void)settClick{
    [self.delegate HeadIconViewSetClick];
}



- (UILabel *)levelLable{
    if (_levelLable == nil) {
        _levelLable = [[UILabel alloc] init];
        _levelLable.font = [UIFont systemFontOfSize:15];
        _levelLable.text = @"超级推手 初级";
    }
    return _levelLable;
}


- (UILabel *)nameLable{
    if (_nameLable == nil) {
        _nameLable = [[UILabel alloc] init];
        _nameLable.font = [UIFont systemFontOfSize:12];
        _nameLable.textColor = LWColor(100, 100, 100);
        _nameLable.text = @"150****8250";
    }
    return _nameLable;
}


- (UILabel *)lookSearch{
    if (_lookSearch == nil) {
        _lookSearch = [[UILabel alloc] init];
        _lookSearch.text = @"查看特权";
        _lookSearch.textColor = [UIColor whiteColor];
        _lookSearch.backgroundColor = [UIColor blackColor];
        [_lookSearch setTextAlignment:NSTextAlignmentCenter];
        _lookSearch.font = kAdaptedFontSize(10);
    }
    return _lookSearch;
}


- (UIImageView *)bkView{
    if (_bkView == nil) {
        _bkView = [[UIImageView alloc] init];
    }
    return _bkView;
}

- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.backgroundColor = [UIColor redColor];
    }
    return _iconView;
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    self.bkView.frame = CGRectMake(-50, - KScreenWidth * 0.5, KScreenWidth + 100, KScreenWidth);
    [self addSubview:self.bkView];
    
    self.bkView.backgroundColor = LWColor(248, 248, 248);
    self.bkView.layer.cornerRadius = (KScreenWidth + 100) * 0.5;
    self.bkView.layer.masksToBounds = YES;
    
    [self addSubview:self.iconView];
    self.iconView.frame = CGRectMake((KScreenWidth - 60)* 0.5, 40, 60, 60);
    
    
    
    [self addSubview:self.sett];
//    self.sett.backgroundColor = [UIColor blackColor];
    [self.sett mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(20);
        make.right.mas_equalTo(self.mas_right).mas_offset(-15);
        make.top.mas_equalTo(self.iconView.mas_top).mas_offset(-10);
    }];
    
    [self addSubview:self.levelLable];
    [self.levelLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(20);
        make.centerX.mas_equalTo(self.iconView.mas_centerX);
        make.top.mas_equalTo(self.iconView.mas_bottom).mas_offset(10);
    }];
    
    [self addSubview:self.nameLable];
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(16);
        make.centerX.mas_equalTo(self.levelLable.centerX);
        make.top.mas_equalTo(self.levelLable.mas_bottom).mas_offset(10);
    }];
    
    
    
    [self addSubview:self.lookSearch];
    [self.lookSearch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(80);
        make.centerX.mas_equalTo(self.nameLable.centerX);
        make.top.mas_equalTo(self.nameLable.mas_bottom).mas_offset(10);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-18);
    }];
    self.lookSearch.layer.cornerRadius = 10;
    self.lookSearch.layer.masksToBounds = YES;
    
}

@end
