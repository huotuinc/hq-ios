//
//  QuanDetailDescriptionView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/1.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "QuanDetailDescriptionView.h"

@interface QuanDetailDescriptionView ()


@property (nonatomic,strong) UIView * Container;


@property (nonatomic,strong) UILabel * titleLable;

@property (nonatomic,strong) UILabel * contentLable;


@end


@implementation QuanDetailDescriptionView


- (UIView *)Container{
    if (_Container == nil) {
        _Container = [[UIView alloc] init];
    }
    return _Container;
}

- (UILabel *)titleLable{
    if (_titleLable == nil) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.text = @"商品描述";
    }
    return _titleLable;
}

- (UILabel *)contentLable{
    if (_contentLable == nil) {
        _contentLable = [[UILabel alloc] init];
    }
    return _contentLable;
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (CGFloat)QuanDetailDescriptionHeight{
    
    return 11;
}

- (CGSize)caclu:(int)font{
    NSString *titleContent = @"亲，欢迎您";
    CGSize titleSize = [titleContent boundingRectWithSize:CGSizeMake(KScreenWidth - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:kAdaptedFontSize(font)} context:nil].size;
    return titleSize;
}

@end
