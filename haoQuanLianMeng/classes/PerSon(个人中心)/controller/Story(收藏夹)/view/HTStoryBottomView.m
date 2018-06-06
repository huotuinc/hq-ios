//
//  HTStoryBottomView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/6.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTStoryBottomView.h"

@interface HTStoryBottomView()

@property (nonatomic,strong) UIImageView * iconView;

@property (nonatomic,strong) UILabel * selectLable;

@property (nonatomic,strong) UIButton * btnShare;

@end


@implementation HTStoryBottomView


- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}


- (UILabel *)selectLable{
    if (_selectLable == nil) {
        _selectLable = [[UILabel alloc] init];
    }
    return _selectLable;
}


- (UIButton *)btnShare{
    if (_btnShare == nil) {
        _btnShare = [[UIButton alloc] init];
    }
    return _btnShare;
}

- (instancetype)init{
    if (self = [super init]) {
        
        [self setUpInit];
        
    }
    return self;
}


- (void)setUpInit{
    
    [self addSubview:self.iconView];
    
    
    [self addSubview:self.selectLable];
    
    
    [self addSubview:self.btnShare];
    
}

@end
