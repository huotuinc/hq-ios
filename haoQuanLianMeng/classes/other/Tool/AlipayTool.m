//
//  AlipayTool.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/18.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "AlipayTool.h"

@implementation AlipayTool

+(AlipayTool *)shareInstance{
    static AlipayTool *loginShare = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loginShare = [[AlipayTool alloc]init];
    });
    return loginShare;
}



@end
