//
//  InviteCollectionViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "InviteCollectionViewCell.h"


@interface InviteCollectionViewCell ()

@property (nonatomic,strong) UIImageView * iconView;

@end

@implementation InviteCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    _iconView = [[UIImageView alloc] init];
    _iconView.image = [UIImage imageNamed:@"quan"];
    [self.contentView addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.contentView.mas_top);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
}
@end
