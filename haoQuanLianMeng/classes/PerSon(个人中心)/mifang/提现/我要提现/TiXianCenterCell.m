//
//  TiXianCenterCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/20.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TiXianCenterCell.h"


@interface TiXianCenterCell()

@property (nonatomic,strong) UILabel * nameLable;

@property (nonatomic,strong) UILabel * accountLable;

@end

@implementation TiXianCenterCell


- (UILabel *)nameLable{
    if (_nameLable == nil) {
        _nameLable = [[UILabel alloc] init];
        _nameLable.text = @"余额";
    }
    return _nameLable;
}

- (UILabel *)accountLable{
    if (_accountLable == nil) {
        _accountLable = [[UILabel alloc] init];
    }
    return _accountLable;
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
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(14);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(kAdaptedWidth(21));
    }];
    
    [self.contentView addSubview:self.accountLable];
    [self.accountLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(14);
        make.top.mas_equalTo(self.nameLable.mas_bottom).mas_offset(kAdaptedWidth(23));
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-kAdaptedWidth(23));
    }];
    
    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:@"¥ 33"];
    
    [str addAttribute:NSFontAttributeName
                value:kAdaptedFontSize(40)
                range:NSMakeRange(2 , [NSString stringWithFormat:@"¥ 33"].length - 2)];
    self.accountLable.attributedText = str;
}
@end
