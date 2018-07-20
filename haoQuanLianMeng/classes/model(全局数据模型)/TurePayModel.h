//
//  TurePayModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/18.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TurePayModel : NSObject


@property (nonatomic,strong) NSString * payType;
@property (nonatomic,strong) NSString * WxAppId;
@property (nonatomic,strong) NSString * WxAppMchId;
@property (nonatomic,strong) NSString * PrepayId;
@property (nonatomic,strong) NSString * UnionOrderId;

//"payType":0,
//"WxAppId":"11223",
//"WxAppMchId":"2323",
//"PrepayId":"32323",
//"UnionOrderId":"3248497239472"



@end
