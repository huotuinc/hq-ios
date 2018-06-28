//
//  HTArticleModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTArticleCenterViewDelegate.h"


@interface HTArticleModel : NSObject

//文章类型
@property (nonatomic,assign) int Type;
//数据ID
@property (nonatomic,assign) int dataId;
//素材号名称
@property (nonatomic,strong) NSString  * name;
//素材号logo
@property (nonatomic,strong) NSString  * logo;
//标题
@property (nonatomic,strong) NSString  * Title;
//内容
@property (nonatomic,strong) NSString  * Content;
@property (nonatomic,strong) NSArray * ImageUrls;
@property (nonatomic,strong) NSArray * SmallImageUrls;
@property (nonatomic,strong) NSArray * VideoUrls;
@property (nonatomic,strong) NSArray * VideoPictureUrls;
@property (nonatomic,strong) NSString  * ShareTitle;
@property (nonatomic,strong) NSString  * ShareImage;
@property (nonatomic,strong) NSString  * ShareDescription;
@property (nonatomic,assign) int GoodsId;
@property (nonatomic,assign) int TurnAmount;
@property (nonatomic,strong) NSString  * Time;
@property (nonatomic,strong) NSNumber * Profit;

@end
