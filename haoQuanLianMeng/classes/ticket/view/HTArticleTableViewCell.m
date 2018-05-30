//
//  HTArticleTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTArticleTableViewCell.h"

@interface HTArticleTableViewCell()


@end


@implementation HTArticleTableViewCell

@synthesize centerView = _centerView;

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}

- (UILabel *)contextlabel{
    if (_contextlabel == nil) {
        _contextlabel = [[UILabel alloc] init];
    }
    return _contextlabel;
}


- (UIImageView *)headView{
    if (_headView == nil) {
        _headView = [[UIImageView alloc] init];
    }
    return _headView;
}


- (instancetype)init{
    if (self = [super init]) {
        [self setUpInit];
    }
    return self;
}



- (HTArticleBottomTitleView *)htArticleBottomTitleView{
    if (_htArticleBottomTitleView == nil) {
        _htArticleBottomTitleView = [[HTArticleBottomTitleView alloc] init];
    }
    return _htArticleBottomTitleView;
}



- (HTArticleMenuView *)htArticleMenuView{
    if (_htArticleMenuView == nil) {
        _htArticleMenuView = [[HTArticleMenuView alloc] init];
    }
    return _htArticleMenuView;
}



//初始化页面
- (void)setUpInit{
    
    //设置默认的样式
    [self setupDefault];
    
    
    //设置中间视图
    [self setupArticleView];
    
    //设置底部文字
    [self setBottomTitleView];
    
    
    //设置底部工具栏
    [self setBottomMenuView];
    
}

- (void)setupDefault{
    
    [self.contentView addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(kAdaptedHeight(22));
        make.left.equalTo(self.contentView).offset(kAdaptedWidth(22));
        make.height.width.mas_equalTo(kAdaptedWidth(30));
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(kAdaptedHeight(15));
        make.height.mas_equalTo(kAdaptedWidth(20));
        make.right.equalTo(self.contentView).offset(kAdaptedWidth(-15));
        make.left.equalTo(self.headView.mas_right).offset(kAdaptedWidth(16));
    }];
    
    [self.contentView addSubview:self.contextlabel];
    [self.contextlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(kAdaptedHeight(15));
        make.right.equalTo(self.titleLabel.mas_right);
        make.left.equalTo(self.titleLabel);
        make.height.mas_equalTo(100);//先定50
        
    }];
    
}


- (void)setupArticleView
{
    [self.contentView addSubview:self.centerView];
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contextlabel.mas_bottom).offset(kAdaptedWidth(5));
        make.right.equalTo(self.titleLabel.mas_right);//.offset(kAdaptedWidth(-15));
        make.left.equalTo(self.titleLabel);
        make.height.mas_equalTo([self.centerView getHeight]);
        
    }];
}



//设置底部文字
- (void)setBottomTitleView{
    [self.contentView addSubview:self.htArticleBottomTitleView];
    [self.htArticleBottomTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.centerView.mas_bottom);
        make.right.equalTo(self.titleLabel.mas_right);
        make.left.equalTo(self.titleLabel);
        make.height.mas_equalTo(58);//先定50
    }];
    
}



- (void)setBottomMenuView{
    
    [self.contentView addSubview:self.htArticleMenuView];
    [self.htArticleMenuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.htArticleBottomTitleView.mas_bottom);
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.height.mas_equalTo(40);//先定50
    }];
    
}


- (void)configCellWithCellModel:(HTArticleCellModel *)model{
    self.htArticleModel = model;
    [self updateCell];
}


- (void)updateCell{
    
#warning luohaibo
//    NSString * contentString = [self.htArticleModel stringForCoreText];
//    self.contextlabel.text =  contentString;
//    [self.contextlabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo( [self calculateContentLabelHeight]);
//        //make.height.mas_equalTo(self.cellModel.textLayout.textBoundingSize.height);
//    }];
    
    //配置中间视图
    [self.centerView configArticleView:self.htArticleModel];
    
    //更新文字
    [self.htArticleBottomTitleView configArticleView:self.htArticleModel];
    
    
    
    
}


#pragma func
- (CGFloat)calculateContentLabelHeight
{
    //CGFloat labelWidth = [UIScreen mainScreen].bounds.size.width - kAvatarSize - 3 * 10;
//    CGFloat width = KScreenWidth - kAdaptedWidth((70));
//    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
//    NSDictionary* textAttrs = @{ NSFontAttributeName : kAdaptedFontSize(15) };
//    CGFloat height = [[self.htArticleModel stringForCoreText]
//                      boundingRectWithSize:maxSize
//                      options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
//                      attributes:textAttrs
//                      context:nil]
//    .size.height;
    return ceilf(20);
}


@end
