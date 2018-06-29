//
//  PushWebViewController.h
//  HuoBanMallBuy
//
//  Created by lhb on 15/10/9.
//  Copyright (c) 2015年 HT. All rights reserved.
//  跳转的网页页面

#import <UIKit/UIKit.h>

@protocol WKWebViewControllerDelegate <NSObject>



@end


@interface WKWebViewController : UIViewController


/***/
@property(nonatomic,strong) NSString * funUrl;


@property(nonatomic,weak) id <WKWebViewControllerDelegate > delegate;

//是否需要编码
@property(nonatomic,assign) bool needEnCode;

@end
