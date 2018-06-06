//
//  HTMoneyListTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/4.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTMoneyListTableViewCell.h"

@interface HTMoneyListTableViewCell()


@property (nonatomic,strong) UILabel * topLable;
@property (nonatomic,strong) UILabel * downLable;

@property (nonatomic,strong) UILabel * rightLable;
@end


@implementation HTMoneyListTableViewCell


- (UILabel *)topLable{
    if (_topLable == nil) {
        _topLable = [[UILabel alloc] init];
        _topLable.text = @"体现";
        _topLable.textColor = LWColor(73, 73, 73);
    }
    return _topLable;
}

- (UILabel *)downLable{
    if (_downLable == nil) {
        _downLable = [[UILabel alloc] init];
        _downLable.text = @"2019-19-10";
        _downLable.textColor = LWColor(128, 128, 128);
    }
    return _downLable;
}

- (UILabel *)rightLable{
    if (_rightLable == nil) {
        _rightLable = [[UILabel alloc] init];
        _rightLable.text = @"0.00";
    }
    return _rightLable;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){

        [self setupInit];
    }

    return self;
}

- (void)setupInit {

    [self.contentView addSubview:self.topLable];
    [self.topLable mas_makeConstraints:^(MASConstraintMaker *make) {

        make.bottom.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(30);
    }];

    [self.contentView addSubview:self.downLable];
    [self.downLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(30);
    }];

    [self.contentView addSubview:self.rightLable];
    [self.rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.centerY);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-20);
    }];

}


@end
