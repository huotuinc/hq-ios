//
//  BuyAccountCenTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "BuyAccountCenTableViewCell.h"


@interface BuyAccountCenTableViewCell ()


@property (nonatomic,strong) UILabel * nameLable;


@property (nonatomic,strong) UILabel * chanelLable;


@property (nonatomic,strong) UILabel * numLable;


@end




@implementation BuyAccountCenTableViewCell


- (UILabel *)nameLable{
    if (_nameLable == nil) {
        _nameLable = [[UILabel alloc] init];
        _nameLable.text = @"选择抵扣方式";
    }
    return _nameLable;
}

- (UILabel *)chanelLable{
    if (_chanelLable == nil) {
        _chanelLable = [[UILabel alloc] init];
        _chanelLable.text = @"  现有开店帐号抵扣  ";
        _chanelLable.font = kAdaptedFontSize(15);
        _chanelLable.layer.cornerRadius = 5;
        _chanelLable.layer.borderWidth = .8f;
        _chanelLable.layer.borderColor = LWColor(206, 206, 206).CGColor;
    }
    return _chanelLable;
}

- (UILabel *)numLable{
    if (_numLable == nil) {
        _numLable = [[UILabel alloc] init];
        _numLable.text = @"可用10个";
        _numLable.textColor = LWColor(161, 161, 161);
    }
    return _numLable;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    [self.contentView addSubview:self.nameLable];
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(20);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(kAdaptedWidth(17));
    }];
    
    [self.contentView addSubview:self.chanelLable];
    [self.chanelLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(20);
        make.top.mas_equalTo(self.nameLable.mas_bottom).mas_offset(kAdaptedWidth(13));
        make.height.mas_equalTo(kAdaptedWidth(40));
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-kAdaptedWidth(13));
    }];
    
    [self.contentView addSubview:self.numLable];
    [self.numLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-20);
        make.top.mas_equalTo(self.nameLable.mas_top);
    }];
    
    
}

@end
