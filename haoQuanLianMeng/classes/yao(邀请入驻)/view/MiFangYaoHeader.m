//
//  MiFangYaoHeader.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/19.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MiFangYaoHeader.h"


@interface MiFangYaoHeader ()


@property (nonatomic,strong) UIImageView  * iconView;

@property (nonatomic,strong) UILabel * nameLable;

@property (nonatomic,strong) UILabel * levelLable;


@property (nonatomic,strong) UILabel * leftNameLable;

@property (nonatomic,strong) UILabel * leftContLable;

@property (nonatomic,strong) UILabel * rightNameLable;

//@property (nonatomic,strong) UILabel * rightCountLable;


@end



@implementation MiFangYaoHeader



- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UILabel *)nameLable{
    if (_nameLable == nil) {
        _nameLable = [[UILabel alloc] init];
        _nameLable.text = @"wl";
    }
    return _nameLable;
}

- (UILabel *)levelLable{
    if (_levelLable == nil) {
        _levelLable = [[UILabel alloc] init];
        _levelLable.text = @"营养师";
        _levelLable.textColor = [UIColor whiteColor];
        _levelLable.backgroundColor = [UIColor redColor];
        _levelLable.layer.cornerRadius = 5;
        _levelLable.layer.masksToBounds = YES;
        _levelLable.font = kAdaptedFontSize(13);
    }
    return _levelLable;
}

- (UILabel *)leftNameLable{
    if (_leftNameLable == nil) {
        _leftNameLable = [[UILabel alloc] init];
        _leftNameLable.text = @"累计\n开店收入";
        _leftNameLable.numberOfLines = 2;
//        _leftNameLable.backgroundColor = [UIColor lightGrayColor];
        _leftNameLable.font = kAdaptedFontSize(14);
    }
    return _leftNameLable;
}

- (UILabel *)leftContLable{
    if (_leftContLable == nil) {
        _leftContLable = [[UILabel alloc] init];
    }
    return _leftContLable;
}

- (UILabel *)rightNameLable{
    if (_rightNameLable == nil) {
        _rightNameLable = [[UILabel alloc] init];
        _rightNameLable.text = @"开店订单 >";
        _rightNameLable.font = kAdaptedFontSize(14);
        _rightNameLable.numberOfLines = 2;
    }
    return _rightNameLable;
}


//- (UILabel *)rightCountLable{
//    if (_rightCountLable == nil) {
//        _rightCountLable = [[UILabel alloc] init];
//    }
//    return _rightCountLable;
//}



- (instancetype)init{
    if (self = [super init]) {
        
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(kAdaptedWidth(50));
        make.top.mas_equalTo(kAdaptedWidth(10));
        make.left.mas_equalTo(kAdaptedWidth(10));
    }];
    self.iconView.layer.cornerRadius = kAdaptedWidth(50) * 0.5;
    self.iconView.layer.masksToBounds = YES;
    self.iconView.backgroundColor = [UIColor redColor];
    
    [self addSubview:self.nameLable];
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconView.mas_top).mas_offset(kAdaptedWidth(3));;
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(2);
    }];
    
    [self addSubview:self.levelLable];
    [self.levelLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLable.mas_bottom).mas_offset(3);;
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(2);
        make.height.mas_equalTo(kAdaptedWidth(20));
    }];
    
    [self addSubview:self.leftNameLable];
    [self.leftNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconView.mas_bottom).mas_offset(kAdaptedWidth(20));
        make.left.mas_equalTo(self.iconView.mas_left);
        make.height.mas_equalTo(kAdaptedWidth(40));
        
    }];
    
    [self addSubview:self.leftContLable];
    [self.leftContLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.leftNameLable.mas_top);
        make.left.mas_equalTo(self.leftNameLable.mas_right).mas_offset(kAdaptedWidth(3));
//        make.height.mas_equalTo(kAdaptedWidth(20));
        make.bottom.mas_equalTo(self.leftNameLable.mas_bottom);
    }];
    
    [self addSubview:self.rightNameLable];
    [self.rightNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.leftNameLable.mas_top).mas_offset(4);
        make.right.mas_equalTo(self.mas_right).mas_offset(-20);
        make.height.mas_equalTo(kAdaptedWidth(40));
        
    }];
    
//    [self addSubview:self.rightCountLable];
//    [self.rightCountLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.rightNameLable.mas_top);
//        make.left.mas_equalTo(self.rightNameLable.mas_right).mas_offset(kAdaptedWidth(3));
//        make.bottom.mas_equalTo(self.rightNameLable.mas_bottom);
//
//    }];
    
    
    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:@"105个"];
    
    [str addAttribute:NSFontAttributeName
                          value:kAdaptedFontSize(40)
                          range:NSMakeRange(0 , [NSString stringWithFormat:@"105个"].length - 1)];
    self.leftContLable.attributedText = str;
    
//    NSMutableAttributedString * str1 = [[NSMutableAttributedString alloc] initWithString:@"105个"];
    
//    [str1 addAttribute:NSFontAttributeName
//                value:kAdaptedFontSize(40)
//                range:NSMakeRange(0 , [NSString stringWithFormat:@"105个"].length - 1)];
//    self.rightCountLable.attributedText = str1;
    
    
}

- (CGFloat)getHeight{
    return kAdaptedWidth(10) + kAdaptedHeight(10) + kAdaptedWidth(50) + kAdaptedWidth(20) + kAdaptedWidth(20) + kAdaptedWidth(20)+kAdaptedWidth(20);
}

- (void)configure:(MiFangYaoQingModel *)model{
    
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.UserHeadImgURL]];
    self.nameLable.text = model.UserNickName;
    self.levelLable.text = model.UserLevelName;
    
    NSString * t =  [NSString stringWithFormat:@"%.2f元",model.ProfitAmount];
    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:t];
    [str addAttribute:NSFontAttributeName
                value:kAdaptedFontSize(40)
                range:NSMakeRange(0 , t.length - 1)];
    self.leftContLable.attributedText = str;
    
//    t =  [NSString stringWithFormat:@"%d个",model.SurplusNum];
//    str = [[NSMutableAttributedString alloc] initWithString:t];
//
//    [str addAttribute:NSFontAttributeName
//                 value:kAdaptedFontSize(40)
//                 range:NSMakeRange(0 , t.length - 1)];
//    self.rightCountLable.attributedText = str;
    
    
    LWLog(@"%@",model);
}

@end
