//
//  HomeListItemView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/31.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HomeListItemView.h"

#define Margin 14

@interface HomeListItemView ()

@property (nonatomic, strong) UIImageView * iconView;

@property (nonatomic, strong) UILabel * headTitleLabel;


@property (nonatomic, strong) UILabel * prefixTitleLabel;


@property (nonatomic, strong) UIImageView * storyIconView;


@property (nonatomic, strong) UILabel * quanValueLabel;


@property (nonatomic, strong) UILabel * afterQuanValueLable;


@property (nonatomic, strong) UILabel * sellLabel;


@property (nonatomic, strong) UILabel * shareMakeMoneyLabel;

@end

@implementation HomeListItemView

- (UIImageView *)iconView {
    if (_iconView == nil){
        _iconView = [[UIImageView alloc] init];
        _iconView.backgroundColor = [UIColor redColor];
    }
    return _iconView;
}

- (UIImageView *)storyIconView {
    if (_storyIconView == nil){
        _storyIconView = [[UIImageView alloc] init];
    }
    return _storyIconView;
}



- (UILabel *)headTitleLabel {
    if(_headTitleLabel == nil){
        _headTitleLabel = [[UILabel alloc] init];
        _headTitleLabel.textColor = LWColor(67, 67, 67);
        _headTitleLabel.font = kAdaptedFontSize(28);
    }
    return _headTitleLabel;
}


- (UILabel *)prefixTitleLabel {
    if(_prefixTitleLabel == nil){
        _prefixTitleLabel = [[UILabel alloc] init];
        _prefixTitleLabel.textColor = LWColor(172, 172, 172);
        _prefixTitleLabel.font = kAdaptedFontSize(23);
    }
    return _prefixTitleLabel;
}


- (UILabel *)quanValueLabel {
    if(_quanValueLabel == nil){
        _quanValueLabel = [[UILabel alloc] init];
        _quanValueLabel.textColor = LWColor(254, 76, 85);
        _quanValueLabel.font = kAdaptedFontSize(20);
    }
    return _quanValueLabel;
}

- (UILabel *)afterQuanValueLable {
    if (_afterQuanValueLable == nil){
        _afterQuanValueLable = [[UILabel alloc] init];
    }
    return _afterQuanValueLable;
}

- (UILabel *)sellLabel {
    if(_sellLabel == nil ){
        _sellLabel = [[UILabel alloc] init];
        _sellLabel.textColor = LWColor(172, 172, 172);
        _sellLabel.font = kAdaptedFontSize(203);
    }
    return _sellLabel;
}


- (UILabel *)shareMakeMoneyLabel {
    if (_shareMakeMoneyLabel == nil){
        _shareMakeMoneyLabel = [[UILabel alloc] init];
    }
    return _shareMakeMoneyLabel;
}



+ (instancetype)shareHomeListItemView{
    HomeListItemView * view =  [[self alloc] initWithFrame:CGRectZero];
    view.bounds = CGRectMake(0, 0, (KScreenWidth - 3.0 * Margin) * 0.5, CGRectGetMaxY(view.shareMakeMoneyLabel.frame) + 8);
    return view;    
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setupInit];
    }
    return self;
}


- (void)setupInit{
    CGFloat wd = (KScreenWidth - 3.0 * Margin) * 0.5;
    
    self.iconView.frame = CGRectMake(0, 0, wd, wd);
    [self addSubview:self.iconView];
    
    self.headTitleLabel.frame = CGRectMake(0, wd, wd, kAdaptedHeight(32));
    [self addSubview:self.headTitleLabel];
    
    self.prefixTitleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.headTitleLabel.frame) + 6, wd * 0.35, 15);
    [self addSubview:self.prefixTitleLabel];
    
    
    self.sellLabel.frame = CGRectMake(wd * 0.65 , CGRectGetMaxY(self.headTitleLabel.frame) + 6, wd * 0.65, 15);
    [self addSubview:self.sellLabel];
    
    
    self.storyIconView.frame = CGRectMake(wd - 18, CGRectGetMaxY(self.sellLabel.frame) + 6, 18, 18);
    [self addSubview:self.storyIconView];
    
    self.afterQuanValueLable.frame = CGRectMake(0, CGRectGetMaxY(self.sellLabel.frame) + 7, wd - 18, 16);
    [self addSubview:self.afterQuanValueLable];
    
    
    self.quanValueLabel.frame = CGRectMake(0, CGRectGetMaxY(self.storyIconView.frame) + 6, 40, 18);
    [self addSubview:self.quanValueLabel];
    
    
    self.shareMakeMoneyLabel.frame = CGRectMake(CGRectGetMaxX(self.quanValueLabel.frame), CGRectGetMaxY(self.storyIconView.frame) + 6, 40, 18);
    [self addSubview:self.shareMakeMoneyLabel];
    
}


@end
