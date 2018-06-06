//
//  TuiGuangTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TuiGuangTableViewCell.h"
#import "TuiGuangCenterView.h"
#import "TuiGuangViewDownView.h"



@interface TuiGuangTableViewCell ()

@property (nonatomic,strong) UIView * TuiGuangTop;

@property (nonatomic,strong) UILabel * leftTitle;

@property (nonatomic,strong) UILabel * orderTitle;

@property (nonatomic,strong) UILabel * rightTitle;


@property (nonatomic, strong) TuiGuangCenterView * tuiGuangCenterView;


@property (nonatomic, strong) TuiGuangViewDownView * tuiGuangViewDownView;

@end


@implementation TuiGuangTableViewCell


- (TuiGuangViewDownView *)tuiGuangViewDownView{
    if (_tuiGuangViewDownView == nil) {
        _tuiGuangViewDownView = [[TuiGuangViewDownView alloc] init];
    }
    return _tuiGuangViewDownView;
}



- (TuiGuangCenterView *)tuiGuangCenterView {
    if (_tuiGuangCenterView == nil){
        _tuiGuangCenterView = [[TuiGuangCenterView alloc] init];
    }
    return _tuiGuangCenterView;
}


- (UILabel *)leftTitle{
    if (_leftTitle == nil) {
        _leftTitle = [[UILabel alloc] init];
        _leftTitle.text = @"订单号:";
        _leftTitle.textColor = LWColor(118, 118, 118);
        _leftTitle.font = kAdaptedFontSize(14);
    }
    return _leftTitle;
}


- (UILabel *)orderTitle{
    if (_orderTitle == nil) {
        _orderTitle = [[UILabel alloc] init];
        _orderTitle.textColor = LWColor(118, 118, 118);
        _orderTitle.font = kAdaptedFontSize(14);
    }
    return _orderTitle;
}


- (UILabel *)rightTitle{
    if (_rightTitle == nil) {
        _rightTitle = [[UILabel alloc] init];
        _rightTitle.textColor = LWColor(118, 118, 118);
        _rightTitle.font = kAdaptedFontSize(14);
    }
    return _rightTitle;
}



- (UIView *)TuiGuangTop{
    if (_TuiGuangTop == nil) {
        _TuiGuangTop = [[UIView alloc] init];
    }
    return _TuiGuangTop;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setUpInit];
    }
    return self;
}

- (void)setUpInit {

    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.TuiGuangTop];
    [self.TuiGuangTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.contentView.mas_top);
        make.height.mas_equalTo(kAdaptedHeight(45));
    }];

    [self.TuiGuangTop addSubview:self.leftTitle];
    [self.leftTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.TuiGuangTop.centerY);
        make.left.mas_equalTo(self.TuiGuangTop.mas_left).mas_offset(10);
    }];

    [self.TuiGuangTop addSubview:self.orderTitle];
    self.orderTitle.text = @"133312313123123";
    [self.orderTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.TuiGuangTop.centerY);
        make.left.mas_equalTo(self.leftTitle.mas_right).mas_offset(10);
    }];


    [self.TuiGuangTop addSubview:self.rightTitle];
    self.rightTitle.text = @"2018-09-02 下单";
    [self.rightTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.TuiGuangTop.centerY);
        make.right.mas_equalTo(self.TuiGuangTop.mas_right).mas_offset(-20);
    }];


    [self.contentView addSubview:self.tuiGuangCenterView];
    [self.tuiGuangCenterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.TuiGuangTop.mas_bottom);
    }];
    
    
    [self.contentView addSubview:self.tuiGuangViewDownView];
    [self.tuiGuangViewDownView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.tuiGuangCenterView.mas_bottom);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
