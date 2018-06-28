//
//  BuyAccountCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "BuyAccountCell.h"

@interface BuyAccountCell ()

@property (nonatomic,strong) UILabel * nameLable;


@property (nonatomic,strong) UILabel * chanelLable;


@end


@implementation BuyAccountCell


- (UILabel *)nameLable{
    if (_nameLable == nil) {
        _nameLable = [[UILabel alloc] init];
    }
    return _nameLable;
}

- (UILabel *)chanelLable{
    if (_chanelLable == nil) {
        _chanelLable = [[UILabel alloc] init];
    }
    return _chanelLable;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.nameLable];
        [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(self.contentView.mas_top).mas_offset(20);
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-20);
        }];
        
        [self.contentView addSubview:self.chanelLable];
        [self.chanelLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameLable.mas_bottom).mas_offset(20);
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-20);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-20);
        }];
        
    }
    return self;
}

@end
