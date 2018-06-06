//
//  TitleView.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleView : UIView


//是否当前选中状态
@property (nonatomic,assign) BOOL  selected;



- (void)settitle:(NSString *)title;

@end
