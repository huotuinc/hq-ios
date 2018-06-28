//
//  HTArticleTableViewCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//  好券au z

#import <UIKit/UIKit.h>
#import "HTArticleCellModel.h"
#import "HTArticleBaseView.h"
#import "HTArticleBottomTitleView.h"
#import "HTArticleMenuView.h"

@interface HTArticleTableViewCell : UITableViewCell{
   HTArticleBaseView * _centerView;
}

//资讯数据模型
@property (nonatomic,strong) HTArticleCellModel * htArticleModel;
//
@property (nonatomic, strong) UILabel * iTitleLabel;
//
@property (nonatomic, strong) UIImageView *headView;
//
@property (nonatomic, strong) UILabel *contextlabel;

//中间的视图
@property (nonatomic,strong) HTArticleBaseView * centerView;



//底部的文字
@property (nonatomic,strong) HTArticleBottomTitleView * htArticleBottomTitleView;


//底部的工具栏
@property (nonatomic,strong) HTArticleMenuView * htArticleMenuView;


@property (nonatomic, strong) id<HTArticleCenterViewDelegate>delegate;


//子类重写必须 先调父类。。。。。。。。。。。。。。
- (void)updateCell;
- (void)configCellWithCellModel:(HTArticleCellModel *)model;



@end
