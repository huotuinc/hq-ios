//
//  ShopHomeHeader.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/3.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ShopHomeHeader.h"

@interface ShopHomeHeader ()

@property (nonatomic,strong) UILabel * leftLable;

@property (nonatomic,strong) UILabel * yuRanXLable;

@property (nonatomic,strong) UILabel * DongJieLable;



@end


@implementation ShopHomeHeader


- (UILabel *)leftLable{
    if (_leftLable == nil) {
        _leftLable = [[UILabel alloc] init];
        _leftLable.text = @"贷款15300";
    }
    return _leftLable;
}

- (UILabel *)yuRanXLable{
    if (_yuRanXLable == nil) {
        _yuRanXLable = [[UILabel alloc] init];
        _yuRanXLable.text = @"预览小店";
        [_yuRanXLable setTextColor:[UIColor whiteColor]];
        _yuRanXLable.backgroundColor = LWColor(210, 50, 61);
        _yuRanXLable.layer.cornerRadius = 5;
        _yuRanXLable.adjustsFontSizeToFitWidth = YES;
        _yuRanXLable.font = kAdaptedFontSize(13);
        _yuRanXLable.textAlignment = NSTextAlignmentCenter;
        _yuRanXLable.layer.masksToBounds = YES;
        _yuRanXLable.userInteractionEnabled = YES;
        KWeakSelf(self);
        [_yuRanXLable bk_whenTapped:^{
            [weakself.delegate ShopHomeHeaderClick:0];
        }];
    }
    return _yuRanXLable;
}

- (UILabel *)DongJieLable{
    if (_DongJieLable == nil) {
        _DongJieLable = [[UILabel alloc] init];
        _DongJieLable.text = @"冻结详情";
        [_DongJieLable setTextColor:LWColor(210, 50, 61)];
        _DongJieLable.layer.borderWidth = .8f;
        _DongJieLable.layer.borderColor = LWColor(210, 50, 61).CGColor;
        _DongJieLable.layer.cornerRadius = 5;
        _DongJieLable.adjustsFontSizeToFitWidth = YES;
        _DongJieLable.font = kAdaptedFontSize(13);
        _DongJieLable.textAlignment = NSTextAlignmentCenter;
    }
    return _DongJieLable;
}


- (instancetype)init{
    if (self = [super init]) {
        
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    [self addSubview:self.leftLable];
    [self.leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(10);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
   
    [self addSubview:self.DongJieLable];
    [self.DongJieLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(25);
        make.centerY.mas_equalTo(self.centerY);
        make.right.mas_equalTo(self.mas_right).mas_offset(-10);
    }];
    
    [self addSubview:self.yuRanXLable];
    [self.yuRanXLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(25);
        make.centerY.mas_equalTo(self.centerY);
        make.right.mas_equalTo(self.DongJieLable.mas_left).mas_offset(-5);
    }];
}

- (void)configure:(NSString *)model{
    
    NSString * name = [NSString stringWithFormat:@"贷款 %@",model];
    
    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:name];
    
    [str addAttribute:NSForegroundColorAttributeName
                value:[UIColor redColor]
                range:NSMakeRange(3 , name.length -3)];
    self.leftLable.attributedText = str;
    
    
   
}

@end
