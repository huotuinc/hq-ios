//
//  TeamBaseView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TeamBaseView.h"
@interface TeamBaseView ()


@end


@implementation TeamBaseView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib{
    [super awakeFromNib];
    //self.selectType = 0;
    LWLog(@"xxxxxx");
}

- (void)setSelectType:(int)selectType{
    _selectType = selectType;
    
    for (int i = 0; i < self.subviews.count; i++) {
        
        LWLog(@"%@",NSStringFromClass([self.subviews[i] class]));
        if ([self.subviews[i] isKindOfClass:[UILabel class]]) {
            UILabel * t =  self.subviews[i];
            if(selectType){
                t.textColor = [UIColor redColor];
            }else{
                t.textColor = [UIColor blackColor];
            }
        }
        
    }
}

@end
