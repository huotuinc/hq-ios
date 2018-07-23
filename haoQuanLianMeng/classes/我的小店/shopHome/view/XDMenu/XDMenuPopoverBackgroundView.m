//
//  PopoverBackgroundView.m
//  TestPresentationController
//
//  Created by 李信达 on 2018/3/28.
//  Copyright © 2018年 李信达. All rights reserved.
//

#import "XDMenuPopoverBackgroundView.h"

#define kArrowBase 15.0f
#define kArrowHeight 10.0f
#define kBorderInset 8.0f
#define kZRColor_MenuBackColor kCOLOR_HEX(0x3d3d3d)
#define kCOLOR_HEX(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]
@implementation XDMenuPopoverBackgroundView
@synthesize arrowDirection  = _arrowDirection;
@synthesize arrowOffset     = _arrowOffset;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (CGFloat)arrowBase
{
    return kArrowBase;
}
+ (CGFloat)arrowHeight
{
    return kArrowHeight;
}
+ (UIEdgeInsets)contentViewInsets
{
    return UIEdgeInsetsMake(0, kBorderInset, kBorderInset,kBorderInset);
}
+(BOOL)wantsDefaultContentAppearance{
    return NO;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        UIImageView *arrowImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.arrowImageView = arrowImageView;
        [self addSubview:self.arrowImageView];
        
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize arrowSize = CGSizeMake([[self class] arrowBase], [[self class] arrowHeight]);
    self.arrowImageView.image = [self drawArrowImage:arrowSize];
    self.arrowImageView.frame = CGRectMake(((self.bounds.size.width - arrowSize.width) -kBorderInset*2.3), 0, arrowSize.width, arrowSize.height);
    self.layer.shadowOpacity = 0.0f;
}
- (UIImage *)drawArrowImage:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor clearColor] setFill];
    CGContextFillRect(ctx, CGRectMake(0.0f, 0.0f, size.width, size.height));
    CGMutablePathRef arrowPath = CGPathCreateMutable();
    CGPathMoveToPoint(arrowPath, NULL, (size.width/2.0f), 0.0f);
    CGPathAddLineToPoint(arrowPath, NULL, size.width, size.height);
    CGPathAddLineToPoint(arrowPath, NULL, 0.0f, size.height);
    CGPathCloseSubpath(arrowPath);
    CGContextAddPath(ctx, arrowPath);
    CGPathRelease(arrowPath);
    UIColor *fillColor = kZRColor_MenuBackColor;
    CGContextSetFillColorWithColor(ctx, fillColor.CGColor);
    CGContextDrawPath(ctx, kCGPathFill);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
