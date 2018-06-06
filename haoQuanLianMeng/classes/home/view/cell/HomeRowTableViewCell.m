//
//  HomeRowTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/31.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HomeRowTableViewCell.h"

@interface HomeRowTableViewCell ()

@property (nonatomic, strong) UIImageView * iconView;

@property (nonatomic, strong) UILabel * headTitleLabel;


@property (nonatomic, strong) UILabel * prefixTitleLabel;


@property (nonatomic, strong) UIImageView * storyIconView;


@property (nonatomic, strong) UILabel * quanValueLabel;


@property (nonatomic, strong) UILabel * afterQuanValueLable;


@property (nonatomic, strong) UILabel * sellLabel;


@property (nonatomic, strong) UILabel * shareMakeMoneyLabel;

@end


@implementation HomeRowTableViewCell


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


- (instancetype)init{
    if(self = [super init]){
       [self setupInit];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupInit];
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    return self;
}

- (void)setupInit {

    
//    self.backgroundColor = LWColor(0, 0, 0);
    [self.contentView addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(14);
        make.height.width.mas_equalTo(kAdaptedWidth(120));
        make.top.mas_equalTo(self.contentView).mas_offset(0);
        make.bottom.mas_equalTo(self.contentView).mas_offset(0);
    }];

    [self.contentView addSubview:self.headTitleLabel];
    [self.headTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(10);
        make.right.mas_equalTo(self.contentView).mas_offset(-10);
        make.top.mas_equalTo(self.iconView.mas_top);
    }];

    [self.contentView addSubview:self.prefixTitleLabel];
    [self.prefixTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(10);
        make.top.mas_equalTo(self.headTitleLabel.mas_bottom).mas_offset(kAdaptedHeight(8));
    }];


    [self.contentView addSubview:self.storyIconView];
    [self.storyIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.iconView.mas_right).mas_offset(-kAdaptedWidth(9));
        make.centerY.mas_equalTo(self.prefixTitleLabel.centerY);
        make.height.width.mas_equalTo(18);
    }];


    [self.contentView addSubview:self.quanValueLabel];
    [self.quanValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kAdaptedWidth(38));
        make.height.mas_equalTo(kAdaptedHeight(15));
        make.left.mas_equalTo(self.prefixTitleLabel.mas_left);
        make.top.mas_equalTo(self.prefixTitleLabel.mas_bottom).mas_offset(kAdaptedHeight(15));
    }];


    [self.contentView addSubview:self.sellLabel];
    [self.sellLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.headTitleLabel.mas_right);
        make.centerY.mas_equalTo(self.quanValueLabel.centerY);
    }];


    [self.contentView addSubview:self.afterQuanValueLable];
    [self.afterQuanValueLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.iconView.mas_bottom).mas_offset(-3);
        make.left.mas_equalTo(self.prefixTitleLabel.mas_left);
    }];




    [self.contentView addSubview:self.shareMakeMoneyLabel];
    [self.shareMakeMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kAdaptedWidth(75));
        make.height.mas_equalTo(kAdaptedHeight(20));
        make.bottom.mas_equalTo(self.iconView.mas_bottom).mas_offset(-3);
        make.right.mas_equalTo(self.headTitleLabel.mas_right);
    }];

}



@end
