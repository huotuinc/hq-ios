//
//  TitleView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TitleView.h"

@interface TitleView ()


@property (nonatomic,strong) UILabel * titleLable;

@end


@implementation TitleView


- (UILabel *)titleLable{
    if (_titleLable == nil) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.textColor = LWColor(131, 131, 131);
        _titleLable.font = kAdaptedFontSize(13);
    }
    return _titleLable;
}

- (instancetype)init{
    if (self = [super init]) {
        [self addSubview:self.titleLable];
        [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
    }
    return self;
}


- (void)settitle:(NSString *)title{
    self.titleLable.text = title;
}

- (void)setSelected:(BOOL)selected{
    if (selected) {
        _titleLable.textColor = LWColor(254, 76, 85);
    }else{
        _titleLable.textColor = LWColor(131, 131, 131);
    }
}

@end
