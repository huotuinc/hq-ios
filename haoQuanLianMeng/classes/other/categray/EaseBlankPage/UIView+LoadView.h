//
//  UIView+LoadView.h
//  XingZhang
//
//  Created by 孟辉 on 2017/3/8.
//  Copyright © 2017年 xz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZLoadView.h"

@interface UIView (LoadView)

@property (strong, nonatomic) XZLoadView* loadView;

- (void)showLoadDefaultView;
- (void)showLoadDefaultView:(NSString *)text;
- (void)dissmissLoadView;
@end
