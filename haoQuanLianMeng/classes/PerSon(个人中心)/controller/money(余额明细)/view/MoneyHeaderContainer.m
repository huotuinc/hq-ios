//
//  MoneyHeaderContainer.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MoneyHeaderContainer.h"
#import "MoneyHeaderView.h"
#import "MoneyHeaderCenterView.h"


@interface MoneyHeaderContainer ()<MoneyHeaderViewDelegate>

@property (nonatomic, strong) MoneyHeaderView * moneyHeaderView;

@property (nonatomic, strong) MoneyHeaderCenterView * moneyHeaderCenterView;

@end

@implementation MoneyHeaderContainer

+ (instancetype)MoneyHeaderContainerShare{
    MoneyHeaderContainer * vc = [[self alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 10)];
    
    return vc;
    
}


- (MoneyHeaderView *)moneyHeaderView {
    if (_moneyHeaderView == nil){
        _moneyHeaderView = [[MoneyHeaderView alloc] init];
        _moneyHeaderView.delegate = self;
    }
    return _moneyHeaderView;
}


- (MoneyHeaderCenterView *)moneyHeaderCenterView {
    if (_moneyHeaderCenterView == nil){
        _moneyHeaderCenterView = [[MoneyHeaderCenterView alloc] init];
//        _moneyHeaderCenterView.backgroundColor = [UIColor yellowColor];
     }
    return _moneyHeaderCenterView;
}


- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]){

        [self setUpInit];
    }
    return self;
}

- (void)setUpInit {

    [self addSubview:self.moneyHeaderView];
    [self.moneyHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.top.mas_equalTo(self.mas_top);
        make.height.mas_equalTo(kAdaptedHeight(90));
    }];
//
    [self addSubview:self.moneyHeaderCenterView];
    [self.moneyHeaderCenterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.top.mas_equalTo(self.moneyHeaderView.mas_bottom);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
//
//    self.height = CGRectGetMaxY(self.moneyHeaderCenterView.frame);

}


- (void)moneyHeaderViewChangeMoney{
    
    if ([self.delegate respondsToSelector:@selector(MoneyHeaderContainerChange)]) {
        [self.delegate MoneyHeaderContainerChange];
    }
}
@end
