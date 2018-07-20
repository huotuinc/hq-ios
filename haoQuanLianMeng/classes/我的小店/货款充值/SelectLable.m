//
//  SelectLable.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "SelectLable.h"

@implementation SelectLable

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.layer.borderWidth = .8;
    self.layer.cornerRadius = 5;
}
- (void)setSelect:(int)select{
    _select = select;
    if (select) {
        self.layer.borderColor = [UIColor redColor].CGColor;
    }else{
        self.layer.borderColor = LWColor(205, 205, 205).CGColor;
    }
}

@end
