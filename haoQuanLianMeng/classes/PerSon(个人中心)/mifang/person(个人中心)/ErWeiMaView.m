//
//  ErWeiMaView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/29.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ErWeiMaView.h"

@interface ErWeiMaView ()


@property (nonatomic,strong) UIImageView  * iconView;
@end


@implementation ErWeiMaView



- (void)setUrl:(NSString *)url{
    _url = url;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        CGSize size = image.size;
        [self.iconView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(KScreenWidth - 80);
            make.height.mas_equalTo((KScreenWidth - 80) * size.height / size.width);
        }];
    }];
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.iconView = [[UIImageView alloc] init];
        [self addSubview:self.iconView];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.height.width.mas_equalTo(0);
        }];
        
        
        self.userInteractionEnabled = YES;
        KWeakSelf(self);
        [self bk_whenTapped:^{
            [weakself dis];
        }];
//        UIColor *color = [UIColor blackColor];
//        bgView.backgroundColor = [color colorWithAlphaComponent:0.5];
        self.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5];
        
    }
    return self;
}

- (void)dis{
    [UIView animateWithDuration:1.0f delay:0.5f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        //self.iconView.alpha = 0.0f;
//        launchView.layer.transform = CATransform3DScale(CATransform3DIdentity, 2.0f, 2.0f, 1.0f);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
