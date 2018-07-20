//
//  HTUserModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/29.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * App 用户数据模型数据
 */
@interface HTUserModel : NSObject

@property (nonatomic,copy) NSString  * nickName;
@property (nonatomic,copy) NSString  * token;
@property (nonatomic,copy) NSString  * userHead;
@property (nonatomic,assign) int userId;

@property (nonatomic,assign) int bindedMobile;
//是否开启快捷支付
@property (nonatomic,assign) int paySwichStudent;


@property (nonatomic,copy) NSString  * mobile;
@property (nonatomic,assign) int userRoleType;
@property (nonatomic,copy) NSString  * userRoleName;




@end
