//
// Created by 罗海波 on 2018/6/13.
// Copyright (c) 2018 HT. All rights reserved.
//

#import "LWMessageHeaderView.h"

@interface LWMessageHeaderView ()

@property (nonatomic,strong) UILabel * titleLabel;

@property (nonatomic,strong) UILabel * timeLabel;

@property (nonatomic,strong) UIImageView * headView;



@end


@implementation LWMessageHeaderView


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


- (UIImageView *)headView{
    if (_headView == nil) {
        _headView = [[UIImageView alloc] init];
        _headView.layer.cornerRadius = 5;
        _headView.layer.masksToBounds = YES;
        _headView.image = [UIImage imageNamed:@"tdsy"];
    }
    return _headView;
}




- (instancetype)init {
    if (self = [super init]){

        [self setUpInit];
        
        
        self.backgroundColor = [UIColor whiteColor];

    }
    return self;
}



- (void)setUpInit{


    [self addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(10);
        make.width.height.mas_equalTo(kAdaptedWidth(44));
        make.top.mas_equalTo(self.mas_top).mas_offset(5);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-10);
    }];


    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headView.mas_right).mas_offset(10);
        make.top.mas_equalTo(self.headView.mas_top);
        make.right.mas_equalTo(self.mas_right).mas_offset(-10);
    }];


    [self addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(5);
    }];

}





@end
