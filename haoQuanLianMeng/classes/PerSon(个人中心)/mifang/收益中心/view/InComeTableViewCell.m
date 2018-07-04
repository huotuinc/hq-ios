//
//  InComeTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/20.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "InComeTableViewCell.h"
#import "InComeTopView.h"
#import "InComeBottom.h"


@interface InComeTableViewCell ()


@property (nonatomic,strong) InComeTopView * inComeTopView;

@property (nonatomic,strong) InComeBottom * inComeBottom1;

@property (nonatomic,strong) InComeBottom * inComeBottom;


@end


@implementation InComeTableViewCell


- (InComeTopView *)inComeTopView{
    if (_inComeTopView == nil) {
        _inComeTopView = [[InComeTopView alloc] init];
        _inComeTopView.userInteractionEnabled = YES;
        KWeakSelf(self);
        [_inComeTopView bk_whenTapped:^{
            [weakself.delegate InComeClicl:(int)weakself.indexPath.section];
        }];
    }
    return _inComeTopView;
}

- (InComeBottom *)inComeBottom1{
    if (_inComeBottom1 == nil) {
        _inComeBottom1 = [[InComeBottom alloc] init];
    }
    return _inComeBottom1;
}

- (InComeBottom *)inComeBottom{
    if (_inComeBottom == nil) {
        _inComeBottom = [[InComeBottom alloc] init];
    }
    return _inComeBottom;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor =  LWColor(215, 215, 215);
        [self setUpInit];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)setUpInit{
    
    [self.contentView addSubview:self.inComeTopView];
    [self.inComeTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top);
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(kAdaptedWidth(45));
    }];
    
    [self.contentView addSubview:self.inComeBottom];
    [self.contentView addSubview:self.inComeBottom1];
    [self.inComeBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.inComeTopView.mas_bottom).mas_offset(1);
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.inComeBottom1.mas_left).mas_offset(-1);
        make.height.mas_equalTo(kAdaptedWidth(87));
        make.width.mas_equalTo(self.inComeBottom1.mas_width);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    
    [self.inComeBottom1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.inComeBottom.mas_top);
        make.left.mas_equalTo(self.inComeBottom.mas_right).mas_offset(1);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(kAdaptedWidth(87));
        make.width.mas_equalTo(self.inComeBottom.mas_width);
        make.bottom.mas_equalTo(self.inComeBottom.mas_bottom);
    }];
}


- (void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
    
    if (indexPath.section == 0) {
        [self.inComeBottom setTitle:@"今日收益"];
        [self.inComeBottom1 setTitle:@"昨日收益"];
    }else if(indexPath.section == 1){
        [self.inComeBottom setTitle:@"本周收益"];
        [self.inComeBottom1 setTitle:@"上周收益"];
    }else{
        [self.inComeBottom setTitle:@"本月收益"];
        [self.inComeBottom1 setTitle:@"上月收益"];
    }
}
- (void)configure:(InComeModel *)model{
    if (self.indexPath.section == 0) {
//        UserProfitByToday    int    今日收益
//        UserOrderNumByToday    int    今日订单数
//        UserProfitByYesterday    int    昨日收益
//        UserOrderNumByYesterday    int    昨日订单数
        [self.inComeBottom setMoney:model.UserProfitByToday andDan:model.UserOrderNumByToday];
        [self.inComeBottom1 setMoney:model.UserProfitByYesterday andDan:model.UserOrderNumByYesterday];
        
    }else if(self.indexPath.section == 1){
//        UserProfitByWeek    int    本周收益
//        UserOrderNumByWeek    int    本周订单数
//        UserProfitByLastWeek    int    上周收益
//        UserOrderNumByLastWeek    int    上周订单数
        [self.inComeBottom setMoney:model.UserProfitByWeek andDan:model.UserOrderNumByWeek];
        [self.inComeBottom1 setMoney:model.UserProfitByLastWeek andDan:model.UserOrderNumByLastWeek];
    }else{
        
//        UserProfitByMonth    int    本月收益
//        UserOrderNumByMonth    int    本月订单数
//        UserProfitByLastMonth    int    上月收益
//        UserOrderNumByLastMonth    int    上月订单数
        
        
        [self.inComeBottom setMoney:model.UserProfitByMonth andDan:model.UserOrderNumByMonth];
        [self.inComeBottom1 setMoney:model.UserProfitByLastMonth andDan:model.UserOrderNumByLastMonth];
    }
    
}
@end
