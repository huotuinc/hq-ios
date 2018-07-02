//
//  UIView+LoadView.m
//  XingZhang
//
//  Created by 孟辉 on 2017/3/8.
//  Copyright © 2017年 xz. All rights reserved.
//

#import "UIView+LoadView.h"
#import <objc/runtime.h>
static char LoadViewKey;

@implementation UIView (LoadView)
- (void)setLoadView:(XZLoadView *)loadView{

    [self willChangeValueForKey:@"LoadViewKey"];
    objc_setAssociatedObject(self, &LoadViewKey, loadView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"LoadViewKey"];
}
- (XZLoadView *)loadView
{
    return objc_getAssociatedObject(self, &LoadViewKey);
}
- (void)showLoadDefaultView{
    [self showLoadDefaultView:@"加载中..."];
}
- (void)showLoadDefaultView:(NSString *)text
{
    if (!self.loadView) {
        self.loadView = [[XZLoadView alloc] initWithFrame:self.bounds];
    }
    self.loadView.hidden = NO;
    [self addSubview:self.loadView];
    
    [self.loadView configView:text];
}

- (void)dissmissLoadView{
    self.loadView.hidden = YES;
    [self.loadView removeFromSuperview];
}
@end
