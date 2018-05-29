//
//  BaseInterface.h
//  HotTechLoan
//
//  Created by 罗海波 on 2017/11/20.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseInterface : NSObject

// 状态码
@property (nonatomic, assign) int resultCode;
// 错误信息
@property (nonatomic, strong) NSString *resultMsg;

@property (nonatomic, strong) NSDictionary * data;


- (NSString *)getDescribeD;

@end
