//
//  TiXianFooterView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/20.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TiXianFooterView.h"





@interface TiXianFooterView ()

@property (nonatomic,strong) UIButton * btn;

@property (nonatomic,strong) UILabel * tixianLable;

@property (nonatomic,strong) UILabel * tixianrule;

@property (nonatomic,strong) UILabel * tixianruleContent;


@end


@implementation TiXianFooterView




- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self setUpInit];
        
    }
    return self;
}

- (void)setUpInit{
    
    self.backgroundColor = [UIColor clearColor];
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(14, 20, KScreenWidth-28, 44)];
    [self.btn setTitle:@"提现" forState:UIControlStateNormal];
    self.btn.layer.cornerRadius = 5;
    self.btn.layer.masksToBounds = YES;
    [self.btn setBackgroundColor:[UIColor redColor]];
    [self addSubview:self.btn];
    [self.btn addTarget:self.delegate action:@selector(TiXianBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.tixianLable = [[UILabel alloc] init];
    self.tixianLable.userInteractionEnabled = YES;
    KWeakSelf(self);
    [self.tixianLable bk_whenTapped:^{
        [weakself.delegate TiXianListClick];
    }];
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:@"提现记录" attributes:attribtDic];
    self.tixianLable.attributedText = attribtStr;
    [self addSubview:self.tixianLable];
    
    [self.tixianLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.btn.mas_bottom).mas_offset(20);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    self.tixianrule = [[UILabel alloc] init];
    self.tixianrule.text = @"提现说明";
    [self addSubview:self.tixianrule];
    [self.tixianrule mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(14);
        make.top.mas_equalTo(self.tixianLable.mas_bottom).mas_offset(20);
    }];
    
    self.tixianruleContent = [[UILabel alloc] init];
    self.tixianruleContent.text = @"dadasdasdqweqe";
     [self addSubview:self.tixianruleContent];
    [self.tixianruleContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(14);
        make.top.mas_equalTo(self.tixianrule.mas_bottom).mas_offset(10);
    }];
    
}

@end
