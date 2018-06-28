//
//  TiXianBottomTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/20.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TiXianBottomTableViewCell.h"

@interface TiXianBottomTableViewCell ()

@property (nonatomic,strong) UILabel * nameLable;


@property (nonatomic,strong) UITextField * money;


@property (nonatomic,strong) UIButton  * btn;
@end


@implementation TiXianBottomTableViewCell


- (UITextField *)money{
    if (_money == nil) {
        _money = [[UITextField alloc] init];
    }
    return _money;
}

- (UILabel *)nameLable{
    if (_nameLable == nil) {
        _nameLable = [[UILabel alloc] init];
        _nameLable.text = @"可提额度";
    }
    return _nameLable;
}

- (UIButton *)btn{
    if (_btn == nil) {
        _btn = [[UIButton alloc] init];
        [_btn setTitle:@"全部提现" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return _btn;
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
        make.top.mas_offset(kAdaptedWidth(19));
        make.left.mas_equalTo(14);
        make.bottom.mas_offset(-kAdaptedWidth(19));
    }];
    
    [self.contentView addSubview:self.btn];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-14);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(80);
    }];
    
    
    [self.contentView addSubview:self.money];
    [self.money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLable.mas_right);
        make.top.mas_equalTo(self.contentView.mas_top);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.right.mas_equalTo(self.btn.mas_left);
    }];
    
    
    
}

@end
