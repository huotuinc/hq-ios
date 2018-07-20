//
//  MallMessageCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MallMessageCell.h"
#import "HTMessageInModel.h"
#import "MallMessageCenterView.h"



@implementation MallMessageCell


- (MessageBaseCenterView *)centerView {
    if (_centerView == nil){
        _centerView = [[MallMessageCenterView alloc] init];
        _centerView.backgroundColor = [UIColor yellowColor];
    }
    return _centerView;
}


- (void)updateCell {
    [super updateCell];
}



//
//- (UIView *)containView{
//    if (_containView == nil) {
//        _containView = [[UIView alloc] init];
//    }
//    return _containView;
//}
//
//- (MallMessageHeader *)header{
//    if (_header == nil) {
//        _header = [[MallMessageHeader alloc] init];
//    }
//    return _header;
//}



//- (UILabel *)top{
//    if (_top == nil) {
//        _top = [[UILabel alloc] init];
//    }
//    return _top;
//}
//
//- (UILabel *)centerTitle{
//    if (_centerTitle == nil) {
//        _centerTitle = [[UILabel alloc] init];
//    }
//    return _centerTitle;
//}
//
//- (UILabel *)bottom{
//    if (_bottom == nil) {
//        _bottom = [[UILabel alloc] init];
//    }
//    return _bottom;
//}




//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//
//        [self setUpInit];
//    }
//    return self;
//}
//
//
//- (void)setUpInit{
//
//    [self.contentView addSubview:self.containView];
//    [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(10);
//        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
//        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(10);
//        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-10);
//    }];
//
//    [self.containView addSubview:self.header];
//    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.containView.mas_left);
//        make.right.mas_equalTo(self.containView.mas_right);
//        make.top.mas_equalTo(self.containView.mas_top);
//
//    }];
//
//    [self.containView addSubview:self.iconView];
//    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.containView.mas_left).mas_offset(10);
//        //make.right.mas_equalTo(self.containView.mas_right);
//        make.height.mas_equalTo(60);
//        make.width.mas_equalTo(60);
//        make.top.mas_equalTo(self.header.mas_bottom);
//
////        make.bottom.mas_equalTo(self.containView.mas_bottom).mas_offset(-10);
//    }];
//
//    [self.containView addSubview:self.titleLableT];
//    [self.titleLableT mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(10);
//        make.right.mas_equalTo(self.containView.mas_right).mas_equalTo(-10);
//        make.top.mas_equalTo(self.header.mas_bottom);
////        make.bottom.mas_equalTo(self.containView.mas_bottom).mas_offset(-10);
//    }];
    
    
    
    
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
    
    
    
//}
//
//- (void)configure:(id)model{
////    HTMessageInModel *
//    //会员注册成功通知
//    if ([model isKindOfClass:[HTMessageInModel class]]) {
////        [self.iconView mas_updateConstraints:^(MASConstraintMaker *make) {
////            make.height.width.mas_equalTo(50);
////
////        }];
//        HTMessageInModel * t = (HTMessageInModel *)model;
//        [self.iconView sd_setImageWithURL:[NSURL URLWithString:t.UserHeadImgURL] placeholderImage:[UIImage imageNamed:@"headerMoren"]];
//
//        self.textLabel.text = @"dssarfwqhreuwhrosiuhfsadfsakdflsadfj+\
//        adfhjsafhjksadfhjskadfadasdasdadasdasdasdasdasdasdasdasdasdasdasddasdasdasd";
//    }
//
//}

@end
