//
//  TiXianCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/20.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TiXianCell.h"


@interface TiXianCell ()

@property (nonatomic,strong) UILabel * moneyLable;

@property (nonatomic,strong) UILabel * statusLable;

@property (nonatomic,strong) UILabel * nameLable;

@property (nonatomic,strong) UILabel * accountLable;

@property (nonatomic,strong) UILabel * timeLable;

@end


@implementation TiXianCell

- (UILabel *)moneyLable{
    if (_moneyLable == nil) {
        _moneyLable = [[UILabel alloc] init];
        _moneyLable.font = kAdaptedFontSize(15);
        _moneyLable.text = @"1000";
        
    }
    return _moneyLable;
}

- (UILabel *)statusLable{
    if (_statusLable == nil) {
        _statusLable = [[UILabel alloc] init];
        _statusLable.font = kAdaptedFontSize(12);
        _statusLable.text = @"已通过";
    }
    return _statusLable;
}

- (UILabel *)nameLable{
    if (_nameLable == nil) {
        _nameLable = [[UILabel alloc] init];
        _nameLable.font = kAdaptedFontSize(15);
        _nameLable.text = @"小米";
    }
    return _nameLable;
}

- (UILabel *)accountLable{
    if (_accountLable == nil) {
        _accountLable = [[UILabel alloc] init];
        _accountLable.font = kAdaptedFontSize(12);
        _accountLable.text = @"13123123";
    }
    return _accountLable;
}

- (UILabel *)timeLable{
    if (_timeLable == nil) {
        _timeLable = [[UILabel alloc] init];
        _timeLable.font = kAdaptedFontSize(12);
        _timeLable.text = @"2013-12-12";
    }
    return _timeLable;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    
    [self.contentView addSubview:self.moneyLable];
    [self.moneyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(20);
        make.left.mas_equalTo(kAdaptedWidth(25));
    }];
    
    [self.contentView addSubview:self.statusLable];
    [self.statusLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.moneyLable.mas_bottom).mas_offset(5);
        make.left.mas_equalTo(kAdaptedWidth(25));
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-20);
    }];
    
    
    [self.contentView addSubview:self.accountLable];
    [self.accountLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-15);
//        make.bottom.mas_equalTo(self.contentView.mas_top).mas_offset(-30);
    }];
    
    
    
    
    
    
    [self.contentView addSubview:self.nameLable];
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-15);
        make.bottom.mas_equalTo(self.accountLable.mas_top);
    }];
    
    
    
    
    [self.contentView addSubview:self.timeLable];
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-15);
        make.top.mas_equalTo(self.accountLable.mas_bottom);
    }];
    
}

@end
