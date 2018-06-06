//
//  HTPhoneTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTPhoneTableViewCell.h"
#import "HTPhotosView.h"


@implementation HTPhoneTableViewCell

- (HTArticleBaseView *)centerView{
    if (_centerView == nil) {
        _centerView = [[HTPhotosView alloc] init];
    }
    return _centerView;
}

- (void)updateCell{
    [super updateCell];
    [self.centerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo([self.centerView getHeight]);
    }];
}

@end
