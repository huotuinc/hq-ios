//
//  TemDetailTop.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TemDetailTop.h"

@interface TemDetailTop ()


@property (nonatomic,strong) UIImageView  * iconView;

@property (nonatomic,strong) UILabel  * nameLable;


@property (nonatomic,strong) UILabel  * levelLable;

@property (nonatomic,strong) UILabel  * teamLable;

@property (nonatomic,strong) UILabel  * fanLable;

@property (nonatomic,strong) UILabel  * scoreLable;


@property (nonatomic,strong) UILabel * subLable;


@end




@implementation TemDetailTop


- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UILabel *)nameLable{
    if (_nameLable == nil) {
        _nameLable = [[UILabel alloc] init];
    }
    return _nameLable;
}

- (UILabel *)levelLable{
    if (_levelLable == nil) {
        _levelLable = [[UILabel alloc] init];
    }
    return _levelLable;
}

- (UILabel *)teamLable{
    if (_teamLable == nil) {
        _teamLable = [[UILabel alloc] init];
    }
    return _teamLable;
}

- (UILabel *)fanLable{
    if (_fanLable == nil) {
        _fanLable = [[UILabel alloc] init];
    }
    return _fanLable;
}


- (UILabel *)scoreLable{
    if (_scoreLable == nil) {
        _scoreLable = [[UILabel alloc] init];
    }
    return _scoreLable;
}


- (UILabel *)subLable{
    if (_subLable == nil) {
        _subLable = [[UILabel alloc] init];
    }
    return _subLable;
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
        make.top.mas_equalTo(self.mas_top).mas_offset(kAdaptedWidth(11));
        make.left.mas_equalTo(self.mas_left).mas_offset(12);
        make.height.width.mas_equalTo(kAdaptedWidth(50));
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-kAdaptedWidth(11));;
    }];
    
    [self addSubview:self.nameLable];
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconView.mas_top);
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(5);
        
    }];
    
    [self addSubview:self.levelLable];
    [self.levelLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLable.mas_bottom);
        make.left.mas_equalTo(self.nameLable.mas_left);
    }];
    
    [self addSubview:self.teamLable];
    [self.teamLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.levelLable.mas_top);
        make.left.mas_equalTo(self.levelLable.mas_right).mas_offset(2);
    }];
    
    
    [self addSubview:self.fanLable];
    [self.levelLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.levelLable.mas_bottom).mas_offset(2);
        make.left.mas_equalTo(self.nameLable.mas_left);
    }];
    
    
    [self addSubview:self.scoreLable];
    [self.scoreLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.iconView.mas_centerY);
        make.right.mas_equalTo(self.mas_right).mas_offset(-10);
    }];
    
    [self addSubview:self.subLable];
    [self.subLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.scoreLable.mas_centerX);
        make.top.mas_equalTo(self.scoreLable.mas_bottom).mas_offset(2);
    }];
}

@end
