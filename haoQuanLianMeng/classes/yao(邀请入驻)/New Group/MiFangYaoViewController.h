//
//  MiFangYaoViewController.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/19.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MiFangYaoViewController : UIViewController

//0 是采购  1 成为代理  2代理商
@property (nonatomic,assign) int  type;

@property (nonatomic,copy) NSString * needEnCode;

@property (nonatomic,copy) NSString * funUrl;

@end
