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
        _homeListLeft = [[HomeListItemView alloc] init];
//        _homeListLeft.backgroundColor = [UIColor blueColor];
    }
    return _homeListLeft;
}

- (HomeListItemView *)homeListSecond{
    if (_homeListSecond == nil) {
        _homeListSecond = [[HomeListItemView alloc] init];
//        _homeListSecond.backgroundColor = [UIColor yellowColor];
    }
    return _homeListSecond;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupInit];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}



- (void)setupInit{
    
    [self.contentView addSubview:self.homeListLeft];
//    CGFloat aa = (KScreenWidth - 14 * 3) * 0.5;
    [self.contentView addSubview:self.homeListSecond];
    
    [self.homeListLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(kAdaptedWidth(14));
        make.top.mas_equalTo(self.contentView.mas_top);
        //make.height.mas_equalTo(aa.size.height);
        make.right.mas_equalTo(self.homeListSecond.mas_left).mas_offset(kAdaptedWidth(-14));
        make.width.mas_equalTo(self.homeListSecond.mas_width);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    
    
    [self.homeListSecond mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.homeListLeft.mas_right).mas_offset(kAdaptedWidth(14));
        make.top.mas_equalTo(self.homeListLeft.mas_top);
        //make.height.mas_equalTo(aa.size.height);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(kAdaptedWidth(-14));
        make.width.mas_equalTo(self.homeListLeft.mas_width);
        make.bottom.mas_equalTo(self.homeListLeft.mas_bottom);
    }];
    
    
    
//    self.homeListLeft.userInteractionEnabled = YES;
//    [self.homeListLeft bk_whenTapped:^{
//        LWLog(@"xxxxxxx");
//    }];
//
//    self.homeListSecond.userInteractionEnabled = YES;
//    [self.homeListSecond bk_whenTapped:^{
//       LWLog(@"xxxxxxx");
//    }];
    
    
//    self.contentView.backgroundColor = [UIColor redColor];
    
    
}




- (void)setRightdataModel:(ShopGoodModel *)rightdataModel{
    _rightdataModel = rightdataModel;
    
    [self.homeListSecond configure:rightdataModel];
}


- (void)setLeftdataModel:(ShopGoodModel *)leftdataModel{
    _leftdataModel = leftdataModel;
    [self.homeListLeft configure:leftdataModel];
}


- (void)setHaveRight:(bool)haveRight{
    _haveRight = haveRight;
    if (haveRight) {
        self.homeListSecond.hidden = NO;
    }else{
        self.homeListSecond.hidden = YES;
    }
}
@end
