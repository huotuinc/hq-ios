//
//  DianZhueTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/23.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "DianZhueTableViewCell.h"

@interface DianZhueTableViewCell ()

@property (nonatomic,strong) UIImageView  * iconView;

@property (nonatomic,strong) UILabel * leftLable;

@property (nonatomic,strong) UILabel * rightLable;

@end


@implementation DianZhueTableViewCell


- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}


- (UILabel *)leftLable{
    if (_leftLable == nil) {
        _leftLable = [[UILabel alloc] init];
        _leftLable.text = @"女装";
    }
    return _leftLable;
}


- (UILabel *)rightLable{
    if (_rightLable == nil) {
        _rightLable = [[UILabel alloc] init];
        _rightLable.text = @"¥1";
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
    self.iconView.backgroundColor = [UIColor redColor];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(kAdaptedWidth(15));
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(kAdaptedWidth(-15));
        make.height.mas_equalTo(kAdaptedWidth(60));
        make.width.mas_equalTo(kAdaptedWidth(80));
    }];
    
    [self.contentView addSubview:self.leftLable];
    [self.leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconView.mas_top);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(10);
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(10);
    }];
    
    [self.contentView addSubview:self.rightLable];
    [self.rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.leftLable.mas_bottom).mas_offset(2);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(10);

    }];
}


@end
