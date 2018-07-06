//
//  ReusableView.m
//  PlainLayout
//
//  Created by hebe on 15/7/30.
//  Copyright (c) 2015年 ___ZhangXiaoLiang___. All rights reserved.
//

#import "ReusableView.h"
@interface ReusableView ()



@end

@implementation ReusableView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:self.bounds];
        self.label = label;
        self.label.textColor = LWColor(103, 103, 103);
        self.label.font = kAdaptedFontSize(14);
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
    }
    return self;
}


//
//-(void)setText:(NSString *)text
//{
//    _text = text;
//
//    _label.text = text;
////    ((UILabel *)self.subviews[0]).text = [NSString stringWithFormat:@"  %@",text];
//}

@end

