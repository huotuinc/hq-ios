//
//  ShuListTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/31.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ShuListTableViewCell.h"
#import "HomeListItemView.h"


@interface ShuListTableViewCell ()

@property (nonatomic,strong) HomeListItemView * homeListLeft;

@property (nonatomic,strong) HomeListItemView * homeListSecond;


@end


@implementation ShuListTableViewCell

- (HomeListItemView *)homeListLeft{
    if (_homeListLeft == nil) {
        _homeListLeft = [HomeListItemView shareHomeListItemView];
    }
    return _homeListLeft;
}

- (HomeListItemView *)homeListSecond{
    if (_homeListSecond == nil) {
        _homeListSecond = [HomeListItemView shareHomeListItemView];
    }
    return _homeListSecond;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupInit];
    }
    return self;
}



- (void)setupInit{
    
    [self.contentView addSubview:self.homeListLeft];
    CGRect aa = self.homeListLeft.bounds;
    
    [self.homeListLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(14);
        make.top.mas_equalTo(self.contentView);
        make.height.mas_equalTo(aa.size.height);
        make.width.mas_equalTo(aa.size.width);
        make.bottom.mas_equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.homeListSecond];
    [self.homeListSecond mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.homeListLeft.mas_right).mas_offset(14);
        make.top.mas_equalTo(self.contentView);
        make.height.mas_equalTo(aa.size.height);
        make.width.mas_equalTo(aa.size.width);
        make.bottom.mas_equalTo(self.contentView);
    }];
    
//    self.contentView.backgroundColor = [UIColor redColor];
    
    
}

@end
