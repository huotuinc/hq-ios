//
//  QuanDetailTitleView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/1.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "QuanDetailTitleView.h"

@interface QuanDetailTitleView()

@property (nonatomic,strong) UILabel * titleLablel;

@property (nonatomic,strong) UILabel * oldPriceLablel;

@property (nonatomic,strong) UILabel * selleredLablel;

@property (nonatomic,strong) UIImageView * iconView;

@property (nonatomic,strong) UILabel * currentPriceLablel;


@property (nonatomic,strong) UIView * quanView;


@property (nonatomic,strong) UILabel *valuLable;

@property (nonatomic,strong) UILabel * userLable;


@property (nonatomic,strong) UIImageView * bkImage;

@end


@implementation QuanDetailTitleView


- (UILabel *)valuLable{
    if (_valuLable == nil) {
        _valuLable = [[UILabel alloc] init];
        _valuLable.textColor = LWColor(235, 22, 32);
        _valuLable.text = @"¥ 5元优惠券";
        _valuLable.textAlignment = NSTextAlignmentCenter;
    }
    return _valuLable;
}

- (UILabel *)userLable{
    if (_userLable == nil) {
        _userLable = [[UILabel alloc] init];
        _userLable.textColor = LWColor(159, 159, 159);
        _userLable.font = kAdaptedFontSize(11);
        _userLable.text = @"使用期限: 2018.10.01-2019.10.31";
        _userLable.textAlignment = NSTextAlignmentCenter;
    }
    return _userLable;
}


- (UIView *)quanView{
    if (_quanView == nil) {
        _quanView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, KScreenWidth - 30, kAdaptedHeight(80))];
//        _quanView.backgroundColor = [UIColor redColor];
        UIImageView * bk = [[UIImageView alloc] init];
        _bkImage = bk;
        bk.contentMode = UIViewContentModeScaleAspectFill;
        bk.image = [UIImage imageNamed:@"quanCenterBK"];
        bk.frame = self.quanView.bounds;
        [_quanView addSubview:bk];
//        _quanView.backgroundColor = [UIColor lightGrayColor];
//        _quanView.backgroundColor = [UIColor colorWithPatternImage:<#(nonnull UIImage *)#>]
    }
    return _quanView;
}

- (UILabel *)titleLablel{
    if (_titleLablel == nil) {
        _titleLablel = [[UILabel alloc] init];
        _titleLablel.text = @"夏季男士五分裤夏季男士五分裤夏季男士五分裤夏季男士五分裤夏季男士五分裤夏季男士五分裤夏季男士五分裤夏季男士五分裤夏季男士五分裤夏季男士五分裤";
        _titleLablel.numberOfLines = 2;
        _titleLablel.font = kAdaptedFontSize(15);
        _titleLablel.textColor = LWColor(61, 61, 61);
    }
    return _titleLablel;
}

- (UILabel *)oldPriceLablel{
    if (_oldPriceLablel == nil) {
        _oldPriceLablel = [[UILabel alloc] init];
        _oldPriceLablel.text = @"¥ 0元";
        _oldPriceLablel.textColor = LWColor(146, 146, 146);
        _oldPriceLablel.font = kAdaptedFontSize(13);
    }
    return _oldPriceLablel;
}

- (UILabel *)selleredLablel{
    if (_selleredLablel == nil) {
        _selleredLablel = [[UILabel alloc] init];
        _selleredLablel.text = @"销量 10000 件";
        _selleredLablel.textAlignment = NSTextAlignmentRight;
        _selleredLablel.font = kAdaptedFontSize(13);
        _selleredLablel.textColor = LWColor(146, 146, 146);
    }
    return _selleredLablel;
}

- (UILabel *)currentPriceLablel{
    if (_currentPriceLablel == nil) {
        _currentPriceLablel = [[UILabel alloc] init];
        _currentPriceLablel.text = @"¥ 0元";
        _currentPriceLablel.textColor = LWColor(235, 22, 32);
    }
    return _currentPriceLablel;
}

- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"quan"];
    }
    return _iconView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpinit];
    }
    return self;
}


- (CGSize)caclu:(int)font{
    NSString *titleContent = @"亲，欢迎您";
    CGSize titleSize = [titleContent boundingRectWithSize:CGSizeMake(KScreenWidth - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:kAdaptedFontSize(font)} context:nil].size;
    return titleSize;
}

- (void)setUpinit{
    
    CGFloat  margin = 15;
    self.titleLablel.frame = CGRectMake(margin, 16, KScreenWidth - 2 * margin, [self caclu:15].height * 2);
    [self addSubview:self.titleLablel];
    
    self.oldPriceLablel.x = 15;
    self.oldPriceLablel.y = 15;
    
    
  
    self.oldPriceLablel.frame = CGRectMake(margin, CGRectGetMaxY(self.titleLablel.frame) + kAdaptedHeight(15), 100, [self caclu:11].height);
    [self addSubview:self.oldPriceLablel];
    
    
    
    
    self.selleredLablel.frame = CGRectMake(CGRectGetMaxX(self.oldPriceLablel.frame), CGRectGetMaxY(self.titleLablel.frame) + kAdaptedHeight(15), CGRectGetMaxX(self.titleLablel.frame) -   CGRectGetMaxX(self.oldPriceLablel.frame), [self caclu:11].height);
    [self addSubview:self.selleredLablel];
    
    
    
    self.iconView.frame = CGRectMake(margin, CGRectGetMaxY(self.oldPriceLablel.frame)+ kAdaptedHeight(16), kAdaptedHeight(49), kAdaptedHeight(20));
    [self addSubview:self.iconView];
    
    
    [self addSubview:self.currentPriceLablel];
    [self.currentPriceLablel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.iconView.mas_centerY);
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(5);
    }];
    
    
    CGRect fm = self.quanView.frame;
    fm.origin.y =  CGRectGetMaxY(self.iconView.frame) + 10;
    self.quanView.frame = fm;
    [self addSubview:self.quanView];
    
    
    self.valuLable.frame = CGRectMake(0, 0, self.quanView.size.width * 0.65, self.quanView.size.height * 0.65);
    [self.quanView addSubview:self.valuLable];
//    [self.quanView insertSubview:self.valuLable aboveSubview:self.bkImage];
//    [self.valuLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self.quanView.centerY);
//        make.centerX.mas_equalTo(self.quanView.centerX).multipliedBy(2.0/3);
//    }];
    
    self.userLable.frame = CGRectMake(0, CGRectGetMaxY(self.valuLable.frame) - 5, self.quanView.size.width * 0.65, self.quanView.size.height * 0.35);
    [self.quanView addSubview:self.userLable];
    
//    [self.quanView insertSubview:self.userLable aboveSubview:self.bkImage];
//    [self.userLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self.quanView.centerY);
//        make.top.mas_equalTo(self.valuLable.mas_bottom);
//    }];
    
    self.height = CGRectGetMaxY(self.quanView.frame) + 5;
}

@end
