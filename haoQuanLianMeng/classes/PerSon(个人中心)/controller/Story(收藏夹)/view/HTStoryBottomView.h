//
//  HTStoryBottomView.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/6.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HTStoryBottomViewDelegate <NSObject>

- (void)shareClick;
@end


@interface HTStoryBottomView : UIView


- (void)setNumber:(int)num;


@property (nonatomic,weak) id <HTStoryBottomViewDelegate> delegate;


@end
