//
//  EightTableViewCell.m
//  haoQuanLianMeng
///Users/luohaibo/Desktop/秘方/haoQuanLianMeng/haoQuanLianMeng/classes/PerSon(个人中心)/controller/money(余额明细)
//  Created by 罗海波 on 2018/6/15.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "EightTableViewCell.h"

#import "MyWalletTopView.h"
#import "EightBottomView.h"



@interface EightTableViewCell ()<EightBottomViewDelegate>


@property (nonatomic,strong) MyWalletTopView * top;

@property (nonatomic,strong) EightBottomView * bottomView;
@end


@implementation EightTableViewCell

- (MyWalletTopView *)top{
    if (_top == nil) {
        _top = [[MyWalletTopView alloc] init];
        [_top setTitle:@"常用功能" and:YES];
    }
    return _top;
}

- (EightBottomView *)bottomView{
    if (_bottomView == nil) {
        _bottomView = [[EightBottomView alloc] init];
        _bottomView.delegate = self;
    }
    return _bottomView;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpInit];
        self.backgroundColor = LWColor(249, 249, 249);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)setUpInit{
    [self.contentView addSubview:self.top];
    [self.top mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top);
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
    }];
    
    [self.contentView addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.top.mas_bottom).mas_offset(1);
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
}

- (void)EightBottomViewClickAtIndex:(NSUInteger)index{
    if (self.block) {
        self.block(index - 1000);
    }
}

@end
