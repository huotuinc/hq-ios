//
//  WXUserModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/14.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXUserModel : NSObject


@property (nonatomic,copy) NSString  * city;
@property (nonatomic,copy) NSString  * country;
@property (nonatomic,copy) NSString  * headimgurl;
@property (nonatomic,copy) NSString  * language;
@property (nonatomic,copy) NSString  * nickname;
@property (nonatomic,copy) NSString  * openid;
@property (nonatomic,strong) NSArray  * privilege;
@property (nonatomic,assign) int sex;
@property (nonatomic,copy) NSString  * unionid;

/**
 *city = Foshan;
 country = CN;
 headimgurl = "http://wx.qlogo.cn/mmopen/vi_32/oXUy91CibcGpekG7sOB7O0icpxq7B3kv4oZyia3AA1mPPjH9qAbA8tG1Xx6WNE03vNwhyibhA7LKSBia0t5qc9dSeow/0";
 language = "zh_CN";
 nickname = "\U5929\U9053\U916c\U52e4";
 openid = o9TVB1Co3947nBNB51XfQLB7CLSg;
 privilege =     (
 );
 province = Guangdong;
 sex = 1;                 unionid = o4E2Q1fAj84mf3ziOqrVzjWbxH7I;
 *
 */


@end
