//
//  MiGoodMessageCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/14.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MiGoodMessageCell.h"


@interface MiGoodMessageCell ()






@end




@implementation MiGoodMessageCell

//底部的不同消息类型
@synthesize bottomView = _centerView;


- (UIView *)container {
    if (_container == nil){
        _container = [[UIView alloc] init];
    }
    return _container;
}


- (LWMessageHeaderView *)messageHeaderView {
    if (_messageHeaderView== nil){
        _messageHeaderView = [[LWMessageHeaderView alloc] init];
    }
    return _messageHeaderView;
}



- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]){
        [self setUpInit];
    }
    return self;
}

- (void)setUpInit {

    [self.contentView addSubview:self.container];
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.container.mas_left);
        make.right.mas_equalTo(self.container.mas_right);
        make.top.mas_equalTo(self.container.mas_top);
        make.bottom.mas_equalTo(self.container.mas_bottom);
    }];


    [self setDefault];

}

- (void)setDefault {

    [self.container addSubview:self.messageHeaderView];
    [self.messageHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.mas_equalTo(self.contentView.mas_left);
       make.right.mas_equalTo(self.contentView.mas_right);
       make.top.mas_equalTo(self.contentView.mas_top);
    }];
}




- (void)updateCell{

    //设置头部数据
    [self.messageHeaderView configArticleView:self.htArticleModel];

    //设置底部数据
    [self.bottomView configArticleView:self.htArticleModel];
}



- (void)configureCellWithCellModel:(HTArticleCellModel *)model{

    self.htArticleModel = model;
    [self updateCell];
}


@end
