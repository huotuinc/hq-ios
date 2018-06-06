//
//  QuanDetailBottomView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/31.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "QuanDetailBottomView.h"

@interface QuanDetailBottomView ()


@property (weak, nonatomic) IBOutlet UIView *storeView;

@property (weak, nonatomic) IBOutlet UIImageView *storeIconView;

@property (weak, nonatomic) IBOutlet UIView *buyView;

@property (weak, nonatomic) IBOutlet UILabel *buyNow;

@property (weak, nonatomic) IBOutlet UILabel *moneyLable;

@end


@implementation QuanDetailBottomView


+ (instancetype)QuanDetailBottomViewShare{
    
   QuanDetailBottomView * frame =  [[[NSBundle mainBundle] loadNibNamed:@"QuanDetailBottomView" owner:nil options:nil] lastObject];
    frame.bounds = CGRectMake(0, 0, KScreenWidth, 88);
    return frame;
    
}

- (void)awakeFromNib{
    [super awakeFromNib];
}

@end
