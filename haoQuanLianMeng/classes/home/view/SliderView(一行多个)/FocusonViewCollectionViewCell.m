//
//  FocusonViewCollectionViewCell.m
//  HighCopyTodayNews
//
//  Created by hack on 2017/8/3.
//  Copyright © 2017年 hack. All rights reserved.
//

#import "FocusonViewCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIImage+YHAdd.h"
#import "LoadingButton.h"
#import "UIColor+YHAdd.h"
@interface FocusonViewCollectionViewCell ()

@property(nonatomic,strong)UIImageView *iconView;
@property(nonatomic,strong)UILabel * quanValueLable;
@property(nonatomic,strong)UILabel * shareLable;
@property(nonatomic,strong)UILabel *nameLable;
@property(nonatomic,strong)UILabel *moneyLable;

@end


@implementation FocusonViewCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame])
    {
        [self initSubView];
    }
    return self;
}

-(UIImageView *)iconView{
    if(!_iconView){
        _iconView=[UIImageView new];
    }
    return _iconView;
}


-(UILabel *)quanValueLable{
    if(!_quanValueLable){
        _quanValueLable=[[UILabel alloc] init];
    }
    return _quanValueLable;
}


-(UILabel *)shareLable{
    if(!_quanValueLable){
        _quanValueLable=[[UILabel alloc] init];
    }
    return _quanValueLable;
}

-(UILabel *)nameLable{
    if(!_nameLable){
        _nameLable=[[UILabel alloc] init];
    }
    return _nameLable;
}


-(UILabel *)moneyLable{
    if(!_moneyLable){
        _moneyLable=[[UILabel alloc] init];
    }
    return _moneyLable;
}



-(void)initSubView{
    

    
    
    [self.contentView addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView.mas_top);
        make.height.mas_equalTo(self.iconView.mas_width);
    }];
    self.iconView.backgroundColor = [UIColor redColor];
    
    [self.contentView addSubview:self.quanValueLable];
    [self.quanValueLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_left);
        make.height.mas_equalTo(kAdaptedHeight(18));
        make.top.mas_equalTo(self.iconView.mas_bottom).mas_offset(kAdaptedHeight(4));
        make.width.mas_equalTo(kAdaptedWidth(40));
    }];
    
    
    
    [self.contentView addSubview:self.shareLable];
    [self.shareLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.quanValueLable.mas_right).mas_offset(kAdaptedWidth(5));
        make.height.mas_equalTo(kAdaptedHeight(18));
        make.top.mas_equalTo(self.quanValueLable.mas_top);
        make.width.mas_equalTo(kAdaptedWidth(76));
    }];
    
    
    [self.contentView addSubview:self.nameLable];
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_left);
        make.top.mas_equalTo(self.quanValueLable.mas_bottom).mas_offset(kAdaptedHeight(5));
        make.height.mas_equalTo(kAdaptedHeight(30));
    }];
    
    
    
    [self.contentView addSubview:self.moneyLable];
    [self.moneyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_left);
        make.top.mas_equalTo(self.quanValueLable.mas_bottom).mas_offset(kAdaptedHeight(5));
        make.height.mas_equalTo(kAdaptedHeight(28));
    }];
    
    
    

}



@end
