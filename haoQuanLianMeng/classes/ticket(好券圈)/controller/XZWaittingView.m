//
//  XZWaitting.m
//  XingZhang
//
//  Created by 孟辉 on 2017/3/14.
//  Copyright © 2017年 xz. All rights reserved.
//

#import "XZWaittingView.h"
@interface XZWaittingView()
@property (nonatomic, strong)UIImageView *loadImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)NSTimer *timer;
@end
@implementation XZWaittingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}
- (void)setupView
{
    [self addSubview:self.loadImageView];
    [self addSubview:self.titleLabel];
    [self.loadImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(kAdaptedWidth(-20));
        make.width.height.mas_equalTo(kAdaptedWidth(60));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.loadImageView.mas_bottom).offset(kAdaptedWidth(15));
        //make.width.mas_equalTo(100);
//         make.width.mas_equalTo(100);
    }];
    
    
}
- (CGFloat)calculateContentLabelWidth:(NSString *)title
{
    return 0 ;//[title calculateWidthSingeRowWithheight:kAdaptedWidth(30) font:kAdaptedFontSize(15)];
    
}
- (void)dealloc{
    [self.timer invalidate];
}
- (void)p_transform
{
    CGFloat angle = 2.0 * M_PI / 12;
    self.loadImageView.transform = CGAffineTransformRotate(self.loadImageView.transform, angle);
}
- (NSTimer *)timer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(p_transform) userInfo:nil repeats:YES];
    }
    return _timer;
}
- (UIImageView *)loadImageView
{
    if (!_loadImageView)  {
        _loadImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"加载"]];
    }
    return _loadImageView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        //_titleLabel.backgroundColor = [UIColor redColor];
        _titleLabel.font = kAdaptedFontSize(15);
    }
    return _titleLabel;
    
}
- (void)configView:(NSString *)text{
    
    self.titleLabel.text = text;
//    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo([self calculateContentLabelWidth:text]);
//    }];
    [self.timer fire];
}
@end
