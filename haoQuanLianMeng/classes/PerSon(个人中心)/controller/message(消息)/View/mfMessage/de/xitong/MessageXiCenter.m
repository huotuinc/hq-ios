//
//  MessageXiCenter.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/17.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MessageXiCenter.h"
#import "HTSysMessageModel.h"


@implementation MessageXiCenter

- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UILabel *)content{
    if (_content == nil) {
        _content = [[UILabel alloc] init];
        _content.numberOfLines = 0;
    }
    return _content;
}

- (instancetype)init{
    if (self = [super init]) {

        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{

    [self addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(5);
        make.right.mas_equalTo(self.mas_right).mas_offset(-5);
        make.top.mas_equalTo(self.mas_top);
        make.height.mas_equalTo(self.iconView.mas_width).multipliedBy(.5f);
    }];


    [self addSubview:self.content];
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_left);
        make.right.mas_equalTo(self.iconView.mas_right);
        make.top.mas_equalTo(self.iconView.mas_bottom).mas_offset(5);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-5);
    }];

}


- (void)configArticleView:(HTMessageCellModel * )model{
    HTSysMessageModel * tt = model.messageModel;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:tt.NoticeImgURL]];
    self.content.text = tt.NoticeContent;
}


@end
