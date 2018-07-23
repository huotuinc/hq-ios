//
//  HTArticleCellModel.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTArticleCellModel.h"
#import "HTPhoneTableViewCell.h"
#import "HTViedoTableViewCell.h"
#import "HTTitleViewCell.h"


@interface HTArticleCellModel ()



@end

@implementation HTArticleCellModel



- (instancetype)initWithSlideType:(int)selectType articleType:(HTArticleType)articleType isDiscover:(BOOL)isDiscove article:(HTArticleModel *)article{
    self = [super init];
    if (self) {
        self.articleType = articleType;
        self.article = article;
    }
    return self;
    
}


+ (HTArticleTableViewCell *)confirmCellWithArticle:(HTArticleModel *)article isDiscover:(BOOL)isDiscove slideType:(SlideType)selectType WithTableView:(UITableView *)tableView witdDelegate:(id<HTArticleCenterViewDelegate>)delegate{
    HTArticleType type = [self configArticleTypeWithArticle:article];
    HTArticleCellModel * cellModel = [[self alloc] initWithSlideType:selectType articleType:type isDiscover:isDiscove article:article];
    HTArticleTableViewCell * cell = nil;
    switch (type) {
        case HTArticleTypeTitle:
            cell = (HTArticleTableViewCell *)[HTTitleViewCell cellGetTableView:tableView];
            break;
        case HTArticleTypeMoreImage:
            cell = (HTArticleTableViewCell *)[HTPhoneTableViewCell cellGetTableView:tableView];
            break;
        case HTArticleTypeVideo:
            cell = (HTArticleTableViewCell *)[HTViedoTableViewCell cellGetTableView:tableView];
            break;
        default:
            cell = (HTViedoTableViewCell *)[HTViedoTableViewCell cellGetTableView:tableView];
            break;
    }
    cell.delegate = delegate;
    [cell configCellWithCellModel:cellModel];
    
    return cell;
    
}



//服务端转换的数据进行本地化转换
+ (HTArticleType)configArticleTypeWithArticle:(HTArticleModel *)article{
    //为什么要转化防止服务器改变游戏规则  但是转化之后XZArticleType的游戏规则就是我们自己定  如果他改变游戏规则 我们可以改这个config
    
    //int    0:普通 1:图片 2:视频

    switch (article.Type) {
        case 0:
            return HTArticleTypeTitle;
        case 1:
            return HTArticleTypeMoreImage;
        case 2:
            return  HTArticleTypeVideo;
        default:
            return HTArticleTypeNotKnow;
    }
}
@end
