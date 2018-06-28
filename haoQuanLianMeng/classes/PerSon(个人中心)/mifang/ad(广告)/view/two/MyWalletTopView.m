//
//  MyWalletTopView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/15.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MyWalletTopView.h"


@interface MyWalletTopView ()

@property (nonatomic,strong) UIImageView * iconView;

@property (nonatomic,strong) UILabel * title;
@end


@implementation MyWalletTopView


- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"right"];
    }
    return _iconView;
}


- (UILabel *)title{
    if (_title == nil) {
        _title = [[UILabel alloc] init];
        _title.text = @"我的钱包";
        _title.font = kAdaptedFontSize(13);
    }
    return _title;
}

- (instancetype)init{
    if (self = [super init]) {
        [self setUpInit];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)setUpInit{
    
    [self addSubview:self.title];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(8);
        make.left.mas_equalTo(self.mas_left).mas_offset(10);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-8);
    }];
    
    [self addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.title.mas_top);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_equalTo(self.mas_right).mas_offset(-10);
//        make.bottom.mas_equalTo(self.title.mas_bottom);
        make.width.height.mas_equalTo(kAdaptedWidth(20));
    }];
}

- (void)setTitle:(NSString *)title and:(BOOL)show{
    _title.text = title;
    self.iconView.hidden = show;
    if (!show) {
        self.userInteractionEnabled = YES;
        KWeakSelf(self);
        [self bk_whenTapped:^{
            [weakself.delegate MyWalletTopViewClick:0];
        }];
    }
}
@end
