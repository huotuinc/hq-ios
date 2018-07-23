//
//  HTTitleViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/23.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTTitleViewCell.h"
#import "HTArticleTitleView.h"



@implementation HTTitleViewCell

- (HTArticleBaseView *)centerView{
    if (_centerView == nil) {
        _centerView = [[HTArticleTitleView alloc] init];
    }
    return _centerView;
}

- (void)updateCell{
    [super updateCell];
    [self.centerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0);
    }];
}
@end
