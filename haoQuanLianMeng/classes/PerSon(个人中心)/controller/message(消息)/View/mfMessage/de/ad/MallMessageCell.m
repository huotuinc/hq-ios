//
//  MallMessageCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MallMessageCell.h"
#import "MallMessageHeader.h"


@interface MallMessageCell ()

@property (nonatomic,strong) UIView * containView;
@property (nonatomic,strong) MallMessageHeader * header;

@property (nonatomic,strong) UILabel * titleLable;


@property (nonatomic,strong) UILabel * top;

@property (nonatomic,strong) UILabel * centerTitle;

@property (nonatomic,strong) UILabel * bottom;

@end


@implementation MallMessageCell

- (UIView *)containView{
    if (_containView == nil) {
        _containView = [[UIView alloc] init];
    }
    return _containView;
}

- (MallMessageHeader *)header{
    if (_header == nil) {
        _header = [[MallMessageHeader alloc] init];
    }
    return _header;
}

- (UILabel *)titleLable{
    if (_titleLable == nil) {
        _titleLable = [[UILabel alloc] init];
    }
    return _titleLable;
}

- (UILabel *)top{
    if (_top == nil) {
        _top = [[UILabel alloc] init];
    }
    return _top;
}

- (UILabel *)centerTitle{
    if (_centerTitle == nil) {
        _centerTitle = [[UILabel alloc] init];
    }
    return _centerTitle;
}

- (UILabel *)bottom{
    if (_bottom == nil) {
        _bottom = [[UILabel alloc] init];
    }
    return _bottom;
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
    
    
//    [self.containView addSubview:self.iconView];
//    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.header.mas_left);
//        make.right.mas_equalTo(self.header.mas_right);
//        make.top.mas_equalTo(self.header.mas_bottom);
//        make.height.mas_equalTo(self.iconView.mas_width).multipliedBy(.4f);
//    }];
//    
//    
//    
//    [self.containView addSubview:self.content];
//    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.iconView.mas_left);
//        make.right.mas_equalTo(self.iconView.mas_right);
//        make.top.mas_equalTo(self.iconView.mas_bottom);
//        make.bottom.mas_equalTo(self.containView.mas_bottom);
//    }];
    
    
    
}


@end
