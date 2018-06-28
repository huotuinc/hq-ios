//
//  HTMessageCellModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTMessageCellModel : NSObject

//服务端返回的数据的真实数据
@property (nonatomic,strong) HTArticleModel * article;

//当前文章的分类
@property (nonatomic,assign) HTArticleType articleType;

// 当前分类
@property(nonatomic,assign) SlideType slideType;



- (instancetype)initWithSlideType:(int)selectType articleType:(HTArticleType)articleType  article:(HTArticleModel *)article;

+ (HTArticleTableViewCell *)confirmCellWithArticle:(HTArticleModel *)article  slideType:(SlideType)selectType WithTableView:(UITableView *)tableView witdDelegate:(id<HTArticleCenterViewDelegate>)delegate;



@end
