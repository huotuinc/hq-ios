//
//  MyWalletTopView.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/15.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MyWalletTopViewDelegate <NSObject>

- (void)MyWalletTopViewClick:(int)type;


@end


@interface MyWalletTopView : UIView


- (void)setTitle:(NSString *)title and:(BOOL)show;


@property (nonatomic,weak) id <MyWalletTopViewDelegate> delegate;

@end
