//
//  TeamSelectList.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeamSelectList : NSObject

@property (nonatomic,strong) NSString * title;


@property (nonatomic,strong) NSArray * itemArray;

//选中的
@property (nonatomic,assign) int select;


@end
