//
//  saveImageView.m
//  XingZhang
//
//  Created by 罗海波 on 2017/2/24.
//  Copyright © 2017年 xz. All rights reserved.
//

#import "saveImageView.h"


@interface saveImageView ()

@end

@implementation saveImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setTotal:(int)total{
    self.second.text = [NSString stringWithFormat:@"%d",total];
}
- (void)setProgress:(int)progress{
self.first.text = [NSString stringWithFormat:@"%d",progress];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    
//    self.backgroundColor =  OutFitMainColor;
    
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
}
@end
