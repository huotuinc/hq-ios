//
//  AccountList.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountList : NSObject

/*
AccountId = 15;
AccountInfo = "\U94f6\U884c\U5361-622202****8888";
IsDefault = 0;
RealName = "\U674e\U56db";
*/

@property (nonatomic,assign) int AccountId;
@property (nonatomic,copy) NSString * AccountInfo;
@property (nonatomic,copy) NSString * RealName;
@property (nonatomic,assign) int IsDefault;
@end
