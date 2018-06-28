//
//  PhoneViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "PhoneViewCell.h"
@interface PhoneViewCell ()

@end

@implementation PhoneViewCell




- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self buildCell];
        [self bindConstraints];
    }
    
    return self;
}

- (void)buildCell
{
    self.imageView = [[UIImageView alloc] init];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = true;
    [self.contentView addSubview:self.imageView];
}

- (void)bindConstraints
{
    [self.imageView mas_updateConstraints:^(MASConstraintMaker* make) {
        make.top.left.right.bottom.offset(0);
    }];
}


@end
