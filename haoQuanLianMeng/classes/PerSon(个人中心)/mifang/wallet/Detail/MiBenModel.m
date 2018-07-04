//
//  MiBenModel.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/3.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MiBenModel.h"

@implementation MiBenModel

// person.m
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"Items":@"MiBenIn",// 或者
             //             @"users":[User class],
             };
}


@end



@implementation MiBenIn


- (int)ChangeIntegral{
    return _ChangeIntegral / 100;
}
@end
