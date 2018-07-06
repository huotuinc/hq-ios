//
//  MFPersonHeaderView.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/14.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MiFangUserCenterModel.h"


@protocol MFPersonHeaderViewDelegate <NSObject>

- (void)MFPersonHeaderViewClick:(int)opetion;


@end


@interface MFPersonHeaderView : UIView

@property (nonatomic,weak) id <MFPersonHeaderViewDelegate> delegate;


- (instancetype)initWithFrame:(CGRect)frame withHeader:(BOOL)header;


- (void)configWithData:(MiFangUserCenterModel *)model;


- (CGFloat)getHeader;


@property (nonatomic,assign) CGFloat heightx;


- (void)refresh;

@end
