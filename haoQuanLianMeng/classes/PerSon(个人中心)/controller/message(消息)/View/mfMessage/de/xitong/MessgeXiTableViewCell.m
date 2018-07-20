//
//  MessgeXiTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MessgeXiTableViewCell.h"
#import "MessageXiCenter.h"


@interface MessgeXiTableViewCell ()





@end

@implementation MessgeXiTableViewCell




- (MessageBaseCenterView *)centerView {
    if (_centerView == nil){
        _centerView = [[MessageXiCenter alloc] init];
    }
    return _centerView;
}


- (void)updateCell {
    [super updateCell];
}


//- (void)setUpInit{
//
//    [self.contentView addSubview:self.containView];
//    [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(10);
//        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
//        make.top.mas_equalTo(self.contentView.mas_top);
//        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-10);
//    }];
//
//    [self.containView addSubview:self.header];
//    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.containView.mas_left).mas_offset(10);
//        make.right.mas_equalTo(self.containView.mas_right).mas_offset(-10);
//        make.top.mas_equalTo(self.contentView.mas_top);
//    }];
//
//
//    [self.containView addSubview:self.iconView];
//    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.header.mas_left).mas_offset(5);
//        make.right.mas_equalTo(self.header.mas_right).mas_offset(-5);
//        make.top.mas_equalTo(self.header.mas_bottom);
//        make.height.mas_equalTo(self.iconView.mas_width).multipliedBy(.5f);
//    }];
//
//
//
//    [self.containView addSubview:self.content];
//    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.iconView.mas_left);
//        make.right.mas_equalTo(self.iconView.mas_right);
//        make.top.mas_equalTo(self.iconView.mas_bottom).mas_offset(5);
//        make.bottom.mas_equalTo(self.containView.mas_bottom).mas_offset(-5);
//    }];
//}
//
//
//- (void)configure:(HTSysMessageModel *)model{
//
//    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.NoticeImgURL]];
//    self.content.text = model.NoticeContent;
//}

@end
