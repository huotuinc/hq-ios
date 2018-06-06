//
//  HomeIconContainer.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HomeIconContainer.h"
#import "HomeIconTitleView.h"


@interface HomeIconContainer ()


//数据模型
@property (nonatomic,strong) NSArray * dates;

@property (nonatomic,strong) NSMutableArray * UIdates;
@end


@implementation HomeIconContainer

- (NSMutableArray *)UIdates{
    if (_UIdates == nil) {
        _UIdates = [NSMutableArray array];
    }
    return _UIdates;
}

- (instancetype)initWithDatas:(NSArray *)dates{
    
    if (self = [super init]) {
        
        self.dates = dates;
        [self setUpInit];
    }
    
    return self;
}


- (void)setUpInit{
    
    CGFloat width = KScreenWidth * 0.25;
    CGFloat height = kAdaptedHeight(98);
    for (int i = 0; i < self.dates.count; i++) {
        HomeIconTitleView * home = [[HomeIconTitleView alloc] init];
        [self.UIdates addObject:home];
        
        int col = i % 4;
        int row = i / 4;
        [self addSubview:home];
        [home mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(height);
            make.width.mas_equalTo(width);
            make.top.mas_equalTo(self.mas_top).mas_offset(row * height);
            make.left.mas_equalTo(self.mas_left).mas_offset(col * width);
        }];
    }
    self.frame = CGRectMake(0, 0, KScreenWidth, (self.dates.count / 4 + 1) * height);
}
@end
