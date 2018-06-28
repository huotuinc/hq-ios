//
//  ProfuctMessageCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/15.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ProfuctMessageCell.h"
#import "ProductMessage.h"



@implementation ProfuctMessageCell

- (MiGoodMessageBaseView *)bottomView{
    if (_bottomView == nil) {
        _bottomView = [[ProductMessage alloc] init];
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
