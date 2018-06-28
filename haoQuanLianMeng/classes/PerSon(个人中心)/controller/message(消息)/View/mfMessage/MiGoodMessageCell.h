//
//  MiGoodMessageCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/14.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MiGoodMessageBaseView.h"
#import "LWMessageHeaderView.h"

@interface MiGoodMessageCell : UITableViewCell{
    MiGoodMessageBaseView * _bottomView;

}

//资讯数据cell模型
@property (nonatomic,strong) HTArticleCellModel * htArticleModel;

@property (nonatomic,strong) UIView * container;

@property (nonatomic,strong) MiGoodMessageBaseView * bottomView;

@property (nonatomic,strong) LWMessageHeaderView * messageHeaderView;



//子类重写必须 先调父类。。。。。。。。。。。。。。
- (void)updateCell;
- (void)configureCellWithCellModel:(HTArticleCellModel *)model;



@end
