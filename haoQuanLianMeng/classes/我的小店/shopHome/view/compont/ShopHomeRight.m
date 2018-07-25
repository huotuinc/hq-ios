//
//  ShopHomeRight.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ShopHomeRight.h"

@interface ShopHomeRight ()

@property (nonatomic,strong) UIImageView * icon;

@property (nonatomic,strong) UILabel * red;
@end

//static NSString * t;


@implementation ShopHomeRight



- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        _icon.image = [UIImage imageNamed:@"shopMore"];
    }
    return _icon;
}

- (UILabel *)red{
    if (_red == nil) {
        _red = [[UILabel alloc] init];
        _red.backgroundColor = [UIColor redColor];
    }
    return _red;
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.icon];
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.mas_equalTo(self.mas_top).mas_offset(5);
            make.right.mas_equalTo(self.mas_right).mas_offset(-5);
            make.left.mas_equalTo(self.mas_left).mas_offset(5);
            make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-5);
        }];
        
        [self addSubview:self.red];
        [self.red mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(4);
            make.left.mas_equalTo(self.icon.mas_right).mas_offset(2);
            make.bottom.mas_equalTo(self.icon.mas_top).mas_offset(5);
        }];
        
        self.red.layer.cornerRadius = 2;
        self.red.layer.masksToBounds = YES;
        
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"redICon"] boolValue]) {
           self.red.hidden = YES;
        }
        
//        if ([[NSUserDefaults standardUserDefaults]forKey:@"redICon"];) {
//            self.red.hidden = YES;
//        }
    }
    return self;
}

- (void)setredHidden{
    
    [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"redICon"];
    self.red.hidden = YES;
}

@end
