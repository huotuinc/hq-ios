//
//  HomeFourItem.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/29.
//  Copyright © 2018年 HT. All rights reserved.
//  一行2列

#import <UIKit/UIKit.h>


@protocol HomeFourItemDelegate <NSObject>

- (void)HomeFourItemClick;

@end


@interface HomeFourItem : UIView

@property (nonatomic,weak) id <HomeFourItemDelegate> delegate;

@end
