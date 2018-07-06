//
//  TeamInfoModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/4.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeamInfoModel : NSObject

@property (nonatomic,assign) int  BelongOneMemberNum;
@property (nonatomic,assign) int  BelongTwoMemberNum;
@property (nonatomic,assign) int  LevelId;
@property (nonatomic,copy) NSString *  LevelName;


@end
