//
//  TuiGuangBottom.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/22.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TuiGuangBottom.h"

@interface TuiGuangBottom ()

@property (nonatomic,strong) UILabel * leftTopLable;


@property (nonatomic,strong) UILabel * leftLable;

@property (nonatomic,strong) UILabel * rightLable;

@property (nonatomic,strong) UILabel * rightDownLable;


@end



@implementation TuiGuangBottom

- (UILabel *)leftTopLable{
    if (_leftTopLable == nil) {
        _leftTopLable = [[UILabel alloc] init];
        _leftTopLable.text = @"20190000";
        _leftTopLable.textColor = LWColor(90, 90, 90);
        _leftTopLable.font = kAdaptedFontSize(15);
    }
    return _leftTopLable;
}

- (UILabel *)leftLable{
    if (_leftLable == nil) {
        _leftLable = [[UILabel alloc] init];
        _leftLable.text = @"20190000";
        _leftLable.textColor = LWColor(213, 213, 213);
        _leftLable.font = kAdaptedFontSize(13);
    }
    return _leftLable;
}


- (UILabel *)rightLable{
    if (_rightLable == nil) {
        _rightLable = [[UILabel alloc] init];
        _rightLable.text = @"获取20积分";
        _rightLable.textColor = LWColor(60, 60, 60);
        _rightLable.font = kAdaptedFontSize(15);
    }
    return _rightLable;
}


- (UILabel *)rightDownLable{
    if (_rightDownLable == nil) {
        _rightDownLable = [[UILabel alloc] init];
        _rightDownLable.text = @"获取20积分";
        _rightDownLable.textColor = LWColor(60, 60, 60);
        _rightDownLable.font = kAdaptedFontSize(15);
    }
    return _rightDownLable;
}


- (instancetype)init{
    if (self = [super init]) {
        
        [self addSubview:self.rightLable];
        [self.rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).mas_offset(kAdaptedWidth(8));
            make.right.mas_equalTo(self.mas_right).mas_offset(kAdaptedWidth(-10));
        }];
        
        [self addSubview:self.rightDownLable];
        [self.rightDownLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.rightLable.mas_bottom).mas_offset(kAdaptedWidth(5));
            make.right.mas_equalTo(self.mas_right).mas_offset(kAdaptedWidth(-10));
            make.bottom.mas_equalTo(self.mas_bottom).mas_offset(kAdaptedWidth(-8));
        }];
        
        [self addSubview:self.leftTopLable];
        [self.leftTopLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.rightLable.mas_centerY);
            make.left.mas_equalTo(self.mas_left).mas_offset(10);
        }];
        
        [self addSubview:self.leftLable];
        [self.leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).mas_offset(10);
            make.centerY.mas_equalTo(self.rightDownLable.mas_centerY);
        }];
    }
    return self;
}


- (void)contigure:(TuiGuangModel *)model{
    
    self.leftTopLable.text = model.wxNickName;
    
    self.leftLable.text = model.CreatTime;
    
    NSString * old =  [NSString stringWithFormat:@"获取%d积分",model.Integral];
    NSString * le =  [NSString stringWithFormat:@"%d",model.Integral];
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:old];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2, le.length)];
    self.rightLable.attributedText = attributeStr;

    old =  [NSString stringWithFormat:@"共%@件商品 合计¥%@",model.OrderGoodsNum,model.OrderFinalAmount];
    
    LWLog(@"%lu",(unsigned long)old.length);
    NSRange rang =  [old rangeOfString:@"¥"];
    attributeStr = [[NSMutableAttributedString alloc] initWithString:old];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(rang.location, old.length - rang.location)];
    self.rightDownLable.attributedText = attributeStr;
}
@end
