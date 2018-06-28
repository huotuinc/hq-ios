//
//  YaoqingHeadView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/19.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "YaoqingHeadView.h"


@interface YaoqingHeadView ()

@property (nonatomic,strong) UIImageView  * iconView;

@property (nonatomic,strong) UILabel  * upLabel;

@property (nonatomic,strong) UILabel  * downLabel;


@end

@implementation YaoqingHeadView


- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"caiGou"];
    }
    return _iconView;
}

- (UILabel *)upLabel{
    if (_upLabel == nil) {
        _upLabel = [[UILabel alloc] init];
        _upLabel.font = kAdaptedFontSize(20);
        _upLabel.text = @"采购帐号";
    }
    return _upLabel;
}


- (UILabel *)downLabel{
    if (_downLabel == nil) {
        _downLabel = [[UILabel alloc] init];
        _downLabel.text = @"购买开店";
    }
    return _downLabel;
}




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    [self.contentView addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(kAdaptedWidth(15));
        make.width.mas_equalTo(kAdaptedWidth(35));
        make.height.mas_equalTo(kAdaptedWidth(35));
        make.left.mas_equalTo(15);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(kAdaptedWidth(-15));
    }];
    
    [self.contentView addSubview:self.upLabel];
    [self.upLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconView.mas_top);
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(10);
    }];
    
    [self.contentView addSubview:self.downLabel];
    [self.downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.upLabel.mas_bottom);
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(10);
    }];
    
}
@end
