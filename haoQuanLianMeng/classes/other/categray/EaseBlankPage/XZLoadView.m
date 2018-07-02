//
//  XZBLoadView.m
//  XingZhang
//
//  Created by 孟辉 on 2017/3/8.
//  Copyright © 2017年 xz. All rights reserved.
//

#import "XZLoadView.h"
#import "UIColor+FlatUI.h"
@implementation XZLoadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor = [UIColor colorFromHexCode:@"666666"];
        self.titleLabel.text = @"加载中...";
        self.titleLabel.font = kAdaptedFontSize(15);
        [self addSubview:self.titleLabel];
        self.loadImageView = [[UIImageView alloc] init];
        self.loadImageView.image = [UIImage imageNamed:@"loadview_image_load"];
        [self addSubview:self.loadImageView];
        [self.loadImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY).offset(-64);
        }];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(_loadImageView.mas_bottom).offset(10);
            make.height.mas_equalTo(50);
        }];
    }
    return self;
}
- (void)p_transform
{
    CGFloat angle = 2.0 * M_PI / 12;
    _loadImageView.transform = CGAffineTransformRotate(_loadImageView.transform, angle);
}
- (NSTimer *)timer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(p_transform) userInfo:nil repeats:YES];
    }
    return _timer;
}
- (void)configView:(NSString *)text{

    self.titleLabel.text = text;
    [self.timer fire];
}
@end
