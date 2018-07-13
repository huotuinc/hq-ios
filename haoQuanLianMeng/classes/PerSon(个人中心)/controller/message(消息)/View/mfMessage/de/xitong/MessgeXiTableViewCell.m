//
//  MessgeXiTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MessgeXiTableViewCell.h"
#import "LWMessageHeaderView.h"



@interface MessgeXiTableViewCell ()


@property (nonatomic,strong) UIView * containView;
@property (nonatomic,strong) LWMessageHeaderView * header;

@property (nonatomic,strong) UIImageView * iconView;
@property (nonatomic,strong) UILabel * content;

@end

@implementation MessgeXiTableViewCell


- (UIView *)containView{
    if (_containView == nil) {
        _containView = [[UIView alloc] init];
    }
    return _containView;
}

- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UILabel *)content{
    if (_content == nil) {
        _content = [[UILabel alloc] init];
    }
    return _content;
}




- (LWMessageHeaderView *)header{
    if (_header == nil) {
        _header = [[LWMessageHeaderView alloc] init];
    }
    return _header;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    [self.containView addSubview:self.containView];
    [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.contentView.mas_top);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    
    [self.containView addSubview:self.header];
    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.containView.mas_left);
        make.right.mas_equalTo(self.containView.mas_right);
        make.top.mas_equalTo(self.contentView.mas_top);
    }];


    [self.containView addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.header.mas_left);
        make.right.mas_equalTo(self.header.mas_right);
        make.top.mas_equalTo(self.header.mas_bottom);
        make.height.mas_equalTo(self.iconView.mas_width).multipliedBy(.4f);
    }];



    [self.containView addSubview:self.content];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_left);
        make.right.mas_equalTo(self.iconView.mas_right);
        make.top.mas_equalTo(self.iconView.mas_bottom);
        make.bottom.mas_equalTo(self.containView.mas_bottom);
    }];


    
}

@end
