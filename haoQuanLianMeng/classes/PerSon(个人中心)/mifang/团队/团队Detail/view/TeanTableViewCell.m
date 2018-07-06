//
//  TeanTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TeanTableViewCell.h"
#import "TemDetailTop.h"
#import "TemDetailBottom.h"



@interface TeanTableViewCell ()

@property (nonatomic,strong) TemDetailTop * top;

@property (nonatomic,strong) TemDetailBottom * bottom;


@property (nonatomic,strong) UIView * container;

@end


@implementation TeanTableViewCell


- (TemDetailTop *)top{
    if (_top == nil) {
        _top = [[TemDetailTop alloc] init];
    }
    return _top;
}

- (TemDetailBottom *)bottom{
    if (_bottom == nil) {
        _bottom = [[TemDetailBottom alloc] init];
    }
    return _bottom;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpInit];
        self.contentView.backgroundColor = LWColor(240, 239, 244);
    }
    return self;
}


- (void)setUpInit{
    
    self.container = [[UIView alloc] init];
    [self.contentView addSubview:self.container];
    self.container.backgroundColor = LWColor(225, 225, 225);
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(10);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
    }];
    
    [self.container addSubview:self.top];
    self.top.backgroundColor = [UIColor whiteColor];
    [self.top mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.container.mas_left);
        make.top.mas_equalTo(self.container.mas_top);
        make.right.mas_equalTo(self.container.mas_right);
    }];
    
    [self.contentView addSubview:self.bottom];
    self.bottom.backgroundColor = LWColor(250, 250, 250);
    [self.bottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.container.mas_left);
        make.top.mas_equalTo(self.top.mas_bottom).mas_offset(1);
        make.bottom.mas_equalTo(self.container.mas_bottom);
        make.right.mas_equalTo(self.container.mas_right);
    }];
    
}


- (void)setModel:(TeamPListModel *)model{
    _model = model;
    
    [self.top configure:model];
    
    [self.bottom configure:model];
}
@end
