//
//  MyWalletTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/15.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MyWalletTableViewCell.h"
#import "MyWalletTopView.h"
#import "MyWalletBottomView.h"



@interface MyWalletTableViewCell()<MyWalletTopViewDelegate>

@property (nonatomic,strong) MyWalletTopView * top;

@property (nonatomic,strong) MyWalletBottomView * bottom;

@end


@implementation MyWalletTableViewCell


- (MyWalletBottomView *)bottom{
    if (_bottom == nil) {
        _bottom = [[MyWalletBottomView alloc] init];
    }
    return _bottom;
}

- (MyWalletTopView *)top{
    if (_top == nil) {
        _top = [[MyWalletTopView alloc] init];
        [_top setTitle:@"我的钱包" and:NO];
        _top.delegate = self;
    }
    return _top;
}


- (void)configWithData:(MiFangUserCenterModel *)model{
    
    [self.bottom configWithData:model];
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
    
    [self.contentView addSubview:self.bottom];
    [self.bottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.top.mas_bottom).mas_offset(1);
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
}

- (void)MyWalletTopViewClick:(int)type{
    if (!type) {
        [self.delegate MyWalletTopViewClick:0];
    }
}
@end
