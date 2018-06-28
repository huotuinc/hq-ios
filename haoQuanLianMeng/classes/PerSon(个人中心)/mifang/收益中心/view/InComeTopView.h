//
//  MyWalletTopView.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/15.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol InComeTopViewDelegate <NSObject>

- (void)MyWalletTopViewClick:(int)type;


@end


@interface InComeTopView : UIView


- (void)setTitle:(NSString *)title and:(BOOL)show;


@property (nonatomic,weak) id <InComeTopViewDelegate> delegate;

@end
