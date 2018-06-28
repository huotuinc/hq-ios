//
//  MiFangFooter.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/19.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MiFangFooter.h"

@interface MiFangFooter ()

@property (nonatomic,strong) UIButton  * btn;

@end


@implementation MiFangFooter


- (UIButton *)btn{
    if (_btn == nil) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 10, KScreenWidth - 40, 44)];
        [_btn setTitle:@"邀请好友开店" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _btn.backgroundColor = [UIColor whiteColor];
        _btn.layer.cornerRadius = 5;
        _btn.layer.masksToBounds = YES;
    }
    return _btn;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.btn];
    }
    return self;
}



@end
