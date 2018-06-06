//
//  RowItemContainView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/4.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "RowItemContainView.h"
#import "FeedFocusonTableViewCell.h"


@interface RowItemContainView ()


@property (nonatomic,strong) UIView * headView;


@property (nonatomic,strong) UILabel * headTitle;


@property (nonatomic,strong)  FeedFocusonTableViewCell * focusonViewCollectionViewCell;


@end


@implementation RowItemContainView

- (UILabel *)headTitle{
    if (_headTitle == nil) {
        _headTitle = [[UILabel alloc] init];
        _headTitle.text = @"品牌制造商直供";
//        _headTitle.textColor = LWColor(254, 76, 85);
        _headTitle.textAlignment = NSTextAlignmentCenter;
        _headTitle.font = kAdaptedFontSize(20);
    }
    return _headTitle;
}



- (UIView *)headView{
    if (_headView == nil) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(145* 0.5))];
        _headView.backgroundColor = [UIColor yellowColor];
    }
    return _headView;
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpInit];
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (void)setUpInit{
    
    self.headView.frame = CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(145* 0.5));
     self.headTitle.frame = CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(145* 0.5));
    [self.headView addSubview:self.headTitle];
   
//    _headTitle.center = CGPointMake(KScreenWidth * 0.5, kAdaptedHeight(145* 0.5) * 0.5);
    [self addSubview:self.headView];
    
    
    NSLog(@"%f", CGRectGetMaxY(self.headTitle.frame));
   
    _focusonViewCollectionViewCell = [[FeedFocusonTableViewCell alloc] init];
    _focusonViewCollectionViewCell.frame = CGRectMake(0, kAdaptedHeight(145* 0.5), KScreenWidth, kAdaptedHeight(290*0.5)+ kAdaptedHeight(169*0.5));
    _focusonViewCollectionViewCell.backgroundColor = [UIColor redColor];
    [self addSubview:self.focusonViewCollectionViewCell];
    
}

@end
