//
//  ACBuilTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ACBuilTableViewCell.h"
@interface ACBuilTableViewCell ()


@property (nonatomic,strong) UILabel  * name;

@property (nonatomic,strong) UITextField * ac;
@end


@implementation ACBuilTableViewCell


- (UILabel *)name{
    if (_name == nil) {
        _name = [[UILabel alloc] init];
        _name.text = @"小米";
    }
    return _name;
}


- (UITextField *)ac{
    if (_ac == nil) {
        _ac= [[UITextField alloc] init];
    }
    return _ac;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    [self.contentView addSubview:self.name];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(20);
        make.top.mas_equalTo(20);
        make.bottom.mas_equalTo(-20);
    }];
    
    [self.contentView addSubview:self.ac];
    [self.ac mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.left.mas_equalTo(self.name.mas_right);
        make.right.mas_equalTo(self.contentView.mas_right);
    }];
}

@end
