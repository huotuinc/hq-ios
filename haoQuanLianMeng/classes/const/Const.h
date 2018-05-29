//
//  Const.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/29.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Const : NSObject

typedef NS_ENUM(NSUInteger, ButtonLoadState) {
    ButtonNormal=0,
    ButtonLoading,
    ButtonUnLoading,
    ButtonComplete,
};


@end
