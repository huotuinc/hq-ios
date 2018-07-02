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
        _upLable.textColor = LWColor(133, 133, 133);
//        _upLable.text = @"dasdasidasoid";
        _upLable.font = kAdaptedFontSize(13);
    }
    return _upLable;
}

- (UILabel *)downLable{
    if (_downLable == nil) {
        _downLable = [[UILabel alloc] init];
        _downLable.textColor = LWColor(133, 133, 133);
        _downLable.font = kAdaptedFontSize(13);
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
//    self.upLable.backgroundColor = [UIColor blueColor];
    
    [self.upLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(kAdaptedWidth(10));
        make.left.mas_equalTo(self.mas_left);
    }];
    
    [self addSubview:self.downLable];
//    self.downLable.backgroundColor = [UIColor blueColor];
//    self.downLable.text = @"dasdasdas等哈是多久啊dasidasoid";
    [self.downLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.upLable.mas_bottom).mas_offset(kAdaptedWidth(5));
        make.left.mas_equalTo(self.upLable.mas_left);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-kAdaptedWidth(10));
    }];
    
    
}


- (void)configArticleView:(HTArticleCellModel *)cellModel{
    _model = cellModel;
    
    self.upLable.text = [NSString stringWithFormat:@"%@       已被转发%d次",cellModel.article.Time,cellModel.article.TurnAmount];
    
    NSString *text = [NSString stringWithFormat:@"可赚利润: %@元",cellModel.article.Profit];
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, text.length - 5)];
    self.downLable.attributedText = attributeStr;
    
    
}

@end
