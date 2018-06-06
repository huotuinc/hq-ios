//
//  PHHeadCenterDown.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/1.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PHHeadCenterDownDelegate <NSObject>

// 0 昨日  1 今日  2 累计
- (void)PHHeadCenterDownClick:(int)type;

@end


@interface PHHeadCenterDown : UIView

@property (nonatomic,weak) id <PHHeadCenterDownDelegate> delegate;

@end
