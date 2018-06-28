//
//  BuyAccountTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "BuyAccountTableViewCell.h"

@interface BuyAccountTableViewCell ()

@property (nonatomic,strong) UIImageView * iconView;

@property (nonatomic,strong) UILabel  * UpLable;

@property (nonatomic,strong) UILabel  * downLable;

@property (nonatomic,strong) UIImageView * addLable;

@property (nonatomic,strong) UILabel * numLable;

@property (nonatomic,strong) UIImageView * subLable;


@end


@implementation BuyAccountTableViewCell

- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"caiGou"];
    }
    return _iconView;
}


- (UILabel *)UpLable{
    if (_UpLable == nil) {
        _UpLable = [[UILabel alloc] init];
        _UpLable.text = @"开店账户";
    }
    return _UpLable;
}

- (UILabel *)numLable{
    if (_numLable == nil) {
        _numLable = [[UILabel alloc] init];
        _numLable.text = @"0";
        [_numLable setTextAlignment:NSTextAlignmentCenter];
        _numLable.backgroundColor = LWColor(216, 216, 216);
    }
    return _numLable;
}



- (UILabel *)downLable{
    if (_downLable == nil) {
        _downLable = [[UILabel alloc] init];
        _downLable.text = @"1231231";
    }
    return _downLable;
}

- (UIImageView *)addLable{
    if (_addLable == nil) {
        _addLable = [[UIImageView alloc] init];
        _addLable.image = [UIImage imageNamed:@"add"];
        _addLable.backgroundColor = LWColor(216, 216, 216);
    }
    return _addLable;
}

- (UIImageView *)subLable{
    if (_subLable == nil) {
        _subLable = [[UIImageView alloc] init];
        _subLable.image = [UIImage imageNamed:@"sub"];
        _subLable.backgroundColor = LWColor(216, 216, 216);
    }
    return _subLable;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpInit];
    }
    return  self;
}




- (void)setUpInit{
    
    [self.contentView addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(kAdaptedWidth(40));
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(20);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-20);
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(20);
    }];
    
    [self.contentView addSubview:self.UpLable];
    [self.UpLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(5);
        make.top.mas_equalTo(self.iconView.mas_top);
    }];
    
    [self.contentView addSubview:self.downLable];
    [self.downLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(5);
        make.top.mas_equalTo(self.UpLable.mas_bottom).mas_offset(2);
    }];
    
    [self.contentView addSubview:self.addLable];
    [self.addLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kAdaptedWidth(33));
        make.height.mas_equalTo(kAdaptedWidth(30));
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-20);
        make.centerY.mas_equalTo(self.iconView.mas_centerY);
    }];
    
    [self.contentView addSubview:self.numLable];
    [self.numLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kAdaptedWidth(33));
        make.height.mas_equalTo(kAdaptedWidth(30));
        make.centerY.mas_equalTo(self.iconView.mas_centerY);
        make.right.mas_equalTo(self.addLable.mas_left).mas_offset(-1);
    }];
    
    [self.contentView addSubview:self.subLable];
    [self.subLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kAdaptedWidth(33));
        make.height.mas_equalTo(kAdaptedWidth(30));
        make.centerY.mas_equalTo(self.iconView.mas_centerY);
        make.right.mas_equalTo(self.numLable.mas_left).mas_offset(-1);
    }];
    
    
    
}



@end
