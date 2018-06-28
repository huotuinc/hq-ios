//
//  VipTimeTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/15.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "VipTimeTableViewCell.h"


@interface VipTimeTableViewCell ()

@property (nonatomic,strong) UIImageView * iconView;

@property (nonatomic,strong) UILabel  * titleLabel;

@property (nonatomic,strong) UILabel * contentLabel;


@property (nonatomic,strong) UIButton * xuFei;



@end


@implementation VipTimeTableViewCell


- (UIButton *)xuFei{
    if (_xuFei == nil) {
        _xuFei = [[UIButton alloc] init];
//        _xuFei.backgroundColor = [UIColor redColor];
        [_xuFei addTarget:self action:@selector(xufeiClick) forControlEvents:UIControlEventTouchUpInside];
        [_xuFei setTitle:@"续费" forState:UIControlStateNormal];
        _xuFei.titleLabel.font = kAdaptedFontSize(14);
        _xuFei.layer.borderWidth = .9f;
        _xuFei.layer.cornerRadius = 5;
        _xuFei.layer.masksToBounds = YES;
        _xuFei.layer.borderColor = LWColor(220, 220, 220).CGColor;
        [_xuFei setTitleColor:LWColor(89, 89, 89) forState:UIControlStateNormal];
    }
    return _xuFei;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.backgroundColor = LWColor(249, 249, 249);
        [self setUpInit];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

- (void)configWithData:(MiFangUserCenterModel *)model{
    
    
    self.contentLabel.text = [NSString stringWithFormat:@"%@ (还剩%d天)",model.ExpireTime,model.SurplusDays];
    
}

- (void)setUpInit{
    self.iconView = [[UIImageView alloc] init];
    self.iconView.image = [UIImage imageNamed:@"gd"];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"到期时间";
    self.titleLabel.font = kAdaptedFontSize(14);
    
    self.contentLabel = [[UILabel alloc] init];
    //self.contentLabel.text = @"2019-10-32 (还剩310天)";
    self.contentLabel.font = kAdaptedFontSize(14);
    [self.contentView addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-10);
        make.width.height.mas_equalTo(kAdaptedWidth(20));
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(10);
    }];
    
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(3);
        make.centerY.mas_equalTo(self.iconView.mas_centerY);
    }];
    
    
    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right).mas_offset(3);
        make.centerY.mas_equalTo(self.titleLabel.mas_centerY);
    }];
    
    
    [self.contentView addSubview:self.xuFei];
    [self.xuFei mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-20);
        make.centerY.mas_equalTo(self.iconView.mas_centerY);
        make.height.mas_equalTo(kAdaptedWidth(26));
        make.width.mas_equalTo(50);
    }];
    
}

- (void)xufeiClick{
    [self.delegate xufeiClick];
}

@end
