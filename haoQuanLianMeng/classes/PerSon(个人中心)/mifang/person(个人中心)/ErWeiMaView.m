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


@property (nonatomic,strong) UIButton  * shareBtn;


@property (nonatomic,strong) UIImageView  * arrBtn;


@property (nonatomic,strong) UIImage  * erwma;
@end


@implementation ErWeiMaView

- (UIButton *)shareBtn{
    if (_shareBtn == nil) {
        _shareBtn = [[UIButton alloc] init];
        [_shareBtn setTitle:@"分享二维码" forState:UIControlStateNormal];
        _shareBtn.titleLabel.font = kAdaptedFontSize(15);
        _shareBtn.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.8];
        [_shareBtn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
        _shareBtn.hidden = YES;
    }
    return _shareBtn;
}


- (void)btnclick{
    
    [self.delegate shareBtnClick:self.erwma];
}

- (UIImageView *)arrBtn{
    if (_arrBtn == nil) {
        _arrBtn = [[UIImageView alloc] init];
        _arrBtn.image = [UIImage imageNamed:@"close-circle"];
        _arrBtn.userInteractionEnabled = YES;
        KWeakSelf(self);
        [_arrBtn bk_whenTapped:^{
            [weakself dis];
        }];
    }
    return _arrBtn;
}


- (void)setUrl:(NSString *)url{
    _url = url;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
        if (!error) {
            self.erwma = image;
            CGSize size = image.size;
            [self.iconView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(KScreenWidth - 80);
                make.height.mas_equalTo((KScreenWidth - 80) * size.height / size.width);
            }];
            
            _shareBtn.hidden = NO;
            
            
            [self addSubview:self.arrBtn];
            [self.arrBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.iconView.mas_right).mas_offset(-15);
                make.bottom.mas_equalTo(self.iconView.mas_top).mas_offset(5);
                //make.centerY.mas_equalTo(self.mas_centerY);
                make.height.width.mas_equalTo(44);
            }];
        }
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
        
        

        
        
        
        [self addSubview:self.shareBtn];
        [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.iconView.mas_centerX);
            make.top.mas_equalTo(self.iconView.mas_bottom).mas_offset(20);
            make.height.mas_equalTo(42);
            make.width.mas_equalTo(100);
        }];
        
        self.shareBtn.layer.cornerRadius = 21;
        
        
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
