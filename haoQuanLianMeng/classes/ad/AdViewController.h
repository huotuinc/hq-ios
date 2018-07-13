//
//  AdViewController.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AdViewControllerDelegate <NSObject>


- (void)btnClick:(NSString * )url;

@end



@interface AdViewController : UIView

- (void)show;


- (void)close;


@property (nonatomic,weak) id <AdViewControllerDelegate> delegate;

- (void)configureImageUrl:(NSString *)imageUrl andGoUrl:(NSString *)goUrl;

@end
