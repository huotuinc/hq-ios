//
//  MiBenLTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/3.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MiBenLTableViewCell.h"
@interface MiBenLTableViewCell ()

@property (nonatomic,strong) UILabel  * benLable;

@property (nonatomic,strong) UILabel  * nameLable;

@property (nonatomic,strong) UILabel  * timeLable;


@end

@implementation MiBenLTableViewCell


- (UILabel *)benLable{
    if (_benLable == nil) {
        _benLable = [[UILabel alloc] init];
        _benLable.text = @"2";
    }
    return _benLable;
}

- (UILabel *)nameLable{
    if (_nameLable == nil) {
        _nameLable = [[UILabel alloc] init];
        _nameLable.text = @"买了很多东西";
    }
    return _nameLable;
}

- (UILabel *)timeLable{
    if (_timeLable == nil) {
        _timeLable = [[UILabel alloc] init];
        _timeLable.text = @"2018-10-29";
    }
    return _timeLable;
}



- (void)setUpInit{
    
    [self.contentView addSubview:self.benLable];
    [self.benLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(25);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-25);
    }];
    [self.contentView addSubview:self.nameLable];
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.benLable.mas_right).mas_offset(10);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(5);
        //make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-10);
    }];
    
    [self.contentView addSubview:self.timeLable];
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.benLable.mas_right).mas_offset(10);
        //make.top.mas_equalTo(self.contentView.mas_top);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-5);
    }];
    
}


- (void)setData:(MiBenIn *)data{
    _data = data;
    
    if (self.type == -1) {
        self.benLable.text = [NSString stringWithFormat:@"%d",data.ChangeMiBean];
    }else{
       self.benLable.text = [NSString stringWithFormat:@"%d",data.ChangeIntegral];
    }
    
    
    self.nameLable.text = data.ChangeDesc;
    self.timeLable.text = data.ChangeTime;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpInit];
    }
    return self;
}

@end
