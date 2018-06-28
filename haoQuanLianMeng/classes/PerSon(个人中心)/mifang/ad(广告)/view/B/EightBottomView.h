//
//  EightBottomView.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/19.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EightBottomViewDelegate <NSObject>


- (void) EightBottomViewClickAtIndex:(NSUInteger)index;


@end



@interface EightBottomView : UIView


@property (nonatomic,weak) id <EightBottomViewDelegate> delegate;

@end
