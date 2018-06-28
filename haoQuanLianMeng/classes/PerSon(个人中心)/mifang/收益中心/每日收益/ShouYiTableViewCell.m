//
//  ShouYiTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/22.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ShouYiTableViewCell.h"

@interface ShouYiTableViewCell ()

@property (nonatomic,strong) UILabel * firstleft;

@property (nonatomic,strong) UILabel * firstCenter;

@property (nonatomic,strong) UILabel * firstRight;


@property (nonatomic,strong) UILabel * secondleft;

@property (nonatomic,strong) UILabel * secondCenter;

@property (nonatomic,strong) UILabel * secondRight;

@property (nonatomic,strong) UILabel * thirdleft;

@property (nonatomic,strong) UILabel * thirdCenter;

@property (nonatomic,strong) UILabel * thirdRight;


@property (nonatomic,strong) UIView * sliederV;

@property (nonatomic,strong) UIView * sliederTV;

@property (nonatomic,strong) UIView * sliederTherdTV;


@end


@implementation ShouYiTableViewCell

- (UIView *)sliederV{
    if (_sliederV == nil) {
        _sliederV = [[UIView alloc] init];
        _sliederV.backgroundColor = [UIColor whiteColor];
    }
    return _sliederV;
}


- (UIView *)sliederTV{
    if (_sliederTV == nil) {
        _sliederTV = [[UIView alloc] init];
        _sliederTV.backgroundColor = [UIColor whiteColor];
    }
    return _sliederTV;
}

- (UIView *)sliederTherdTV{
    if (_sliederTherdTV == nil) {
        _sliederTherdTV = [[UIView alloc] init];
        _sliederTherdTV.backgroundColor = [UIColor whiteColor];
    }
    return _sliederTherdTV;
}


- (UILabel *)firstleft{
    if (_firstleft == nil) {
        _firstleft = [[UILabel alloc] init];
        _firstleft.text = @"5月1号";
        _firstleft.textAlignment = NSTextAlignmentCenter;
    }
    return _firstleft;
}

- (UILabel *)firstCenter{
    if (_firstCenter == nil) {
        _firstCenter = [[UILabel alloc] init];
        _firstCenter.text = @"订单数";
        _firstCenter.textAlignment = NSTextAlignmentCenter;
    }
    return _firstCenter;
}

- (UILabel *)firstRight{
    if (_firstRight == nil) {
        _firstRight = [[UILabel alloc] init];
        _firstRight.text = @"收益";
        _firstRight.textAlignment = NSTextAlignmentCenter;
    }
    return _firstRight;
}

- (UILabel *)secondleft{
    if (_secondleft == nil) {
        _secondleft = [[UILabel alloc] init];
        _secondleft.text = @"获取返利";
    }
    return _secondleft;
}

- (UILabel *)secondCenter{
    if (_secondCenter == nil) {
        _secondCenter = [[UILabel alloc] init];
        _secondCenter.text = @"获取返利";
    }
    return _secondCenter;
}
- (UILabel *)secondRight{
    if (_secondRight == nil) {
        _secondRight = [[UILabel alloc] init];
        _secondRight.text = @"获取返利";
    }
    return _secondRight;
}
- (UILabel *)thirdleft{
    if (_thirdleft == nil) {
        _thirdleft = [[UILabel alloc] init];
        _thirdleft.text = @"获取返利";
    }
    return _thirdleft;
}
- (UILabel *)thirdCenter{
    if (_thirdCenter == nil) {
        _thirdCenter = [[UILabel alloc] init];
        _thirdCenter.text = @"获取返利";
    }
    return _thirdCenter;
}
- (UILabel *)thirdRight{
    if (_thirdRight == nil) {
        _thirdRight = [[UILabel alloc] init];
        _thirdRight.text = @"获取返利";
    }
    return _thirdRight;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    [self.contentView addSubview:self.sliederV];
//    self.sliederV.backgroundColor = [UIColor redColor];
    [self.sliederV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.contentView.mas_top);
        make.height.mas_equalTo(kAdaptedWidth(50));
       // make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    [self.sliederV addSubview:self.firstleft];
    [self.sliederV addSubview:self.firstCenter];
    [self.sliederV addSubview:self.firstRight];

    [self.firstleft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.sliederV.mas_left);
        make.top.mas_equalTo(self.sliederV.mas_top);
        make.bottom.mas_equalTo(self.sliederV.mas_bottom);
        //make.right.mas_equalTo(self.firstCenter.mas_left);
        make.width.mas_equalTo(KScreenWidth / 3.0);
    }];

    [self.firstCenter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.firstleft.mas_right);
        make.top.mas_equalTo(self.sliederV.mas_top);
        make.bottom.mas_equalTo(self.sliederV.mas_bottom);
        //make.right.mas_equalTo(self.firstRight.mas_left);
        make.width.mas_equalTo(KScreenWidth / 3.0);
    }];

    [self.firstRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.firstCenter.mas_right);
        make.top.mas_equalTo(self.sliederV.mas_top);
        make.bottom.mas_equalTo(self.sliederV.mas_bottom);
        //make.right.mas_equalTo(self.sliederV.mas_left);
        make.width.mas_equalTo(KScreenWidth / 3.0);
    }];

    
    [self.contentView addSubview:self.sliederTV];
//    self.sliederTV.backgroundColor = [UIColor yellowColor];
    [self.sliederTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.sliederV.mas_bottom).mas_offset(1);
        make.height.mas_equalTo(kAdaptedWidth(50));

    }];
    
    [self.sliederTV addSubview:self.secondleft];
    [self.sliederTV addSubview:self.secondCenter];
    [self.sliederTV addSubview:self.secondRight];

    [self.secondleft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.sliederTV.mas_left);
        make.top.mas_equalTo(self.sliederTV.mas_top);
        make.bottom.mas_equalTo(self.sliederTV.mas_bottom);
        //make.right.mas_equalTo(self.secondCenter.mas_left);
        make.width.mas_equalTo(KScreenWidth / 3.0);
    }];

    [self.secondCenter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.secondleft.mas_right);
        make.top.mas_equalTo(self.sliederTV.mas_top);
        make.bottom.mas_equalTo(self.sliederTV.mas_bottom);
        //make.right.mas_equalTo(self.secondRight.mas_left);
        make.width.mas_equalTo(KScreenWidth / 3.0);
    }];

    [self.secondRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.secondCenter.mas_right);
        make.top.mas_equalTo(self.sliederTV.mas_top);
        make.bottom.mas_equalTo(self.sliederTV.mas_bottom);
        //make.right.mas_equalTo(self.sliederTV.mas_left);
        make.width.mas_equalTo(KScreenWidth / 3.0);
    }];
    
    
    
    
    [self.contentView addSubview:self.sliederTherdTV];
//    self.sliederTherdTV.backgroundColor = [UIColor blackColor];
    [self.sliederTherdTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.sliederTV.mas_bottom).mas_offset(1);
        make.height.mas_equalTo(kAdaptedWidth(50));
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-10);
    }];
    
    [self.sliederTherdTV addSubview:self.thirdleft];
    [self.sliederTherdTV addSubview:self.thirdCenter];
    [self.sliederTherdTV addSubview:self.thirdRight];

    [self.thirdleft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.sliederTherdTV.mas_left);
        make.top.mas_equalTo(self.sliederTherdTV.mas_top);
        make.bottom.mas_equalTo(self.sliederTherdTV.mas_bottom);
        //make.right.mas_equalTo(self.thirdCenter.mas_left);
        make.width.mas_equalTo(KScreenWidth / 3.0);
    }];

    [self.thirdCenter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.thirdleft.mas_right);
        make.top.mas_equalTo(self.sliederTherdTV.mas_top);
        make.bottom.mas_equalTo(self.sliederTherdTV.mas_bottom);
       // make.right.mas_equalTo(self.thirdRight.mas_left);
        make.width.mas_equalTo(KScreenWidth / 3.0);
    }];

    [self.thirdRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.thirdCenter.mas_right);
        make.top.mas_equalTo(self.sliederTherdTV.mas_top);
        make.bottom.mas_equalTo(self.sliederTherdTV.mas_bottom);
        //make.right.mas_equalTo(self.sliederTherdTV.mas_right);
        make.width.mas_equalTo(KScreenWidth / 3.0);
    }];

    self.backgroundColor = LWColor(242, 242, 242);
}

@end
