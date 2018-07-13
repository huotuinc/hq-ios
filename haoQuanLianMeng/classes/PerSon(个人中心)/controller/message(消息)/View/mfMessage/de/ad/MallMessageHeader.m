//
//  MallMessageHeader.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MallMessageHeader.h"

@interface MallMessageHeader ()

@property (nonatomic,strong) UILabel * titleLabel;

@property (nonatomic,strong) UILabel * timeLabel;

@end


@implementation MallMessageHeader

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor
        = LWColor(131, 131, 131);
        _titleLabel.font = kAdaptedFontSize(16);
        _titleLabel.text = @"系统通知";
    }
    return _titleLabel;
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor
        = LWColor(195, 195, 195);
        _timeLabel.font = kAdaptedFontSize(12);
        _timeLabel.text = @"2018-05-29 16:09";
    }
    return _timeLabel;
}



- (instancetype)init {
    if (self = [super init]){
        
        [self setUpInit];
        
        
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}



- (void)setUpInit{
    
    
    
    
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.top.mas_equalTo(self.mas_top);
        make.right.mas_equalTo(self.mas_right).mas_offset(-10);
    }];
    
    
    [self addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(5);
        make.bottom.mas_equalTo(self);
    }];
    
}



@end
