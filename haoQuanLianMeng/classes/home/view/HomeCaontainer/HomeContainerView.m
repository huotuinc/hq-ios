//
//  HomeContainerView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/4.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HomeContainerView.h"
#import "HomeBannerView.h"
#import "HomeFourItem.h"
#import "HomeRowTableViewCell.h"
#import "FeedFocusonTableViewCell.h"
#import "DaoJishiView.h"
#import "HomeProduct.h"
#import "RowItemContainView.h"
#import "FocusonViewCollectionViewCell.h"
//倒计时试图






@interface HomeContainerView ()<SDCycleScrollViewDelegate>

@property (nonatomic,strong) HomeBannerView  * homeBannerView;

@property (nonatomic,strong) HomeFourItem * homeFourItem;

@property (nonatomic,strong) DaoJishiView * daoJisShiView;

@property (nonatomic,strong) RowItemContainView * rowItemContainView;



@property (nonatomic,strong) NSMutableArray  * mySubViews;;

@end


@implementation HomeContainerView


- (NSMutableArray *)mySubViews{
    if (_mySubViews == nil) {
        _mySubViews = [NSMutableArray array];
    }
    return _mySubViews;
}

- (HomeFourItem *)homeFourItem{
    if (_homeFourItem == nil) {
        _homeFourItem = [[HomeFourItem alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.homeBannerView.frame) + 10, KScreenWidth, kAdaptedHeight(212))];
    }
    return _homeFourItem;
}


- (HomeBannerView *)homeBannerView{
    if (_homeBannerView == nil) {
        _homeBannerView = [HomeBannerView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenWidth * 0.5) delegate:self placeholderImage:nil];
        _homeBannerView.autoScrollTimeInterval = 3.0f;
    }
    return _homeBannerView;
}



+ (instancetype)HomeContainerViewShare{

    return  [[self alloc] init];
}


- (instancetype)init {
    if (self = [super init]){
        [self setUpInit];
    }
    return self;
}

- (void)setUpInit {

    [self addSubview:self.homeBannerView];

    [self.mySubViews addObject:self.homeBannerView];


    [self addSubview:self.homeFourItem];

    [self.mySubViews addObject:self.homeFourItem];

    _daoJisShiView = [DaoJishiView DaoJishiViewShare:@"112313123123123" andProduct:@[[[HomeProduct alloc] init],[[HomeProduct alloc] init]]];
    [self addSubview:self.daoJisShiView];
    _daoJisShiView.frame = CGRectMake(0, CGRectGetMaxY(self.homeFourItem.frame), KScreenWidth, [_daoJisShiView getHeight]);
    [self.mySubViews addObject:self.daoJisShiView];


    
    UIView * la =  [self.mySubViews lastObject];
    
    
    
    
    _rowItemContainView = [[RowItemContainView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(la.frame), KScreenWidth, kAdaptedHeight(145 * 0.5) + kAdaptedHeight(290 * 0.5) + kAdaptedHeight(169 * 0.5))];
    [self addSubview:self.rowItemContainView];
    
    
    
    self.frame = CGRectMake(0, 0, KScreenWidth, CGRectGetMaxY(_rowItemContainView.frame));

}




@end
