//
//  MiFangPersonHeaderView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/6.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MiFangPersonHeaderView.h"

@interface MiFangPersonHeaderView ()

@property (nonatomic,strong) UILabel  * titleLable;

@property (nonatomic,strong) UILabel  * dealBtn;

@end


@implementation MiFangPersonHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLable = [[UILabel alloc] init];
        self.titleLable.text = @"dsadasdasdasdasdasdasd";
        self.titleLable.font = kAdaptedFontSize(12);
        self.titleLable.textColor = [UIColor whiteColor];
        self.dealBtn = [[UILabel alloc] init];
        self.dealBtn.text = @" 立即处理 ";
        self.dealBtn.layer.cornerRadius = 5;
        self.dealBtn.layer.borderWidth = 1.0f;
        self.dealBtn.font = kAdaptedFontSize(13);
        self.dealBtn.layer.borderColor = LWColor(255, 255, 255).CGColor;
        self.dealBtn.textColor = [UIColor whiteColor];
        [self addSubview:self.titleLable];
        
        [self addSubview:self.dealBtn];
        [self.dealBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.mas_right).mas_offset(-10);
            make.centerY.mas_equalTo(self.centerY);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(70);
        }];
        [self.dealBtn adjustsFontSizeToFitWidth];
        self.dealBtn.textAlignment = NSTextAlignmentCenter;
        
        [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).mas_offset(10);
            make.centerY.mas_equalTo(self.centerY);
            make.right.mas_equalTo(self.dealBtn.mas_left).mas_offset(-10);
        }];
        
        
    }
    return self;
}


- (void)configWithData:(MiFangUserCenterModel *)model{
    self.titleLable.text = model.TipStr;
}
@end
