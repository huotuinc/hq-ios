//
//  NavRightImage.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/24.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavRightImageDelegate <NSObject>

- (void)btnRightClick;

@end


@interface NavRightImage : UIView


- (void)setTimeString:(NSString *)tt;

@property (nonatomic,weak) id <NavRightImageDelegate> delegate;

@end
