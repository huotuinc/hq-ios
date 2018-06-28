//
//  TeamHeadView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TeamHeadView.h"

@interface TeamHeadView ()
@property (weak, nonatomic) IBOutlet UIView *first;

@property (weak, nonatomic) IBOutlet UIView *second;

@property (weak, nonatomic) IBOutlet UIView *third;

@property (weak, nonatomic) IBOutlet UIView *fourth;

@property (weak, nonatomic) IBOutlet UIView *fifth;

@end


@implementation TeamHeadView

+ (instancetype)TeamHeadViewCreate{
    
   TeamHeadView * view =   [[[NSBundle mainBundle] loadNibNamed:@"TeamHeadView" owner:nil options:nil] lastObject];
    view.frame = CGRectMake(0, 0, KScreenWidth, 44);
    return view;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
