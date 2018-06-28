//
//  MiSystemMessgaeView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/15.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MiSystemMessgaeView.h"


@interface MiSystemMessgaeView ()

@property (nonatomic, strong) UIImageView * iconView;

@property (nonatomic, strong) UILabel * titleLabel;


@end


@implementation MiSystemMessgaeView


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


- (instancetype)init {
    if (self = [super init]){
      [self setUpInit];
    }
    return self;
}


- (void)setUpInit {

    [self addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.height.width.mas_equalTo(kAdaptedWidth(70));
        make.left.mas_equalTo(self.mas_left).mas_offset(10);
        make.right.mas_equalTo(self.mas_right).mas_offset(-10);
        make.top.mas_equalTo(self.mas_top).mas_offset(10);
        make.height.mas_equalTo(self.iconView.mas_width).multipliedBy(0.5);
    }];


//    CGFloat height = [HTToolShareManager titleHeightWithFont:kAdaptedFontSize(20)];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right);
        make.right.mas_equalTo(self.iconView.mas_right);
        make.top.mas_equalTo(self.iconView.mas_bottom).mas_offset(10);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-10);
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
