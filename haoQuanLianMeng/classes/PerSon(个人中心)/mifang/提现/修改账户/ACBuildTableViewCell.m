//
//  ACBuildTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ACBuildTableViewCell.h"

@interface ACBuildTableViewCell ()

@property (nonatomic,strong) UILabel * chanelL;

@property (nonatomic,strong) UILabel * aliPay;

@property (nonatomic,strong) UILabel * wechat;
@end


@implementation ACBuildTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    
    self.chanelL = [[UILabel alloc] init];
    self.chanelL.text = @"选择提现方式";
    
    self.aliPay = [[UILabel alloc] init];
    self.aliPay.text = @"支付宝";
    self.wechat = [[UILabel alloc] init];
    self.wechat.text = @"微信";
    
    
    [self.contentView addSubview:self.chanelL];
    [self.chanelL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(20);
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(20);
    }];
    
    [self.contentView addSubview:self.aliPay];
    [self.aliPay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(20);
        make.top.mas_equalTo(self.chanelL.mas_bottom).mas_offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
        make.bottom.mas_equalTo(-20);
    }];
    
    [self.contentView addSubview:self.wechat];
    [self.wechat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.aliPay.mas_right).mas_offset(20);
        make.top.mas_equalTo(self.chanelL.mas_bottom).mas_offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
}
@end
