//
//  AcFooterView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "AcFooterView.h"


@interface AcFooterView ()


@property (nonatomic,strong) UIButton  * btn;
@end

@implementation AcFooterView


- (UIButton *)btn{
    
    if (_btn == nil) {
        _btn = [[UIButton alloc] init];
        [_btn setTitle:@"保存" forState:UIControlStateNormal];
        _btn.layer.cornerRadius = 5;
        _btn.layer.masksToBounds = YES;
        [_btn addTarget:self.delegate action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
//        self.backgroundColor = [UIColor blueColor];
        self.btn.frame = CGRectMake(20, 20, KScreenWidth - 40, 44);
        [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.btn setBackgroundColor:[UIColor redColor]];
        [self addSubview:self.btn];
    }
    return self;
}

@end
