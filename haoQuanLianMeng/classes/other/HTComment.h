//
//  HTComment.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/29.
//  Copyright © 2018年 HT. All rights reserved.
//

#ifndef HTComment_h
#define HTComment_h

#ifdef DEBUG
#define LWLog(...) NSLog(__VA_ARGS__)
#else
#define LWLog(...)
#endif


#ifndef SINGLETON_GCD
#define SINGLETON_GCD(classname)                        \
\
+ (classname *)shared##classname {                      \
\
static dispatch_once_t pred;                        \
__strong static classname * shared##classname = nil;\
dispatch_once( &pred, ^{                            \
shared##classname = [[self alloc] init]; });    \
return shared##classname;                           \
}
#endif

//弱
#define KWeakSelf(type)  __weak typeof(type) weak##type = type;


/*** 颜色 ***/
#define LWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
/*** 颜色 ***/
#define LWColorA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

/**屏幕高度*/
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height
/**屏幕宽度*/
#define KScreenWidth [[UIScreen mainScreen] bounds].size.width

#define kNavigationBar_HEIGHT ((KScreenHeight == 812.0) ? 88 : 64)
#define kStatusBar_Height  ([UIApplication sharedApplication].statusBarFrame.size.height)
#define KScreenWidthRatio  (KScreenWidth / 375.0)
#define kScreenHeightRatio (((KScreenHeight == 812 ? 667 : KScreenHeight) - 64) / 603.0)
#define kAdaptedWidth(x)  ceilf((x) * KScreenWidthRatio)
#define kAdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#define kAdaptedFontSize(R)  kCHINESE_SYSTEM(kAdaptedWidth(R))
#define kCHINESE_SYSTEM(x) [UIFont systemFontOfSize:x]



#endif /* HTComment_h */
