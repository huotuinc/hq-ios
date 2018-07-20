//
//  MallMessageCenterView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/17.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MallMessageCenterView.h"
#import "HTMessageInModel.h"
#import "HTDaiLiOrderPayModel.h"
#import "OrderPayModel.h"
#import "HTYinYangShiModel.h"
#import "HTMessageNoMoney.h"
#import "HTMessageUpdate.h"

@implementation MallMessageCenterView

- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}



- (UILabel *)titleLableT{
    if (_titleLableT == nil) {
        _titleLableT = [[UILabel alloc] init];
        
        _titleLableT.numberOfLines = 0;
    }
    return _titleLableT;
}


- (instancetype)init{
    if (self = [super init]) {

        [self setUpInit];
    }
    return self;
}

- (void)setUpInit {
    [self addSubview:self.iconView];
    self.iconView.backgroundColor = [UIColor redColor];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(10);
        make.height.mas_equalTo(kAdaptedWidth(50));
        make.width.mas_equalTo(kAdaptedWidth(50));
        make.top.mas_equalTo(self.mas_top).mas_offset(10);
    }];

    [self addSubview:self.titleLableT];
    [self.titleLableT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(10);
        make.right.mas_equalTo(self.mas_right).mas_equalTo(-10);
        make.top.mas_equalTo(self.iconView.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-10);
    }];
}


- (void)configArticleView:(HTMessageCellModel * )model{

    
    switch (model.messageType) {
        case MessgaeDownMenberRegist:{
            HTMessageInModel * tt = model.messageModel;
            [self.iconView sd_setImageWithURL:[NSURL URLWithString:tt.UserHeadImgURL]];
            self.titleLableT.text = [tt getContent];
            break;
        }
        case MessageDownMemberPayOrder:{
            HTDaiLiOrderPayModel * tt = model.messageModel;
            [self.iconView sd_setImageWithURL:[NSURL URLWithString:tt.UserHeadImgURL]];
            self.titleLableT.text = [tt getContentString];
            break;
        }
        case MessageBuyGoodSuccess:{
            OrderPayModel * tt = model.messageModel;
            [self.iconView sd_setImageWithURL:[NSURL URLWithString:tt.UserHeadImgURL]];
            self.titleLableT.text = [tt getContentString];
            break;
        }
        case MessgaeNutritionistExpire:{
            HTYinYangShiModel * tt = model.messageModel;
            [self.iconView sd_setImageWithURL:[NSURL URLWithString:tt.UserHeadImgURL]];
            self.titleLableT.text = [tt getContentString];
            break;
        }
        case MessgaeNutritionisContinue:{
            HTYinYangShiModel * tt = model.messageModel;
            [self.iconView sd_setImageWithURL:[NSURL URLWithString:tt.UserHeadImgURL]];
            self.titleLableT.text = [tt getContentString];
            break;
        }
        case MessgaeAgentMoneyNotEnough:{//代理商货款不足
            HTMessageNoMoney * tt = model.messageModel;
            [self.iconView sd_setImageWithURL:[NSURL URLWithString:tt.UserHeadImgURL]];
            self.titleLableT.text = [tt getContentString];
            break;
        }case MessageInviteBecomeNutritionis | MessageInviteBecomeAgent | MessgaeUserBecomeAgent :{ //好友成为代理商 营养师
            
            
            HTMessageUpdate * tt = model.messageModel;
            [self.iconView sd_setImageWithURL:[NSURL URLWithString:tt.UserHeadImgURL]];
            self.titleLableT.text = [tt getContentString];
            break;
            break;
            
        }
            
            
//
            
        default:
            break;
    }
    

}



@end
