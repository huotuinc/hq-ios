//
//  EightBottomView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/19.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "EightBottomView.h"
#import "HTPersonViewList.h"

@interface EightBottomView ()


@property (nonatomic,strong) NSMutableArray * objectArray;


@property (nonatomic,strong) NSArray * iconName;


@end



@implementation EightBottomView


- (NSArray *)iconName{
    if (_iconName == nil) {
        _iconName = @[@"收益",@"推广订单",@"我的团队",@"店主课堂",
                      @"消息",@"关于我们",@"反馈与建议",@"设置"];
    }
    return _iconName;
}

- (NSMutableArray *)objectArray{
    if (_objectArray == nil) {
        _objectArray = [NSMutableArray array];
    }
    return _objectArray;
}

- (instancetype)init{
    if (self = [super init]) {
        [self setUpInit];
    }
    return self;
}


- (void)EightBottomViewClickAtIndex:(UITapGestureRecognizer *)ges{
    
    [self.delegate EightBottomViewClickAtIndex:ges.view.tag];
}

- (void)setUpInit{
    
    for (int i = 0; i < 8; i++) {
        HTPersonViewList * view = [[HTPersonViewList alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.tag = 1000 + i;
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(EightBottomViewClickAtIndex:)];
        
        [view addGestureRecognizer:ges];
        [view setName:self.iconName[i] andIcon:[NSString stringWithFormat:@"p-%d",i]];
        [self.objectArray addObject:view];
    }
    
    CGFloat w = (KScreenWidth - 3 ) * 0.25;
    for (int i = 0; i < 8; i++){
        int col = i % 4;
        int row = i / 4;
        
        HTPersonViewList * view = self.objectArray[i];
        [self addSubview:view];
        
        if (i == 0) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.mas_left);
                make.height.mas_equalTo(kAdaptedHeight(70));
                make.top.mas_equalTo(self.mas_top);
                make.width.mas_equalTo(w);
            }];
        }else if(col==0 && row == 1){
            HTPersonViewList * viewT = self.objectArray[0];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.mas_left);
                make.height.mas_equalTo(kAdaptedHeight(70));
                make.top.mas_equalTo(viewT.mas_bottom).mas_offset(1);
                make.width.mas_equalTo(w);
                make.bottom.mas_equalTo(self.mas_bottom);
            }];
        }else{
            HTPersonViewList * viewT = self.objectArray[i-1];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(viewT.mas_right).mas_offset(1);
                make.height.mas_equalTo(viewT.mas_height);
                make.top.mas_equalTo(viewT.mas_top);
                make.width.mas_equalTo(viewT.mas_width);
                
            }];
        }
        
    }

}


@end
