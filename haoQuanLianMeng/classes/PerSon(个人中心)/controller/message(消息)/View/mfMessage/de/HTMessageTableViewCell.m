//
//  HTMessageTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/17.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTMessageTableViewCell.h"




@implementation HTMessageTableViewCell


@synthesize centerView = _centerView;



- (LWMessageHeaderView *)header{
    if (_header == nil) {
        _header = [[LWMessageHeaderView alloc] init];
    }
    return _header;
}


- (MessageBottomView *)messageBottomView{
    if (_messageBottomView == nil) {
        _messageBottomView = [[MessageBottomView alloc] init];
    }
    return _messageBottomView;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){

        [self setUpInit];
    }

    return self;
}


//初始化页面
- (void)setUpInit{

    //设置默认的样式
    [self setupDefault];


//    //设置中间视图
    [self setupArticleView];
    
    
    //设置尾部试图
    [self setBottomView];



}


- (void)setupDefault{

    self.header.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:self.header];
    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(kAdaptedHeight(10));
        make.left.equalTo(self.contentView.mas_left).offset(kAdaptedWidth(10));
        make.right.equalTo(self.contentView.mas_right).offset(kAdaptedWidth(-10));
        //make.bottom.equalTo(self.contentView.mas_bottom).mas_offset(-10);
    }];

}

- (void)setupArticleView{

    [self.contentView addSubview:self.centerView];
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.header.mas_bottom);
        make.left.equalTo(self.contentView.mas_left).offset(kAdaptedWidth(10));
        make.right.equalTo(self.contentView.mas_right).mas_offset(-kAdaptedWidth(10));
//        make.bottom.equalTo(self.contentView.mas_bottom).mas_offset(-10);
    }];

}

- (void)setBottomView{
    
    [self.contentView addSubview:self.messageBottomView];
    [self.messageBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.centerView.mas_bottom);
        make.left.equalTo(self.contentView.mas_left).mas_offset(kAdaptedWidth(10));
        make.right.equalTo(self.contentView.mas_right).mas_offset(-kAdaptedWidth(10));
//        make.height.mas_equalTo(kAdaptedWidth(30));;
        make.bottom.equalTo(self.contentView.mas_bottom).mas_offset(-5);
    }];
    
    

    LWLog(@"xxxxx");
}

- (void)configCellWithCellModel:(HTMessageCellModel *)model{
    _messageCellModel = model;
    
    
//MessgaeNutritionistExpire | MessgaeUserBecomeAgent MessgaeAgentMoneyNotEnough
    
    
    [self updateCell];
}


- (void)updateCell{

#warning luohaibo
    [self.header configArticleView:self.messageCellModel];
    
    
    [self.centerView configArticleView:self.messageCellModel];
    
    
    
    [self.messageBottomView configArticleView:self.messageCellModel];
    
//    [self.headView sd_setImageWithURL:[NSURL URLWithString:self.htArticleModel.article.logo]];
//    self.iTitleLabel.text = self.htArticleModel.article.Title;
//    self.contextlabel.text = self.htArticleModel.article.Content;
//    [self getHeight:self.htArticleModel.article.Content];



//    NSString * contentString = [self.htArticleModel stringForCoreText];
//    self.contextlabel.text =  contentString;
//    [self.contextlabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo( [self calculateContentLabelHeight]);
//        //make.height.mas_equalTo(self.cellModel.textLayout.textBoundingSize.height);
//    }];

    //配置中间视图
//    [self.centerView configArticleView:self.htArticleModel];
//
//
//
//    LWLog(@"xxxxxx");
//
//    //更新文字
//    [self.htArticleBottomTitleView configArticleView:self.htArticleModel];
//
//
//    [self.htArticleMenuView configArticleView:self.htArticleModel withDelegate:self];

}






@end
