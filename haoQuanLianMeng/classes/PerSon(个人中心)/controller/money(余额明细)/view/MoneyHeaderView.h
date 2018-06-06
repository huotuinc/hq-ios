//
//  MoneyHeaderView.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MoneyHeaderViewDelegate <NSObject>

- (void)moneyHeaderViewChangeMoney;

@end


@interface MoneyHeaderView : UIView

@property (nonatomic, weak) id <MoneyHeaderViewDelegate> delegate;


//获取高度
- (CGFloat)getHeight;
@end
