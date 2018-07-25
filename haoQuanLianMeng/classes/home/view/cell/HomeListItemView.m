//
//  HomeListItemView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/31.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HomeListItemView.h"
#import "QuanDetailViewController.h"


#define Margin 14

@interface HomeListItemView ()

@property (nonatomic, strong) UIImageView * iconView;

@property (nonatomic, strong) UILabel * headTitleLabel;

@property (nonatomic, strong) UILabel * sellLabel;

@property (nonatomic, strong) UILabel * daiLiLabel;

@property (nonatomic, strong) UILabel * dailiMoneyLabel;

@property (nonatomic, strong) ShopGoodModel * model;

@end

@implementation HomeListItemView

- (UIImageView *)iconView {
    if (_iconView == nil){
        _iconView = [[UIImageView alloc] init];
//        _iconView.backgroundColor = [UIColor redColor];
        _iconView.image = [UIImage imageNamed:@"headerMoren"];
        
    }
    return _iconView;
}




- (UILabel *)headTitleLabel {
    if(_headTitleLabel == nil){
        _headTitleLabel = [[UILabel alloc] init];
        _headTitleLabel.textColor = LWColor(67, 67, 67);
        _headTitleLabel.font = kAdaptedFontSize(16);
    }
    return _headTitleLabel;
}


- (UILabel *)sellLabel {
    if(_sellLabel == nil){
        _sellLabel = [[UILabel alloc] init];
        _sellLabel.textColor = LWColor(172, 172, 172);
        _sellLabel.font = kAdaptedFontSize(19);
        _sellLabel.text = @"¥ 200";
        _sellLabel.textColor = [UIColor redColor];
    }
    return _sellLabel;
}



- (UILabel *)daiLiLabel {
    if (_daiLiLabel == nil){
        _daiLiLabel = [[UILabel alloc] init];
        _daiLiLabel.text = @" 代理价 ";
        _daiLiLabel.font = kAdaptedFontSize(15);
        _daiLiLabel.textColor = [UIColor whiteColor];
        _daiLiLabel.backgroundColor = [UIColor redColor];
    }
    return _daiLiLabel;
}


- (UILabel *)dailiMoneyLabel {
    if (_dailiMoneyLabel == nil){
        _dailiMoneyLabel = [[UILabel alloc] init];
        _dailiMoneyLabel.text = @"¥0.0";
        _dailiMoneyLabel.font = kAdaptedFontSize(15);
    }
    return _dailiMoneyLabel;
}






+ (instancetype)shareHomeListItemView{
    HomeListItemView * view =  [[super alloc] init];
//    view.bounds = CGRectMake(0, 0, (KScreenWidth - 3.0 * Margin) * 0.5, CGRectGetMaxY(view.shareMakeMoneyLabel.frame) + 8);
    return view;
}


- (instancetype)init{
    if (self = [super init]) {
        
        [self setupInit];
    }
    return self;
}


- (void)setupInit{
//    CGFloat wd = (KScreenWidth - 3.0 * Margin) * 0.5;
    
    //self.iconView.frame = CGRectMake(0, 0, wd, wd);
    [self addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.width.mas_equalTo(wd);
        make.right.mas_equalTo(self.iconView.superview.mas_right);
        make.left.mas_equalTo(self.iconView.superview.mas_left);
        make.top.mas_equalTo(self.iconView.superview.mas_top);
        make.height.mas_equalTo(self.iconView.mas_width);
    }];
   
    [self addSubview:self.headTitleLabel];
    self.headTitleLabel.numberOfLines = 2;
    [self.headTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_left);
        make.right.mas_equalTo(self.iconView.mas_right);
        make.top.mas_equalTo(self.iconView.mas_bottom).mas_offset(kAdaptedWidth(2));
    }];
    
    [self addSubview:self.sellLabel];
    [self.sellLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_left);
        make.right.mas_equalTo(self.iconView.mas_right);
        make.top.mas_equalTo(self.headTitleLabel.mas_bottom).mas_offset(kAdaptedWidth(5));
    }];
    

    [self addSubview:self.daiLiLabel];
    [self.daiLiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_left);
        //make.right.mas_equalTo(self.iconView.mas_right);
        make.top.mas_equalTo(self.sellLabel.mas_bottom).mas_offset(kAdaptedWidth(5));
        make.height.mas_equalTo(kAdaptedWidth(20));
        make.bottom.mas_equalTo(self.daiLiLabel.superview.mas_bottom).mas_offset(kAdaptedWidth(-10));
    }];

    [self addSubview:self.dailiMoneyLabel];
    [self.dailiMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.daiLiLabel.mas_right).mas_offset(5);
        make.centerY.mas_equalTo(self.daiLiLabel.mas_centerY);
//        make.top.mas_equalTo(self.sellLabel.mas_bottom).mas_offset(kAdaptedWidth(5));
//        make.height.mas_equalTo(kAdaptedWidth(20));
//        make.bottom.mas_equalTo(self.daiLiLabel.superview.mas_bottom).mas_offset(kAdaptedWidth(-5));
    }];

    
    KWeakSelf(self);
    self.userInteractionEnabled = YES;
    [self bk_whenTapped:^{
        [weakself cellClick];
    }];

}


- (void)cellClick{
    
    QuanDetailViewController * vc = [[QuanDetailViewController alloc] init];
    vc.goodId = self.model.GoodsId;
    [self.viewContainingController.navigationController pushViewController:vc animated:YES];
    
}

- (void)configure:(ShopGoodModel *)model{
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.PicUrl] placeholderImage:[UIImage imageNamed:@"headerMoren"]];
    self.model = model;
    self.headTitleLabel.text = model.Name;
    self.sellLabel.text = [NSString stringWithFormat:@"¥ %@",model.Price];
    self.dailiMoneyLabel.text = [NSString stringWithFormat:@"¥ %@",model.UserPrice];
}
@end
