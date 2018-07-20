//
//  HTMessageCellModel.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTMessageCellModel.h"
#import "HTMessageModel.h"
#import "MessgeXiTableViewCell.h"
#import "HTMessageInModel.h"
#import "MallMessageCell.h"


@implementation HTMessageCellModel

- (instancetype)initWithSlideType:(int)selectType messageType:(HTMessgaeType)articleType  message:(id)message{
    self = [super init];
    if (self) {
        self.messageType = articleType;
        self.messageSlideType = selectType;
        self.messageModel = message;
    }
    return self;

}


- (UITableViewCell *)confirmCellWithTableView:(UITableView *)tableView withIndexPaht:(NSIndexPath *)indexPath witdDelegate:(id<HTArticleCenterViewDelegate>)delegate{
    
    LWLog(@"%lu",(unsigned long)self.messageType);

    HTMessageTableViewCell * cell = nil;
    switch (self.messageType) {
        case MessgaeMallNotice:{
            cell =  (MessgeXiTableViewCell *)[MessgeXiTableViewCell cellGetTableView:tableView];
            break;
        }
            
        case MessgaeDownMenberRegist:{
            cell =  (MallMessageCell *)[MallMessageCell cellGetTableView:tableView];
            break;
        }
            
        default:{
            cell =  (MallMessageCell *)[MallMessageCell cellGetTableView:tableView];
            break;
        }
    }
    [cell configCellWithCellModel:self];
    return cell;
    
    
    
//    HTArticleType type = [self configArticleTypeWithArticle:article];
//    HTArticleCellModel * cellModel = [[self alloc] initWithSlideType:selectType articleType:type isDiscover:isDiscove article:article];
//    HTArticleTableViewCell * cell = nil;
//    switch (type) {
//
//        case HTArticleTypeMoreImage:
//            cell = (HTArticleTableViewCell *)[ProfuctMessageCell cellGetTableView:tableView];
//            break;
//        case HTArticleTypeVideo:
//            cell = (HTArticleTableViewCell *)[ProfuctMessageCell cellGetTableView:tableView];
//            break;
//
//        default:
//            cell = (HTArticleTableViewCell *)[ProfuctMessageCell cellGetTableView:tableView];
//            break;
//    }
//    cell.delegate = delegate;
//    [cell configCellWithCellModel:cellModel];

    return nil;

}



//服务端转换的数据进行本地化转换
+ (HTArticleType)configArticleTypeWithArticle:(HTArticleModel *)article{
    //为什么要转化防止服务器改变游戏规则  但是转化之后XZArticleType的游戏规则就是我们自己定  如果他改变游戏规则 我们可以改这个config
    switch (article.Type) {
        case 0:
            return HTArticleTypeLink;
        case 1:
            return HTArticleTypeMoreImage;
        case 2:
            return HTArticleTypeVideo;
        default:
            return HTArticleTypeNotKnow;
    }
}


@end
