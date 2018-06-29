//
//  TiXianFooterView.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/20.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TiXianFooterViewDelegate <NSObject>


- (void)TiXianListClick;

//提现点击
- (void)TiXianBtnClick;

@end

@interface TiXianFooterView : UIView


@property (nonatomic,strong) id <TiXianFooterViewDelegate> delegate;

@end
