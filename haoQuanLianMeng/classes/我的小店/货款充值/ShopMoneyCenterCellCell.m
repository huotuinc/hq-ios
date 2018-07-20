//
//  ShopCenterCellCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ShopMoneyCenterCellCell.h"
@interface ShopMoneyCenterCellCell ()

@property (nonatomic,strong) NSArray * container;

@property (nonatomic,strong) SelectLable * CurrentselectLable;


@end

@implementation ShopMoneyCenterCellCell


- (NSArray *)container{
    if (_container == nil) {
        _container = @[self.first,self.second,self.third,self.fourth];
    }
    return _container;
}

- (UILabel *)chongzhiTitle{
    if (_chongzhiTitle == nil) {
        _chongzhiTitle = [[UILabel alloc] init];
        _chongzhiTitle.text = @"充值金额";
    }
    return _chongzhiTitle;
}


- (SelectLable *)first{
    if (_first == nil) {
        _first = [[SelectLable alloc] init];
        _first.text = @"  0  ";
        _first.layer.borderWidth = .3f;
        _first.textAlignment = NSTextAlignmentCenter;
        _first.layer.borderColor = LWColor(205, 205, 205).CGColor;
        _first.select = 1;
        _first.userInteractionEnabled = YES;
        KWeakSelf(self);
        [_first bk_whenTapped:^{
            weakself.CurrentselectLable.select = 0;
            weakself.CurrentselectLable = weakself.first;
            weakself.first.select = 1;
            weakself.selectNum = 0;
        }];
    }
    return _first;
}

- (SelectLable *)second{
    if (_second == nil) {
        _second = [[SelectLable alloc] init];
        _second.text = @"  2000  ";
        _second.layer.borderWidth = .3f;
        _second.hidden = YES;
        _second.textAlignment = NSTextAlignmentCenter;
        _second.layer.borderColor = LWColor(205, 205, 205).CGColor;
        _second.userInteractionEnabled = YES;
        KWeakSelf(self);
        [_second bk_whenTapped:^{
            weakself.CurrentselectLable.select = 0;
            weakself.CurrentselectLable = weakself.second;
            weakself.CurrentselectLable.select = 1;
            weakself.selectNum = 1;
        }];
    }
    return _second;
}

- (SelectLable *)third{
    if (_third == nil) {
        _third = [[SelectLable alloc] init];
        _third.text = @"  5000  ";
        _third.layer.borderWidth = .3f;
        _third.hidden = YES;
        _third.textAlignment = NSTextAlignmentCenter;
        _third.layer.borderColor = LWColor(205, 205, 205).CGColor;
        _third.userInteractionEnabled = YES;
        KWeakSelf(self);
        [_third bk_whenTapped:^{
            weakself.CurrentselectLable.select = 0;
            weakself.CurrentselectLable = weakself.third;
            weakself.CurrentselectLable.select = 1;
            weakself.selectNum = 2;
        }];
    }
    return _third;
}

- (SelectLable *)fourth{
    if (_fourth == nil) {
        _fourth = [[SelectLable alloc] init];
        _fourth.text = @"  1000  ";
        _fourth.layer.borderWidth = .3f;
        _fourth.hidden = YES;
        _fourth.textAlignment = NSTextAlignmentCenter;
        _fourth.layer.borderColor = LWColor(205, 205, 205).CGColor;
        _fourth.userInteractionEnabled = YES;
        KWeakSelf(self);
        [_fourth bk_whenTapped:^{
            weakself.CurrentselectLable.select = 0;
            weakself.CurrentselectLable = weakself.fourth;
            weakself.CurrentselectLable.select = 1;
            weakself.selectNum = 3;
        }];
    }
    return _fourth;
}




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.chongzhiTitle];
        [self.chongzhiTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.chongzhiTitle.superview.mas_top).mas_offset(10);
            make.left.mas_equalTo(self.chongzhiTitle.superview.mas_left).mas_equalTo(10);
        }];
    
        [self.contentView addSubview:self.first];
        [self.contentView addSubview:self.second];
        [self.contentView addSubview:self.third];
        [self.contentView addSubview:self.fourth];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        CGFloat wi = kAdaptedWidth(70);
//        CGFloat margin = KScreenWidth - 10 - wi * 4 - 10 * 4;
        [self.first mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.chongzhiTitle.mas_bottom).mas_offset(10);
            make.left.mas_equalTo(self.chongzhiTitle.mas_left).mas_equalTo(10);
            make.height.mas_equalTo(kAdaptedWidth(35));
            make.width.mas_equalTo(wi);
//            make.right.mas_equalTo(self.second.mas_left).mas_offset(kAdaptedWidth(-20));
            make.bottom.mas_equalTo(self.first.superview.mas_bottom).mas_offset(-10);
        }];
    
        
        [self.second mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.first.mas_top);
            make.left.mas_equalTo(self.first.mas_right).mas_offset(6);
            make.height.mas_equalTo(kAdaptedWidth(35));
            make.width.mas_equalTo(wi);
            make.bottom.mas_equalTo(self.first.mas_bottom);
        }];
    
        
        [self.third mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.first.mas_top);
            make.left.mas_equalTo(self.second.mas_right).mas_offset(6);
            make.height.mas_equalTo(kAdaptedWidth(35));
            make.width.mas_equalTo(wi);
            make.bottom.mas_equalTo(self.first.mas_bottom);
        }];
        
        
        [self.fourth mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.first.mas_top);
            make.left.mas_equalTo(self.third.mas_right).mas_offset(6);
            make.height.mas_equalTo(kAdaptedWidth(35));
            make.width.mas_equalTo(70);
            make.bottom.mas_equalTo(self.first.mas_bottom);
        }];
        
    }
    return self;
}

- (void)configure:(ShopHuoKuanPage *)model{
    NSUInteger a = model.GoodsItems.count > 4 ? 4 : model.GoodsItems.count;
    for (int i = 0; i < a; i++) {
        SelectLable * t = self.container[i];
        if (i == 0) {
//            self.selectNum = 0;
            t.select = 1;
            _CurrentselectLable = t;
        }
        t.hidden = NO;
        GoodsItems * item = model.GoodsItems[i];
        t.text = [NSString stringWithFormat:@"%@",item.DepositPrice];
    }
    
    
    
}
@end
