//
//  PHHeadDownDownView.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/1.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PHHeadDownDownViewDelegate <NSObject>

- (void)PHHeadDownDownViewClick:(int)type;

@end


@interface PHHeadDownDownView : UIView


@property (nonatomic,assign) id <PHHeadDownDownViewDelegate> delegate;

+ (instancetype)PHHeadDownDownViewShare;

@end
