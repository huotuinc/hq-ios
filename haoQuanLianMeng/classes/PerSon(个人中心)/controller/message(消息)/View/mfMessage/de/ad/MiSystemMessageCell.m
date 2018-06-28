//
//  MiSystemMessageCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/15.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MiSystemMessageCell.h"
#import "MiSystemMessgaeView.h"


@implementation MiSystemMessageCell


- (MiGoodMessageBaseView *)bottomView{
    if (_bottomView == nil) {
        _bottomView = [[MiGoodMessageBaseView alloc] init];
    }
    return _bottomView;
}


- (void)updateCell{
    [super updateCell];
//    [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo([self.centerView getHeight]);
//    }];
}

@end
