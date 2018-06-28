//
//  YaoQingBtnCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/19.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "YaoQingBtnCell.h"

@interface YaoQingBtnCell ()


@property (nonatomic,strong) UIImageView * iconView;

@property (nonatomic,strong) UILabel * ruleLable;


@property (nonatomic,strong) UILabel * contentLable;
@end


@implementation YaoQingBtnCell


- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"tu"];
    }
    return _iconView;
}

- (UILabel *)ruleLable{
    if (_ruleLable == nil) {
        _ruleLable = [[UILabel alloc] init];
        _ruleLable.textAlignment = NSTextAlignmentCenter;
        _ruleLable.text = @"规则说明";
    }
    return _ruleLable;
}


- (UILabel *)contentLable{
    if (_contentLable == nil) {
        _contentLable = [[UILabel alloc] init];
    }
    return _contentLable;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
      
        [self setUpInit];
    }
    
    return self;
}


- (void)setUpInit{
    
    CGFloat he = (KScreenHeight  - 40)* 0.2;
    [self.contentView addSubview:self.iconView];
    self.iconView.contentMode = UIViewContentModeScaleAspectFit;
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(20);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(5);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-20);
        make.height.mas_equalTo(he);
    }];
    
    [self.contentView addSubview:self.ruleLable];
    [self.ruleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconView.mas_bottom).mas_offset(kAdaptedWidth(10));
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
    }];
    
    
    [self.contentView addSubview:self.contentLable];
    self.contentLable.numberOfLines = 0;
    [self.contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(15);
        make.top.mas_equalTo(self.ruleLable.mas_bottom).mas_offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-15);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-5);
    }];
    
    self.contentLable.text = @"1、大大说的 \n 2、撒打算打算几点 \n 3、阿达就是大";
    
    
}
@end
