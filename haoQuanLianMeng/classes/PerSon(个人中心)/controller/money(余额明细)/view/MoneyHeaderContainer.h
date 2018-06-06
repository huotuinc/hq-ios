//
//  MoneyHeaderContainer.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MoneyHeaderContainerDelegate <NSObject>

- (void)MoneyHeaderContainerChange;

@end


@interface MoneyHeaderContainer : UIView

@property (nonatomic, weak) id <MoneyHeaderContainerDelegate> delegate;


+ (instancetype)MoneyHeaderContainerShare;

@end
