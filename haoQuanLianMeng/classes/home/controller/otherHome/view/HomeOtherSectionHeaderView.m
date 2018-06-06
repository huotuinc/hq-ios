//
//  HomeOtherSectionHeaderView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HomeOtherSectionHeaderView.h"
#import "TitleView.h"

@interface HomeOtherSectionHeaderView ()

@property (nonatomic,strong) NSMutableArray * containArray;


@property (nonatomic,strong) TitleView * selectTitleView;
@end

@implementation HomeOtherSectionHeaderView



- (NSMutableArray *)containArray{
    if (_containArray == nil) {
        _containArray = [NSMutableArray array];
    }
    return _containArray;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    self.backgroundColor = [UIColor whiteColor];
    TitleView * title0 = [[TitleView alloc] init];
    [title0 settitle:@"佣金"];
    title0.selected = YES;
    self.selectTitleView = title0;
    [self.containArray addObject:title0];
    
    TitleView * title1 = [[TitleView alloc] init];
    [title1 settitle:@"销量"];
    [self.containArray addObject:title1];
    
    TitleView * title2 = [[TitleView alloc] init];
    [title2 settitle:@"最新"];
    [self.containArray addObject:title2];
    
    TitleView * title3 = [[TitleView alloc] init];
    [title3 settitle:@"价格"];
    [self.containArray addObject:title3];
    
    
    [self addSubview:title0];
    [title0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.top.mas_equalTo(self.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.width.mas_equalTo(KScreenWidth * 0.25);
    }];
    [self addSubview:title1];
    [title1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(title0.mas_right);
        make.top.mas_equalTo(self.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.width.mas_equalTo(KScreenWidth * 0.25);
    }];
    
    
    [self addSubview:title2];
    [title2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(title1.mas_right);
        make.top.mas_equalTo(self.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.width.mas_equalTo(KScreenWidth * 0.25);
    }];
    
    [self addSubview:title3];
    [title3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(title2.mas_right);
        make.top.mas_equalTo(self.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.width.mas_equalTo(KScreenWidth * 0.25);
    }];
    
    KWeakSelf(self);
    title0.userInteractionEnabled = YES;
    [title0 bk_whenTapped:^{
        if (weakself.selectTitleView == title0) {
            return;
        }else{
            weakself.selectTitleView.selected = NO;
            weakself.selectTitleView = title0;
            title0.selected = YES;
            [weakself.delegate selectItem:0];
        }
    }];
    
    title1.userInteractionEnabled = YES;
    [title1 bk_whenTapped:^{
        if (weakself.selectTitleView == title1) {
            return;
        }else{
            weakself.selectTitleView.selected = NO;
            weakself.selectTitleView = title1;
            title1.selected = YES;
            [weakself.delegate selectItem:1];
        }
    }];
    
    title2.userInteractionEnabled = YES;
    [title2 bk_whenTapped:^{
        if (weakself.selectTitleView == title2) {
            return;
        }else{
            weakself.selectTitleView.selected = NO;
            weakself.selectTitleView = title2;
            title2.selected = YES;
            [weakself.delegate selectItem:2];
        }
    }];
    
    title3.userInteractionEnabled = YES;
    [title3 bk_whenTapped:^{
        if (weakself.selectTitleView == title3) {
            return;
        }else{
            weakself.selectTitleView.selected = NO;
            weakself.selectTitleView = title3;
            title3.selected = YES;
            [weakself.delegate selectItem:3];
        }
    }];
}
@end
