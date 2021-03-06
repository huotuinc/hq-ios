//
//  ShopSettingInTableViewController.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/16.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ShopSettingDelegate <NSObject>


- (void)ShopInfo:(int)type withContent:(NSString *)content;


@end



@interface ShopSettingInTableViewController : UIViewController


//类型 0店铺头像1店铺名称2分享标题3分享内容

@property (nonatomic,assign) int type;

@property (nonatomic,copy) NSString * titleTT;


@property (nonatomic,weak) id <ShopSettingDelegate> delegate;



@end
