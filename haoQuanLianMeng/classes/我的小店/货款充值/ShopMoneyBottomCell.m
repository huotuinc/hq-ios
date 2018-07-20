//
//  ShopBottomCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ShopMoneyBottomCell.h"
#import "BuyAccountPayChanel.h"

@interface ShopMoneyBottomCell ()


@property (nonatomic,strong) NSArray * payArray;
@end


@implementation ShopMoneyBottomCell


- (NSArray *)payArray{
    if (_payArray == nil) {
        _payArray = @[self.zhifubao,self.weixinLable,self.lianlianPay];
    }
    return _payArray;
}

- (UILabel *)payChanel{
    if (_payChanel == nil) {
        _payChanel = [[UILabel alloc] init];
        _payChanel.text = @"选中支付方式";
    }
    return _payChanel;
}

- (SelectLable *)zhifubao{
    if (_zhifubao == nil) {
        _zhifubao = [[SelectLable alloc] init];
        _zhifubao.layer.borderWidth = .3f;
        _zhifubao.text = @"支付宝";
        _zhifubao.textAlignment = NSTextAlignmentCenter;
        _zhifubao.layer.borderColor = LWColor(205, 205, 205).CGColor;
        _zhifubao.select = 1;
    }
    return _zhifubao;
}

- (SelectLable *)weixinLable{
    if (_weixinLable == nil) {
        _weixinLable = [[SelectLable alloc] init];
        _weixinLable.text = @"微信";
        _weixinLable.layer.borderWidth = .3f;
        _weixinLable.textAlignment = NSTextAlignmentCenter;
        _weixinLable.layer.borderColor = LWColor(205, 205, 205).CGColor;
    }
    return _weixinLable;
}

- (SelectLable *)lianlianPay{
    if (_lianlianPay == nil) {
        _lianlianPay = [[SelectLable alloc] init];
        _lianlianPay.text = @"连连支付";
        _lianlianPay.layer.borderWidth = .3f;
        _lianlianPay.textAlignment = NSTextAlignmentCenter;
        _lianlianPay.layer.borderColor = LWColor(205, 205, 205).CGColor;
    }
    return _lianlianPay;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.payChanel];
        [self.payChanel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.payChanel.superview.mas_top).mas_offset(10);
            make.left.mas_equalTo(self.payChanel.superview.mas_left).mas_equalTo(10);
        }];
        
        
        [self.contentView addSubview:self.zhifubao];
        [self.zhifubao mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.payChanel.mas_bottom).mas_offset(kAdaptedWidth(10));
            make.left.mas_equalTo(self.payChanel.mas_left);
            make.height.mas_equalTo(kAdaptedWidth(35));
            make.width.mas_equalTo(80);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-10);
        }];
        
        [self.contentView addSubview:self.weixinLable];
        [self.weixinLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.zhifubao.mas_top);
            make.left.mas_equalTo(self.zhifubao.mas_right).mas_offset(10);
            make.height.mas_equalTo(kAdaptedWidth(35));
            make.width.mas_equalTo(80);
            make.bottom.mas_equalTo(self.zhifubao.mas_bottom);
        }];
        
        [self.contentView addSubview:self.lianlianPay];
        [self.lianlianPay mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.zhifubao.mas_top);
            make.left.mas_equalTo(self.weixinLable.mas_right).mas_offset(10);
            make.height.mas_equalTo(kAdaptedWidth(35));
            make.width.mas_equalTo(80);
            make.bottom.mas_equalTo(self.zhifubao.mas_bottom);
        }];
        
         
    }
    return self;
}

- (void)configure:(NSArray *)dataArray{

    for (int i = 0; i < dataArray.count; i++) {
        SelectLable * tt = [self.payArray objectAtIndex:i];
        tt.hidden = NO;
        BuyAccountPayChanel * chanel = [dataArray objectAtIndex:i];
        tt.text = chanel.PaymentName;
    }
    
}
@end
