//
//  UIView+SetLayer.m
//  XingZhang
//
//  Created by 孟辉 on 2017/3/8.
//  Copyright © 2017年 xz. All rights reserved.
//

#import "UIView+SetLayer.h"

@implementation UIView (SetLayer)
- (void)setLayerCornerRadius:(CGFloat)radius{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = true;
}
- (void)setBorderWidth:(CGFloat)width color:(UIColor *)color
{
    self.layer.borderWidth = width;
    self.layer.borderColor = [color CGColor];
}

@end
