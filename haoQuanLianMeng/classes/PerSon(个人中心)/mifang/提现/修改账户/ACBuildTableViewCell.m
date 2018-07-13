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



@property (nonatomic,assign) int currentSelect;



@property (nonatomic,strong) NSArray * lableArrays;

@end


@implementation ACBuildTableViewCell


- (NSArray *)lableArrays{
    if (_lableArrays == nil) {
        _lableArrays = @[self.aliPay,self.wechat];
    }
    return _lableArrays;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpInit];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)addNote{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"accountSwich" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys: @(self.currentSelect) , @"accountType",nil]];
}


- (void)configure:(NSArray<BuyAccountPayChanel *> *) accountList{
    
    for (int i = 0; i < accountList.count; i++) {
        
        UILabel * title =  [self.lableArrays objectAtIndex:i];
        BuyAccountPayChanel * a = [accountList objectAtIndex:i];
        title.text = a.PaymentName;
        title.tag = 1000 + a.PaymentType;
        title.hidden = NO;
    }
    
}


- (int)getCurrentType{
    return self.currentSelect;
}

- (void)setUpInit{
    
    
    self.chanelL = [[UILabel alloc] init];
    self.chanelL.text = @"选择提现方式";
    
    
    self.currentSelect = 0;
    KWeakSelf(self);
    self.aliPay = [[UILabel alloc] init];
    self.aliPay.text = @"支付宝";
    self.aliPay.textAlignment =  NSTextAlignmentCenter;
    self.aliPay.layer.borderWidth = .8f;
    self.aliPay.layer.cornerRadius = 5;
    self.aliPay.layer.borderColor = [UIColor redColor].CGColor;
    self.aliPay.userInteractionEnabled = YES;
    [self.aliPay bk_whenTapped:^{
        if (weakself.currentSelect == 0) {
            return ;
        }
        weakself.currentSelect = 0;
        weakself.aliPay.layer.borderColor = [UIColor redColor].CGColor;
        weakself.wechat.layer.borderColor = LWColor(205, 205, 205).CGColor;
        [weakself addNote];
    }];
    
    self.wechat = [[UILabel alloc] init];
    self.wechat.text = @"微信";
    self.wechat.layer.cornerRadius = 5;
    self.wechat.layer.borderWidth = .8f;
    self.wechat.textAlignment =  NSTextAlignmentCenter;
    self.wechat.layer.borderColor = LWColor(205, 205, 205).CGColor;
    self.wechat.userInteractionEnabled = YES;
    [self.wechat bk_whenTapped:^{
        if (weakself.currentSelect == 1) {
            return ;
        }
        weakself.currentSelect = 1;
        weakself.aliPay.layer.borderColor = LWColor(205, 205, 205).CGColor;
        weakself.wechat.layer.borderColor = [UIColor redColor].CGColor;
        [weakself addNote];
    }];
    
    self.aliPay.hidden = 1;
    self.wechat.hidden = 1;
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
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(-20);
    }];
    
    [self.contentView addSubview:self.wechat];
    [self.wechat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.aliPay.mas_right).mas_offset(20);
        make.top.mas_equalTo(self.chanelL.mas_bottom).mas_offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
    
}
@end
