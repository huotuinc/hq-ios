//
//  MyWalletBottomView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/15.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MyWalletBottomView.h"
#import "MyWalletTitleView.h"


@interface MyWalletBottomView ()

@property (nonatomic,strong) MyWalletTitleView * first;
@property (nonatomic,strong) MyWalletTitleView * second;

@property (nonatomic,strong) MyWalletTitleView * third;

@end


@implementation MyWalletBottomView


- (void)configWithData:(MiFangUserCenterModel *)model{
    
    
    [self.first setValue:model.UserTempIntegral];
    
    
    [self.second setValue:model.UserIntegral];
    
    
    [self.third setValue:model.UserMBean];
    
}



- (MyWalletTitleView *)first{
    if (_first == nil) {
        _first = [[MyWalletTitleView alloc] init];
    }
    return _first;
}

- (MyWalletTitleView *)second{
    if (_second == nil) {
        _second = [[MyWalletTitleView alloc] init];
    }
    return _second;
}

- (MyWalletTitleView *)third{
    if (_third == nil) {
        _third = [[MyWalletTitleView alloc] init];
    }
    return _third;
}


- (instancetype)init{
    if (self = [super init]) {
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    
    //CGFloat with = (KScreenWidth - 2) / 3.0;
    
    [self addSubview:self.first];
    [self.first setTitle:@"待结算"];
    [self addSubview:self.second];
    [self.second setTitle:@"余额"];
    [self addSubview:self.third];
    [self.third setTitle:@"觅豆"];
    
    
    [self.first mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.top.mas_equalTo(self.mas_top);
        make.height.mas_equalTo(kAdaptedWidth(70));
        make.right.mas_equalTo(self.second.mas_left).mas_offset(-1);
        make.width.mas_equalTo(self.second.mas_width);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
    
    [self addSubview:self.second];
    [self.second mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.first.mas_right).mas_offset(1);
        make.top.mas_equalTo(self.mas_top);
        make.height.mas_equalTo(kAdaptedWidth(70));
        make.width.mas_equalTo(self.third.mas_width);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.right.mas_equalTo(self.third.mas_left).mas_offset(-1);
    }];
    
    [self addSubview:self.third];
    [self.third mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.second.mas_right).mas_offset(1);
        make.top.mas_equalTo(self.mas_top);
        make.height.mas_equalTo(kAdaptedWidth(70));
        make.right.mas_equalTo(self.mas_right);
        make.width.mas_equalTo(self.first.mas_width);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
