//
//  AccountTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/20.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "AccountTableViewCell.h"

@interface AccountTableViewCell()

@property (nonatomic,strong) UIImageView  *iconView;

@property (nonatomic,strong) UILabel  * nameLable;

@property (nonatomic,strong) UILabel  * accountLable;


@property (nonatomic,strong) UILabel  * rightLable;

@end


@implementation AccountTableViewCell

- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"acCheck"];
    }
    return _iconView;
}


- (UILabel *)nameLable{
    if (_nameLable == nil) {
        _nameLable = [[UILabel alloc] init];
    }
    return _nameLable;
}

- (UILabel *)accountLable{
    if (_accountLable == nil) {
        _accountLable = [[UILabel alloc] init];
    }
    return _accountLable;
}

- (UILabel *)rightLable{
    if (_rightLable == nil) {
        _rightLable = [[UILabel alloc] init];
        _rightLable.text = @"编辑";
        _rightLable.textAlignment = NSTextAlignmentCenter;
        _rightLable.userInteractionEnabled = YES;
        KWeakSelf(self);
        [_rightLable bk_whenTapped:^{
            [weakself.delegate BuildClick];
        }];
    }
    return _rightLable;
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
        make.height.width.mas_equalTo(kAdaptedWidth(26));
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(22);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(kAdaptedWidth(15));
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-kAdaptedWidth(15));
    }];
    
    [self.contentView addSubview:self.nameLable];
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(10);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(25);
    }];
    
    [self.contentView addSubview:self.accountLable];
    [self.accountLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(10);
        make.top.mas_equalTo(self.nameLable.mas_bottom).mas_offset(5);
    }];
    
    [self.contentView addSubview:self.rightLable];
    [self.rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(kAdaptedHeight(30));
        make.centerY.mas_equalTo(self.iconView.centerY);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
    }];
    self.rightLable.layer.cornerRadius = kAdaptedHeight(30) * 0.5;
    self.rightLable.layer.masksToBounds = YES;
    self.rightLable.layer.borderWidth = 1;
    self.rightLable.layer.borderColor = [UIColor redColor].CGColor;
}

@end
