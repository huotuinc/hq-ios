//
//  ZXEaseBlankPageView.m
//  XingZhang
//
//  Created by 孟辉 on 2017/3/8.
//  Copyright © 2017年 xz. All rights reserved.
//

#import "XZEaseBlankPageView.h"
#import "UIView+SetLayer.h"
#import "UIColor+FlatUI.h"

@implementation XZEaseBlankPageView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)configWithType:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id))block{
    
    if (hasData) {
        [self removeFromSuperview];
        return;
    }
    self.alpha = 1.0;
    //    图片
    if (!_monkeyView) {
        _monkeyView = [[UIImageView alloc] init];
        [self addSubview:_monkeyView];
        
    }
    ///
    //    文字
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tipLabel.numberOfLines = 0;
        _tipLabel.font = kAdaptedFontSize(15);
        _tipLabel.textColor = [UIColor colorFromHexCode:@"666666"];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_tipLabel];
    }
    
    //    布局
    [_monkeyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).offset(-64);
    }];
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.centerX.equalTo(self);
        make.top.equalTo(_monkeyView.mas_bottom).offset(10);
        make.height.mas_equalTo(50);
    }];
    
    _reloadButtonBlock = nil;
    
    if (!_reloadButton) {
        _reloadButton = [[UIButton alloc] initWithFrame:CGRectZero];
        //[_reloadButton setImage:[UIImage imageNamed:@"blankpage_button_reload"] forState:UIControlStateNormal];
        _reloadButton.adjustsImageWhenHighlighted = YES;
        [_reloadButton addTarget:self action:@selector(reloadButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_reloadButton];
        [_reloadButton setLayerCornerRadius:1.5];
        [_reloadButton setBorderWidth:0.5 color:[UIColor colorFromHexCode:@"1dadf3"]];
        [_reloadButton setTitle:@"重试" forState:UIControlStateNormal];
        [_reloadButton setTitleColor:[UIColor colorFromHexCode:@"1dadf3"] forState:UIControlStateNormal];
        [_reloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(_tipLabel.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(130, 40));
        }];
    }
    _reloadButton.hidden = NO;
    _reloadButtonBlock = block;
    
    if (hasError) {
        //        加载失败

        [_monkeyView setImage:[UIImage imageNamed:@"blankpage_image_loadFail"]];
        _tipLabel.text = @"网络开了个小差";
        
        if (blankPageType==EaseBlankPageTypeMaterialScheduling) {
            _reloadButton.hidden=YES;
        }
        
    }else{
        //        空白数据
        if (_reloadButton) {
            _reloadButton.hidden = NO;
        }
        NSString *imageName, *tipStr;
        switch (blankPageType) {
            case EaseBlankPageTypeProject:
            {
                imageName = @"blankpage_image_Sleep";
                tipStr = @"暂无数据";
            }
                break;
            case EaseBlankPageTypeNoButton:
            {
                imageName = @"blankpage_image_Sleep";
                tipStr = @"暂无数据";
                if (_reloadButton) {
                    _reloadButton.hidden = YES;
                }
            }
                break;
            default://其它页面（这里没有提到的页面，都属于其它）
            {
                imageName = @"blankpage_image_Sleep";
                tipStr = @"暂无数据";
            }
                break;
        }
        [_monkeyView setImage:[UIImage imageNamed:imageName]];
        _tipLabel.text = tipStr;
    }
}

- (void)reloadButtonClicked:(id)sender{
    self.hidden = YES;
    [self removeFromSuperview];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_reloadButtonBlock) {
            _reloadButtonBlock(sender);
        }
    //});
}
@end
