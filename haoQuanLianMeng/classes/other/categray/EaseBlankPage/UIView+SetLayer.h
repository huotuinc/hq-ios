//
//  UIView+SetLayer.h
//  XingZhang
//
//  Created by 孟辉 on 2017/3/8.
//  Copyright © 2017年 xz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SetLayer)

/**
 *  设置图层的圆角
 *
 *  @param radius 圆角弧度
 */
- (void)setLayerCornerRadius:(CGFloat)radius;



/**
 *  设置layer边框
 *
 *  @param width 边框宽度
 *  @param color 边框颜色
 */
- (void)setBorderWidth:(CGFloat)width color:(UIColor *)color;
@end

