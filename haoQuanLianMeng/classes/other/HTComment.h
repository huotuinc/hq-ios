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
#define Production NO
#define LWLog(...) NSLog(__VA_ARGS__)
#else
#define LWLog(...)
#define Production YES
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


#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)


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

#define AppMainColor [UIColor redColor]

#define AppName @"觅方"
#define WXAppID    @"wx39f5c1402223a602" //@"wx0aba629032d0ed6c"
#define WXAPPSecret  @"17410824682424d5cb0f6d07e644774e" //@"5b09c81e595800f6d23048d4386ea373"

#define WXXiaoChenXu @"gh_711dd7acb21e"  //微信小程序原始ID
#define WXXiaoChenXuAppId @"wx461ef1c099dc8738"

//极光推送的key
#define APPJupushKey @"50752c2688d9697958a5f474"  //微信小程序原始ID

//#define WX_REFRESH_TOKEN @"wx_REFRESH_TOKEN"
//#define OPENID @"openID"

#endif /* HTComment_h */
