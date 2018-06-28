//
//  TiXianTopView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/20.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TiXianTopView.h"
@interface TiXianTopView ()

@property (nonatomic,strong) UILabel * nameLable;

@property (nonatomic,strong) UILabel * accountLable;

@end


@implementation TiXianTopView

- (UILabel *)nameLable{
    if (_nameLable == nil) {
        _nameLable = [[UILabel alloc] init];
        _nameLable.text = @"小米";
    }
    return _nameLable;
}

- (UILabel *)accountLable{
    if (_accountLable == nil) {
        _accountLable = [[UILabel alloc] init];
        _accountLable.text = @"605455337@qq.com";
    }
    return _accountLable;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self setUpInit];
    }
    return self;
}

- (void)setUpInit{

    [self.contentView addSubview:self.nameLable];
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(14);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(kAdaptedWidth(15));
    }];
    
    [self.contentView addSubview:self.accountLable];
    [self.accountLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(14);
        make.top.mas_equalTo(self.nameLable.mas_bottom).mas_offset(12);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-kAdaptedWidth(15));
    }];
}

@end
