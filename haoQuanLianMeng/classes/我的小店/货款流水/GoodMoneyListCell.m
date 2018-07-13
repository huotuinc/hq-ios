//
//  GoodMoneyListCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "GoodMoneyListCell.h"
#import "GoodMoneyModel.h"


@interface GoodMoneyListCell ()

@property (nonatomic,strong) UILabel * rightTop;

@property (nonatomic,strong) UILabel * rightCenter;

@property (nonatomic,strong) UILabel * rightBottom;


@property (nonatomic,strong) UILabel * leftCenter;


@end


@implementation GoodMoneyListCell


- (UILabel *)rightTop{
    if (_rightTop == nil) {
        _rightTop = [[UILabel alloc] init];
    }
    return _rightTop;
}

- (UILabel *)rightCenter{
    if (_rightCenter == nil) {
        _rightCenter = [[UILabel alloc] init];
    }
    return _rightCenter;
}

- (UILabel *)rightBottom{
    if (_rightBottom == nil) {
        _rightBottom = [[UILabel alloc] init];
    }
    return _rightBottom;
}

- (UILabel *)leftCenter{
    if (_leftCenter == nil) {
        _leftCenter = [[UILabel alloc] init];
    }
    return _leftCenter;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpInit];
    }
    return self;
}

- (void)setUpInit {

    [self.contentView addSubview:self.rightTop];
    [self.rightTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(10);
    }];

    [self.contentView addSubview:self.rightCenter];
    [self.rightCenter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.rightTop.mas_right);
        make.top.mas_equalTo(self.rightTop.mas_bottom).mas_offset(5);
    }];

    [self.contentView addSubview:self.rightBottom];
    [self.rightBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.rightTop.mas_right);
        make.top.mas_equalTo(self.rightCenter.mas_bottom).mas_offset(5);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-10);
    }];

    [self.contentView addSubview:self.leftCenter];
    [self.leftCenter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(10);
        make.centerY.mas_equalTo(self.rightCenter.centerY);
    }];

}


- (void)setModel:(GoodMoneyModel *)model {
    _model = model;

    self.leftCenter.text = model.money;
    self.rightTop.text = model.memo;
    self.rightCenter.text = model.money;
    self.rightBottom.text = model.time;
}

@end
