//
//  HTArticleBottomTitle.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTArticleBottomTitleView.h"

@interface HTArticleBottomTitleView()

@property (nonatomic,strong) UILabel * upLable;

@property (nonatomic,strong) UILabel * downLable;

//数据模型
@property (nonatomic,strong) HTArticleCellModel * model;

@end


@implementation HTArticleBottomTitleView


- (UILabel *)upLable{
    if (_upLable == nil) {
        _upLable = [[UILabel alloc] init];
    }
    return _upLable;
}

- (UILabel *)downLable{
    if (_downLable == nil) {
        _downLable = [[UILabel alloc] init];
    }
    return _downLable;
}


- (instancetype)init{
    
    if (self = [super init]) {
        [self setupInit];
    }
    return self;
}


- (void)setupInit{
    
    [self addSubview:self.upLable];
    [self.upLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(20);
        make.left.mas_equalTo(self.mas_left).mas_offset(100);
    }];
    
    [self addSubview:self.downLable];
    [self.downLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(20);
        make.left.mas_equalTo(self.mas_left).mas_offset(100);
        make.bottom.mas_offset(self.mas_bottom).mas_offset(-18);
    }];
    
    
}


- (void)configArticleView:(HTArticleCellModel *)cellModel{
    _model = cellModel;
#warning luohaibo
    
}

@end
