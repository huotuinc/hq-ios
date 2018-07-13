//
//  HTMessageCellModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTMessageModel.h"

typedef enum : NSUInteger {
    MessageSlideMoren = -1,
    MessageSlideXiTong = 0,
    MessageSlideZhuCe = 1,
    MessageSlideZhiFu = 2,
} MessageSlideType;


//推广类型(0普通1图片2视频)
typedef enum : NSUInteger {
    HTProductMessage,
    HTImagetMessage,
} HTMessgaeType;



@interface HTMessageCellModel : NSObject


//服务端返回的数据的真实数据
@property (nonatomic,strong) HTMessageModel * messageModel;


//当前消息分类
@property (nonatomic,assign) HTMessgaeType articleType;


// 当前标题分类选项
@property(nonatomic,assign) MessageSlideType messageSlideType;



- (instancetype)initWithSlideType:(int)selectType articleType:(HTMessgaeType)articleType  article:(HTMessageModel *)article;

+ (UITableViewCell *)confirmCellWithArticle:(HTMessageModel *)article  slideType:(MessageSlideType)selectType WithTableView:(UITableView *)tableView witdDelegate:(id<HTArticleCenterViewDelegate>)delegate;



@end
