//
//  HomeFourItem.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/29.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HomeFourItem.h"


#define Margin 10

@interface HomeFourItem ()

@property (nonatomic,strong) UIImageView * iconView0;

@property (nonatomic,strong) UIImageView * iconView1;

@property (nonatomic,strong) UIImageView * iconView2;

@property (nonatomic,strong) UIImageView * iconView3;


@property (nonatomic,strong) NSArray * itemArray;

@end


@implementation HomeFourItem

- (NSArray *)itemArray{
    if (_itemArray == nil) {
        _itemArray = @[self.iconView0,self.iconView1,self.iconView2,self.iconView3];
    }
    return _itemArray;
}


- (UIImageView *)iconView0{
    if (_iconView0 == nil) {
        _iconView0 = [[UIImageView alloc] init];
    }
    return _iconView0;
}


- (UIImageView *)iconView1{
    if (_iconView1 == nil) {
        _iconView1 = [[UIImageView alloc] init];
    }
    return _iconView1;
}


- (UIImageView *)iconView2{
    if (_iconView2 == nil) {
        _iconView2 = [[UIImageView alloc] init];
    }
    return _iconView2;
}


- (UIImageView *)iconView3{
    if (_iconView3 == nil) {
        _iconView3 = [[UIImageView alloc] init];
    }
    return _iconView3;
}


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        CGFloat width = (frame.size.width - 3 * Margin) * 0.5;
        CGFloat height = (frame.size.height - 3 * Margin) * 0.5;
        for (int i = 0; i < self.itemArray.count; i++) {
            UIImageView * it = [self.itemArray objectAtIndex:i];
            it.backgroundColor = [UIColor redColor];
            int col = i % 2;
            int row = i / 2;
            it.tag = i;
            it.frame = CGRectMake(Margin + (Margin + width) * col, Margin + (Margin + height) * row, width, height);
            KWeakSelf(self)
            it.userInteractionEnabled = YES;
            [it bk_whenTapped:^{
                if ([weakself.delegate respondsToSelector:@selector(HomeFourItemClick)]) {
                    [weakself.delegate HomeFourItemClick];
                }
            }];
            [self addSubview:it];
            
            self.backgroundColor = [UIColor yellowColor];
        }
    }
    return self;
}

@end
