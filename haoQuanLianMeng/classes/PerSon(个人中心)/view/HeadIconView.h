//
//  HeadIconView.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/1.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeadIconViewDelegate <NSObject>



- (void)HeadIconViewSetClick;

@end

@interface HeadIconView : UIView


@property (nonatomic,weak) id <HeadIconViewDelegate> delegate;


- (CGFloat) getHeight;

@end
