//
//  ShopGoodModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/12.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopGoodModel : NSObject

//商品名称
@property (nonatomic,copy) NSString * Name;
//图片路径
@property (nonatomic,copy) NSString *PicUrl;

//商品id
@property (nonatomic,assign) int GoodsId;
//分类id
@property (nonatomic,assign) int CatId;
//库存
@property (nonatomic,assign) int Store;

//销售价
@property (nonatomic,strong) NSNumber * Price;

//市场价
@property (nonatomic,strong) NSNumber * MktPrice;


//市场价 会员价，未设置会员价该值为-1
@property (nonatomic,strong) NSNumber * UserPrice;

//EarnIntegral    int    可赚积分
@property (nonatomic,assign) int EarnIntegral;
//EarnMiBean    int    可赚觅豆
@property (nonatomic,assign) int EarnMiBean;
//IsFav    int    是否收藏
@property (nonatomic,assign) int IsFav;
//Sales    int    销量
@property (nonatomic,assign) int Sales;








@end
