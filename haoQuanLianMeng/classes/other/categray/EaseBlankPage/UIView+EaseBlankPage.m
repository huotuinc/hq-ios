//
//  UIView+EaseBlankPage.m
//  XingZhang
//
//  Created by 孟辉 on 2017/3/8.
//  Copyright © 2017年 xz. All rights reserved.
//

#import "UIView+EaseBlankPage.h"
#import <objc/runtime.h>

static char BlankPageViewKey;

@implementation UIView(EaseBlankPage)

- (void)setBlankPageView:(XZEaseBlankPageView *)blankPageView{
    [self willChangeValueForKey:@"BlankPageViewKey"];
    objc_setAssociatedObject(self, &BlankPageViewKey,
                             blankPageView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"BlankPageViewKey"];
}

- (XZEaseBlankPageView *)blankPageView{
    return objc_getAssociatedObject(self, &BlankPageViewKey);
}
- (void)showEmptyView{
    [self configBlankPage:EaseBlankPageTypeNoButton hasData:false hasError:false reloadButtonBlock:nil];
}

- (void)dissmissEmptyView
{
    [self configBlankPage:EaseBlankPageTypeNoButton hasData:YES hasError:false reloadButtonBlock:nil];
}

- (void)showEmptyViewClickImageViewBlock:(void(^)(id sender))block{
    [self configBlankPage:EaseBlankPageTypeNoButton hasData:false hasError:false reloadButtonBlock:block];

}
- (void)showshowNoNetViewClickImageViewBlock:(void(^)(id sender))block;
{
    [self configBlankPage:EaseBlankPageTypeView hasData:false hasError:true reloadButtonBlock:block];

}
- (void)configBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id))block{
    if (hasData) {
        if (self.blankPageView) {
            self.blankPageView.hidden = YES;
            [self.blankPageView removeFromSuperview];
        }
    }else{
        if (!self.blankPageView) {
            self.blankPageView = [[XZEaseBlankPageView alloc] initWithFrame:self.bounds];
        }
        self.blankPageView.hidden = NO;
        [self.blankPageContainer addSubview:self.blankPageView];
        
        [self.blankPageView configWithType:blankPageType hasData:hasData hasError:hasError reloadButtonBlock:block];
    }
}

- (UIView *)blankPageContainer{
    UIView *blankPageContainer = self;
    for (UIView *aView in [self subviews]) {
        if ([aView isKindOfClass:[UITableView class]]) {
            blankPageContainer = aView;
        }
    }
    return blankPageContainer;
}
@end
