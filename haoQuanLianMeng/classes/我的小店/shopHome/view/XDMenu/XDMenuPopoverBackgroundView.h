//
//  PopoverBackgroundView.h
//  TestPresentationController
//
//  Created by 李信达 on 2018/3/28.
//  Copyright © 2018年 李信达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XDMenuPopoverBackgroundView : UIPopoverBackgroundView

@property (nonatomic, strong) UIImageView *arrowImageView;
- (UIImage *)drawArrowImage:(CGSize)size; 
@end
