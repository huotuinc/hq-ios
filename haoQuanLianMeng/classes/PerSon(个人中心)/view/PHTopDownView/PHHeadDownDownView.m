//
//  PHHeadDownDownView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/1.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "PHHeadDownDownView.h"
#import "HTPersonViewList.h"




@interface PHHeadDownDownView ()
@property (strong, nonatomic) HTPersonViewList * htPersonViewListFirst;
@property (strong, nonatomic) HTPersonViewList * htPersonViewListSecond;
@property (strong, nonatomic) HTPersonViewList * htPersonViewListThird;
@property (strong, nonatomic) HTPersonViewList * htPersonViewListFourth;

@property (strong, nonatomic) NSArray * container;


@property (strong, nonatomic) NSArray * iconContainer;

@property (strong, nonatomic) NSArray * nameContainer;


@end


@implementation PHHeadDownDownView



- (NSArray *)iconContainer {
    if (_iconContainer == nil){
        _iconContainer = @[@"tgdd",@"wdtd",@"tdsy",@"wdzs"];
    }
    return _iconContainer;
}

- (NSArray *)nameContainer {
    if (_nameContainer == nil){
        _nameContainer = @[@"推广订单",@"我的团队",@"团队收益",@"我的钻石"];
    }
    return _nameContainer;
}



- (NSArray *)container {
    if (_container == nil){
        _container = @[self.htPersonViewListFirst,self.htPersonViewListSecond,self.htPersonViewListThird,self.htPersonViewListFourth];
    }
    return _container;
}

- (HTPersonViewList *)htPersonViewListFirst {
    if (_htPersonViewListFirst == nil){
        _htPersonViewListFirst = [[HTPersonViewList alloc] init];
    }
    return _htPersonViewListFirst;
}

- (HTPersonViewList *)htPersonViewListSecond {
    if (_htPersonViewListSecond == nil){
        _htPersonViewListSecond = [[HTPersonViewList alloc] init];
    }
    return _htPersonViewListSecond;
}

- (HTPersonViewList *)htPersonViewListThird {
    if (_htPersonViewListThird == nil){
        _htPersonViewListThird = [[HTPersonViewList alloc] init];
    }
    return _htPersonViewListThird;
}

- (HTPersonViewList *)htPersonViewListFourth {
    if (_htPersonViewListFourth == nil){
        _htPersonViewListFourth = [[HTPersonViewList alloc] init];
    }
    return _htPersonViewListFourth;
}



+ (instancetype)PHHeadDownDownViewShare{
    
   PHHeadDownDownView * header =  [[self alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 75)];
    return header;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpWith:frame];
//        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}


- (void)setUpWith:(CGRect)frame{

    CGFloat width = KScreenWidth / 4.0;
    for (int i = 0; i < self.container.count; ++i) {
        CGFloat  x = width * i;
        HTPersonViewList * view = self.container[i];
        view.tag = 1000 + i;
        UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
        view.userInteractionEnabled = YES;
        [view addGestureRecognizer:ges];
        view.frame = CGRectMake(x, 0, width, frame.size.height);
        [view setName:self.nameContainer[i] andIcon:self.iconContainer[i]];
        [self addSubview:view];
    }


}

- (void)click:(UITapGestureRecognizer *)tap{
    UIView * v = tap.view;
    if ([self.delegate respondsToSelector:@selector(PHHeadDownDownViewClick:)]) {
        [self.delegate  PHHeadDownDownViewClick:(int)(v.tag - 1000)];
    }
}

@end
