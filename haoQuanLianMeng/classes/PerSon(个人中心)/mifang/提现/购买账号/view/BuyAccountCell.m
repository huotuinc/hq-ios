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
        _nameLable.text = @"总共计/抵扣: 3个";
    }
    return _nameLable;
}

- (UILabel *)chanelLable{
    if (_chanelLable == nil) {
        _chanelLable = [[UILabel alloc] init];
        _chanelLable.text = @"qweqwe";
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
            make.top.mas_equalTo(self.nameLable.mas_bottom).mas_offset(5);
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-20);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-20);
        }];
        
    }
    return self;
}


- (void)configure:(int)account andAccountInfo:(int)price{
    
    self.nameLable.text = [NSString stringWithFormat:@"总共计: %d个",account];
    
    int pricet =  price * account;
    NSString * money =  [NSString stringWithFormat:@"%d",pricet];
    LWLog(@"%lu",(unsigned long)money.length);
//    money.length
    NSString * t = [NSString stringWithFormat:@"应付: %@元",money];
    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:t];
    
    [str addAttribute:NSFontAttributeName
                value:kAdaptedFontSize(40)
                range:NSMakeRange(4 , money.length )];
    [str addAttribute:NSForegroundColorAttributeName
                value:[UIColor redColor]
                range:NSMakeRange(4 , money.length )];
    self.chanelLable.attributedText = str;
    
}

@end
