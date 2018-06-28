//
//  ProductMessage.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/14.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ProductMessage.h"

@interface ProductMessage ()

@property (nonatomic, strong) UIImageView * iconView;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel * contentLabel;

@end


@implementation ProductMessage



- (UIImageView *)iconView {
    if (_iconView == nil){
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}


- (UILabel *)titleLabel {
    if (_titleLabel == nil){
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 2;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (_contentLabel == nil){
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.numberOfLines = 3;
    }
    return _contentLabel;
}



- (instancetype)init {
    if (self = [super init]){
        [self setUpInit];
    }
    return self;
}

- (void)setUpInit {

    [self addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(kAdaptedWidth(70));
        make.left.mas_equalTo(self.mas_left).mas_offset(20);
        make.top.mas_equalTo(self.mas_top).mas_offset(20);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(20);
    }];


    CGFloat height = [HTToolShareManager titleHeightWithFont:kAdaptedFontSize(20)];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right);
        make.right.mas_equalTo(self.mas_right);
        make.top.mas_equalTo(self.iconView.mas_top);
        make.height.mas_equalTo(height);
    }];


    [self addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.right.mas_equalTo(self.titleLabel.mas_right);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(5);

    }];

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
