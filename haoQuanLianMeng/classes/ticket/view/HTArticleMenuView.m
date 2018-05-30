//
//  HTArticleMenuView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTArticleMenuView.h"
#import "HTArticleCellModel.h"

@interface HTArticleMenuView()

@property (nonatomic ,strong) UIButton *firstBtn;
@property (nonatomic ,strong) UIButton * secondBtn;

@property (nonatomic ,strong) UIView * sliderView;

@property (nonatomic ,strong) UIView * sliderCenterView;


//数据模型
@property (nonatomic,strong) HTArticleCellModel * model;


@end


@implementation HTArticleMenuView


- (UIView *)sliderView{
    if (_sliderView == nil) {
        _sliderView = [[UIView alloc] init];
        _sliderView.backgroundColor = [UIColor blackColor];
    }
    return _sliderView;
}

- (UIView *)sliderCenterView{
    if (_sliderCenterView == nil) {
        _sliderCenterView = [[UIView alloc] init];
        _sliderCenterView.backgroundColor = [UIColor blackColor];
    }
    return _sliderCenterView;
}


- (UIButton *)firstBtn{
    if (!_firstBtn) {
        _firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _firstBtn.tag = 1001;
        _firstBtn.titleLabel.font = kAdaptedFontSize(13);
        _firstBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_firstBtn setImageEdgeInsets:UIEdgeInsetsMake(0, kAdaptedWidth(-5), 0, 0)];
        //        [_secondBtn setTitleColor:[UIColor colorFromHexCode:@"555555"] forState:UIControlStateNormal];
        //        [_secondBtn addTarget:self action:@selector(selectMenu:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _firstBtn
    ;
}


- (UIButton *)secondBtn{
    if (!_secondBtn) {
        _secondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _secondBtn.tag = 1001;
        _secondBtn.titleLabel.font = kAdaptedFontSize(13);
        _secondBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_secondBtn setImageEdgeInsets:UIEdgeInsetsMake(0, kAdaptedWidth(-5), 0, 0)];
//        [_secondBtn setTitleColor:[UIColor colorFromHexCode:@"555555"] forState:UIControlStateNormal];
//        [_secondBtn addTarget:self action:@selector(selectMenu:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _secondBtn;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}
- (void)setupView{
    
    [self addSubview:self.sliderView];
    [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(.8f);
        make.top.equalTo(self);
    }];
    
    [self addSubview:self.sliderCenterView];
    [self.sliderCenterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(.8f);
        make.top.equalTo(self).mas_offset(5);
        make.bottom.equalTo(self).mas_offset(-5);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    
    [self addSubview:self.firstBtn];
    [self.firstBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self.sliderCenterView.mas_left);
        make.top.equalTo(self.sliderView.mas_bottom);
        make.bottom.equalTo(self);
    }];
    
    [self addSubview:self.secondBtn];
    [self.secondBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sliderCenterView.mas_right);
        make.right.equalTo(self);
        make.top.equalTo(self.sliderView.mas_bottom);
        make.bottom.equalTo(self);
    }];
    
}

- (void)configArticleView:(HTArticleCellModel *)cellModel{
    _model = cellModel;
}
@end
