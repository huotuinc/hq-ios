//
//  DaoJishiView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/4.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "DaoJishiView.h"
#import "DaoJishiTopView.h"
#import "HomeRowTableViewCell.h"




@interface DaoJishiView ()


@property(nonatomic,strong) NSArray <HomeProduct *> * products;

@property (nonatomic,copy) NSString * time;


@property(nonatomic,strong) DaoJishiTopView * daoJishiTopView;


@end


@implementation DaoJishiView


+ (instancetype)DaoJishiViewShare:(NSString *)time andProduct:(NSArray <HomeProduct *>*)products{
    CGFloat height = kAdaptedHeight(89) + (products.count == 1 ? kAdaptedHeight(120) : kAdaptedHeight(120) * 2 + 18);
    DaoJishiView * view =  [[self alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, height)];
    view.products = products;
    view.time = time;
    return view;
}



- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       [self setUpInit];
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    
}


- (void)setProducts:(NSArray<HomeProduct *> *)products{
    _products = products;
    for (int i = 0; i < self.products.count; i++) {
        HomeRowTableViewCell * cell =  [[HomeRowTableViewCell alloc] init];
        CGFloat height = CGRectGetMaxY(self.daoJishiTopView.frame) + (kAdaptedHeight(120) + 18) * i;
        cell.frame = CGRectMake(0, height, KScreenWidth, kAdaptedHeight(120));
        [self addSubview:cell];
    }
}
- (void)setUpInit {

    DaoJishiTopView * top = [[DaoJishiTopView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(89))];
    _daoJishiTopView = top;
//    _daoJishiTopView.backgroundColor = [UIColor redColor];
    top.time = @"12312313123123";
    [self addSubview:top];

}


- (CGFloat)getHeight{

    CGFloat height = kAdaptedHeight(89) + (self.products.count == 1 ? kAdaptedHeight(120) : kAdaptedHeight(120) * 2 + 18);
    return height;
}


@end
