//
//  HTArticleCellModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum : NSUInteger {
    SlideTypeRenqi,
    SlideTypeReXiao,
    SlideTypeXianShiCuXiao,
    SlideTypeLiLv,
    SlideTypeXinPin,
    SlideTypeAll,
    SlideTypeDiscover
    
} SlideType;


//推广类型(0普通1图片2视频)
typedef enum : NSUInteger {
    HTArticleTypeTitle,
    HTArticleTypeMoreImage,
    HTArticleTypeVideo,
    HTArticleTypeNotKnow,
} HTArticleType;




@interface HTArticleCellModel : NSObject


//服务端返回的数据的真实数据
@property (nonatomic,strong) HTArticleModel * article;

//当前文章的分类
@property (nonatomic,assign) HTArticleType articleType;

// 当前分类
@property(nonatomic,assign) SlideType slideType;


- (instancetype)initWithSlideType:(int)selectType articleType:(HTArticleType)articleType isDiscover:(BOOL)isDiscove article:(HTArticleModel *)article;

+ (HTArticleTableViewCell *)confirmCellWithArticle:(HTArticleModel *)article isDiscover:(BOOL)isDiscove slideType:(SlideType)selectType WithTableView:(UITableView *)tableView witdDelegate:(id<HTArticleCenterViewDelegate>)delegate;



@end
