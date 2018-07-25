//
//  TuiGuangCenter.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/22.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TuiGuangCenter.h"
#import "TuiGuangModel.h"
#import "OrderItemModel.h"

@interface TuiGuangCenter ()

@property (nonatomic,strong) UIImageView  * iconView;

@property (nonatomic,strong) UILabel * leftLable;


@property (nonatomic,strong) UILabel * leftDown;


@property (nonatomic,strong) UILabel * rightLable;

@property (nonatomic,strong) UILabel * rightDownLable;


@end


@implementation TuiGuangCenter


- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}


- (UILabel *)leftLable{
    if (_leftLable == nil) {
        _leftLable = [[UILabel alloc] init];
        _leftLable.text = @"女装";
        _leftLable.textColor = LWColor(60, 60, 60);
        _leftLable.font = kAdaptedFontSize(14);
        _leftLable.numberOfLines = 2;
    }
    return _leftLable;
}

- (UILabel *)leftDown{
    if (_leftDown == nil) {
        _leftDown = [[UILabel alloc] init];
        _leftDown.text = @"女装";
        _leftDown.textColor = LWColor(60, 60, 60);
        _leftDown.font = kAdaptedFontSize(12);
        
    }
    return _leftDown;
}



- (UILabel *)rightLable{
    if (_rightLable == nil) {
        _rightLable = [[UILabel alloc] init];
        _rightLable.text = @"¥1";
        _rightLable.textAlignment = NSTextAlignmentRight;
        _rightLable.font = kAdaptedFontSize(14);
    }
    return _rightLable;
}


- (UILabel *)rightDownLable{
    if (_rightDownLable == nil) {
        _rightDownLable = [[UILabel alloc] init];
        _rightDownLable.text = @"x1";
        _rightDownLable.textColor = LWColor(160, 160, 160);
        _rightDownLable.font = kAdaptedFontSize(12);
    }
    return _rightDownLable;
}


- (instancetype)init{
    if(self = [super init]){
        
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    self.backgroundColor = LWColor(250, 250, 250);
    [self addSubview:self.iconView];
    self.iconView.backgroundColor = [UIColor redColor];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(kAdaptedWidth(60));
        make.top.mas_equalTo(self.mas_top).mas_offset(kAdaptedWidth(15));
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-kAdaptedWidth(15));
        make.left.mas_equalTo(self.mas_left).mas_offset(kAdaptedWidth(10));
    }];
    
    [self addSubview:self.leftLable];
    [self addSubview:self.rightLable];
    [self addSubview:self.leftDown];
    [self.leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconView.mas_top).mas_offset(5);
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(kAdaptedWidth(10));
        make.right.mas_equalTo(self.rightLable.mas_left).mas_offset(-2);
    }];
    [self.leftDown mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.leftLable.mas_bottom).mas_offset(2);
        make.left.mas_equalTo(self.leftLable.mas_left);
        make.right.mas_equalTo(self.leftLable.mas_right);
    }];
    
    
    
    [self.rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.leftLable.mas_centerY);
        make.right.mas_equalTo(self.mas_right).mas_offset(-kAdaptedWidth(10));
        make.width.mas_equalTo(60);
    }];
    
    [self addSubview:self.rightDownLable];
    [self.rightDownLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.rightLable.mas_bottom).mas_offset(1);
        make.right.mas_equalTo(self.rightLable.mas_right);
    }];
    
}

- (void)contigure:(TuiGuangModel *)model andIndex:(int)index{
    
    OrderItemModel * order = [model.OrderItemInfo objectAtIndex:index];
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:order.ProductImgUrl] placeholderImage:[UIImage imageNamed:@"headerMoren"]];
    self.leftLable.text = order.ProductName;
    self.leftDown.text = order.ProductSpec;
    self.rightLable.text = [NSString stringWithFormat:@"¥ %@",order.ProductPrice];
    self.rightDownLable.text = [NSString stringWithFormat:@"x%d",order.ProductNum];
}

@end
