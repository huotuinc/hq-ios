//
//  BaseInterface.m
//  HotTechLoan
//
//  Created by 罗海波 on 2017/11/20.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "BaseInterface.h"

@implementation BaseInterface




- (NSString *)getDescribeD{
    
    switch (self.resultCode) {
        case 20000:
            return @"请求成功";
            break;
        case 50000:
            return @"系统请求失败";
            break;
        case 40000:
            return @"无效的appId和token";
            break;
        case 40001:
            return @"签名参数未传";
            break;
        case 40002:
            return @"签名错误";
            break;
        case 40003:
            return @"token失效";
            break;
        case 40061:
            return @"区域未开放";
            break;
        case 40062:
            return @"服务未开启";
            break;
        case 41101:
            return @"手机号已注册";
            break;
        case 41102:
            return @"验证码错误";
            break;
        case 41301:
            return @"联系人数据错误";
            break;
        case 41302:
            return @"联系人为空";
            break;
        case 41501:
            return @"出生日期错误";
            break;
        case 42801:
            return @"通讯录数据错误";
            break;
        case 42802:
            return @"通讯录为空";
            break;
        default:
            return @"未知错误";
            break;
    }
}
@end
