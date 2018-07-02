//
//  UIView+EaseBlankPage.h
//  XingZhang
//
//  Created by 孟辉 on 2017/3/8.
//  Copyright © 2017年 xz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZEaseBlankPageView.h"

@interface UIView(EaseBlankPage)
#define kMBProgressHUDShowError  [MBProgressHUD showMessage:@"亲，你的网络不太顺畅喔～"];

@property (strong, nonatomic) XZEaseBlankPageView*blankPageView;
- (void)showEmptyView;
- (void)dissmissEmptyView;
- (void)showEmptyViewClickImageViewBlock:(void(^)(id sender))block;
- (void)showshowNoNetViewClickImageViewBlock:(void(^)(id sender))block;
- (void)configBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void(^)(id sender))block;
@end
