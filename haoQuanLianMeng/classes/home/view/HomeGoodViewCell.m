//
//  HomeGoodViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/29.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HomeGoodViewCell.h"

@interface HomeGoodViewCell ()

@property (nonatomic,strong) UIImageView  * iconView;

@property (nonatomic,copy) UILabel  * nameLable;

@property (nonatomic,copy) UILabel  * subNameLable;


@end


@implementation HomeGoodViewCell

- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}


- (UILabel *)nameLable{
    if (_nameLable == nil) {
        _nameLable = [[UILabel alloc] init];
    }
    return _nameLable;
}

- (UILabel *)subNameLable{
    if (_subNameLable == nil) {
        _subNameLable = [[UILabel alloc] init];
    }
    return _subNameLable;
}


- (instancetype)init{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}


- (void)setup{
    
    [self.contentView addSubview:self.iconView];
    
    [self.contentView addSubview:self.nameLable];
    
    [self.contentView addSubview:self.subNameLable];
    
}
@end
