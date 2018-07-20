//
//  MiFangAccountTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/19.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MiFangAccountTableViewCell.h"

@interface MiFangAccountTableViewCell ()

@property (nonatomic,strong) UILabel * titleLableT;


@property (nonatomic,strong) UIImageView  * upIconView;


@property (nonatomic,strong) UIImageView  * downIconView;


@property (nonatomic,strong) MiFangYaoQingModel * inmodel;
@end


@implementation MiFangAccountTableViewCell

- (UILabel *)titleLableT{
    if (_titleLableT == nil) {
        _titleLableT = [[UILabel alloc] init];
        _titleLableT.text = @"选择采购帐号/成为代理商";
    }
    return _titleLableT;
}

- (UIImageView *)upIconView{
    if (_upIconView == nil) {
        _upIconView = [[UIImageView alloc] init];
        _upIconView.image =  [UIImage imageNamed:@"k"];
        _upIconView.userInteractionEnabled = YES;
        UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(caiGou)];
        [_upIconView addGestureRecognizer:ges];
        _upIconView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _upIconView;
}


- (void)caiGou{
    
    [self.delegate MiFangAccountClick:0 andUrl:self.inmodel.BuyBuddyNumURL];
}

- (void)daiLi{
    
    NSString * tt;
    if (self.inmodel.IsAgent) {
        tt = self.inmodel.UpgradeAgentURL;
    }else{
        tt = self.inmodel.ApplyAgentURL;
    }
    [self.delegate MiFangAccountClick:((int)self.inmodel.IsAgent  + 1) andUrl:tt];
}

- (UIImageView *)downIconView{
    if (_downIconView == nil) {
        _downIconView = [[UIImageView alloc] init];
        _downIconView.image =  [UIImage imageNamed:@"k2"];
        _downIconView.contentMode = UIViewContentModeScaleAspectFill;
        _downIconView.userInteractionEnabled = YES;
        UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(daiLi)];
        [_downIconView addGestureRecognizer:ges];
        
    }
    return _downIconView;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpInit];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)setUpInit{
    
    [self.contentView addSubview:self.titleLableT];
    [self.titleLableT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(12);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(10);
        make.height.mas_equalTo(20);
    }];
    
    LWLog(@"%@",NSStringFromCGSize([UIImage imageNamed:@"k"].size));
    
    [self.contentView addSubview:self.upIconView];
    [self.upIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(10);
        make.top.mas_equalTo(self.titleLableT.mas_bottom).mas_offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
        make.height.mas_equalTo((KScreenWidth - 20) * 0.3);
    }];
    
    [self.contentView addSubview:self.downIconView];
    [self.downIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(10);
        make.top.mas_equalTo(self.upIconView.mas_bottom).mas_offset(5);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
        make.height.mas_equalTo((KScreenWidth - 20) * 0.3);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-10);
    }];
    
}


- (void)configure:(MiFangYaoQingModel *)model{
    
    self.inmodel = model;
    
    NSString * st = [NSString stringWithFormat:@"累计邀请店主%d人",model.InvitationMemberNum];
    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:st];
    
    [str addAttribute:NSForegroundColorAttributeName
                value:[UIColor redColor]
                range:NSMakeRange(6 , st.length - 1-5-1)];
    
    
    NSString * st1 = [NSString stringWithFormat:@"  开店帐号剩余%d个",model.SurplusNum];
    NSMutableAttributedString * str1 = [[NSMutableAttributedString alloc] initWithString:st1];
    [str1 addAttribute:NSForegroundColorAttributeName
                value:[UIColor redColor]
                range:NSMakeRange(8 , st.length - 1 - 6)];
    
    
    [str appendAttributedString:[str1 copy]];

    
    self.titleLableT.attributedText = str;
}

@end
