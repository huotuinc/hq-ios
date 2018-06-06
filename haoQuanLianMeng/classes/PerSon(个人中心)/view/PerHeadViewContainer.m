//
//  PerHeadViewContainer.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/1.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "PerHeadViewContainer.h"
#import "HeadIconView.h"
#import "PHeadCenterView.h"
#import "PHHeadCenterDown.h"
#import "PHHeadDownDownView.h"


@interface PerHeadViewContainer ()<HeadIconViewDelegate
,PHHeadCenterDownDelegate,PHHeadDownDownViewDelegate>

@property (nonatomic,strong) HeadIconView * headIconView;

@property (nonatomic,strong) PHeadCenterView * pheadCenterView;

@property (nonatomic,strong) PHHeadCenterDown * phHeadCenterDown;

@property (nonatomic,strong) PHHeadDownDownView * phHeadDownDownView;

@end


@implementation PerHeadViewContainer


- (PHHeadDownDownView *)phHeadDownDownView{
    if (_phHeadDownDownView == nil) {
        _phHeadDownDownView = [PHHeadDownDownView PHHeadDownDownViewShare];
        _phHeadDownDownView.delegate = self;
    }
    return _phHeadDownDownView;
}


- (PHHeadCenterDown *)phHeadCenterDown{
    if (_phHeadCenterDown == nil) {
        _phHeadCenterDown = [[PHHeadCenterDown alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 75)];
        _phHeadCenterDown.delegate = self;
    }
    return _phHeadCenterDown;
}


- (PHeadCenterView *)pheadCenterView{
    if (_pheadCenterView == nil) {
        _pheadCenterView = [[PHeadCenterView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 45)];
    }
    return _pheadCenterView;
}

+ (instancetype) PerHeadViewContainerShare{
    
    PerHeadViewContainer * container = [[PerHeadViewContainer alloc] init];
    container.frame = CGRectMake(0, 0, KScreenWidth, [container cal]);
    return container;
}

- (HeadIconView *)headIconView{
    if (_headIconView == nil) {
        _headIconView = [[HeadIconView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenWidth * 0.5)];
        _headIconView.delegate = self;
    }
    return _headIconView;
}


- (instancetype)init{
    if (self = [super init]) {
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{

    [self addSubview:self.headIconView];
    
    
    self.pheadCenterView.y = CGRectGetMaxY(self.headIconView.frame);
    [self addSubview:self.pheadCenterView];
    
    self.phHeadCenterDown.y = CGRectGetMaxY(self.pheadCenterView.frame);
    [self addSubview:self.phHeadCenterDown];
    
    LWLog(@"%@",NSStringFromCGRect(self.phHeadDownDownView.frame));
    LWLog(@"%@",NSStringFromCGRect(self.phHeadDownDownView.frame));
    self.phHeadDownDownView.y = CGRectGetMaxY(self.phHeadCenterDown.frame);
    [self addSubview:self.phHeadDownDownView];
    
}

- (CGFloat)cal{
    
    LWLog(@"%@",NSStringFromCGRect(self.phHeadDownDownView.frame));
    LWLog(@"%f",CGRectGetMaxY(self.phHeadDownDownView.frame));
    return CGRectGetMaxY(self.phHeadDownDownView.frame);
}


- (void)HeadIconViewSetClick{
    if ([self.delegate respondsToSelector:@selector(PerHeadViewSettingClick)]) {
        [self.delegate PerHeadViewSettingClick];
    }
}


- (void)PHHeadCenterDownClick:(int)type{
    if ([self.delegate respondsToSelector:@selector(PerHeadViewContainerCenterDownClick:)]) {
        [self.delegate PerHeadViewContainerCenterDownClick:type];
    }
}


- (void)PHHeadDownDownViewClick:(int)type{
    if([self.delegate respondsToSelector:@selector(PerHeadViewOrderCenterDownClick:)]){
        [self.delegate PerHeadViewOrderCenterDownClick:type];
    }
    
}
@end
