//
//  TuiGuangTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/22.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ATuiGuangTableViewCell.h"
#import "TuiGuangBottom.h"
#import "TuiGuangCenter.h"
#import "TuiGuangTop.h"


@interface ATuiGuangTableViewCell ()

@property (nonatomic,strong) UIView * containviewX;


@property (nonatomic,strong) TuiGuangTop * top;

@property (nonatomic,strong) TuiGuangCenter * centerV;

@property (nonatomic,strong) TuiGuangBottom * bottom;

@end




@implementation ATuiGuangTableViewCell


- (TuiGuangTop *)top{
    if (_top == nil) {
        _top = [[TuiGuangTop alloc] init];
    }
    return _top;
}

- (TuiGuangCenter *)centerV{
    if (_centerV == nil) {
        _centerV = [[TuiGuangCenter alloc] init];
    }
    return _centerV;
}

- (TuiGuangBottom *)bottom{
    if (_bottom == nil) {
        _bottom = [[TuiGuangBottom alloc] init];
    }
    return _bottom;
}



- (UIView *)containviewX{
    if (_containviewX  == nil) {
        _containviewX = [[UIView alloc] init];
    }
    return _containviewX;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    [self.contentView addSubview:self.containviewX];
    [self.containviewX mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.contentView.mas_top);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    
    [self.containviewX addSubview:self.top];
    [self.top mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.containviewX.mas_left);
        make.right.mas_equalTo(self.containviewX.mas_right);
        make.top.mas_equalTo(self.containviewX.mas_top);
        
    }];
    
    [self.containviewX addSubview:self.centerV];
    [self.centerV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.containviewX.mas_left);
        make.right.mas_equalTo(self.containviewX.mas_right);
        make.top.mas_equalTo(self.top.mas_bottom);
        //make.bottom.mas_equalTo(self.containviewX.mas_bottom).mas_offset(5);
    }];

    [self.containviewX addSubview:self.bottom];
    [self.bottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.containviewX.mas_left);
        make.right.mas_equalTo(self.containviewX.mas_right);
        make.top.mas_equalTo(self.centerV.mas_bottom);
        make.bottom.mas_equalTo(self.containviewX.mas_bottom);
    }];
    
    
}


@end
