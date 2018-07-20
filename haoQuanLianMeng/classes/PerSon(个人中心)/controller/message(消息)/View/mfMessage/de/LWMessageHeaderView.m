//
// Created by 罗海波 on 2018/6/13.
// Copyright (c) 2018 HT. All rights reserved.
//

#import "LWMessageHeaderView.h"
#import "HTMessageInModel.h"
#import "HTSysMessageModel.h"
#import "HTDaiLiOrderPayModel.h"
#import "OrderPayModel.h"
#import "HTYinYangShiModel.h"
#import "HTMessageUpdate.h"
#import "HTMessageUpdateModel.h"


@interface LWMessageHeaderView ()

@property (nonatomic,strong) UILabel * titleLabel;

@property (nonatomic,strong) UILabel * timeLabel;

@property (nonatomic,strong) UIImageView * headView;



@end


@implementation LWMessageHeaderView


- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor
            = LWColor(131, 131, 131);
        _titleLabel.font = kAdaptedFontSize(16);
        _titleLabel.text = @"系统通知";
    }
    return _titleLabel;
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor
            = LWColor(195, 195, 195);
        _timeLabel.font = kAdaptedFontSize(12);
        _timeLabel.text = @"2018-05-29 16:09";
    }
    return _timeLabel;
}


- (UIImageView *)headView{
    if (_headView == nil) {
        _headView = [[UIImageView alloc] init];
        _headView.layer.cornerRadius = 5;
        _headView.layer.masksToBounds = YES;
        _headView.image = [UIImage imageNamed:@"xiTong"];
    }
    return _headView;
}




- (instancetype)init {
    if (self = [super init]){

        [self setUpInit];
        
        
        self.backgroundColor = [UIColor whiteColor];

    }
    return self;
}



- (void)setUpInit{


    [self addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(10);
        make.width.mas_equalTo(kAdaptedWidth(0));
        make.height.mas_equalTo(kAdaptedWidth(44));
        make.top.mas_equalTo(self.mas_top).mas_offset(5);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-10);
    }];


    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headView.mas_right).mas_offset(10);
        make.top.mas_equalTo(self.headView.mas_top).mas_offset(5);
        make.right.mas_equalTo(self.mas_right).mas_offset(-10);
    }];


    [self addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(2);
    }];

}

//设置、
- (void)configArticleView:(HTMessageCellModel * )model{
    


//     = 5, //
//     = 6, //
//     = 7, //邀请用户成为代理商

    
    if (model.messageType == MessgaeMallNotice) {//系统消息
        HTSysMessageModel * tt = model.messageModel;
        self.titleLabel.text = tt.NoticeTitle;
        self.timeLabel.text = tt.NoticeTime;
    }else if(model.messageType == MessgaeDownMenberRegist){//下线会员注册成功通知
        HTMessageInModel * tt = model.messageModel;
        self.titleLabel.text = @"会员注册成功通知";
        self.timeLabel.text = tt.NoticeTime;
    }else if(model.messageType == MessageDownMemberPayOrder){ //下线会员订单支付成功通知
        HTDaiLiOrderPayModel * tt = model.messageModel;
        self.titleLabel.text = @"代理订单支付成功通知";
        self.timeLabel.text = tt.NoticeTime;
    }else if(model.messageType == MessageBuyGoodSuccess){ //下线会员订单支付成功通知
        OrderPayModel * tt = model.messageModel;
        self.titleLabel.text = @"订单支付成功通知";
        self.timeLabel.text = tt.NoticeTime;
    }else if(model.messageType == MessgaeNutritionisContinue){ //下线会员订单支付成功通知
        HTYinYangShiModel * tt = model.messageModel;
        self.titleLabel.text = @"营养师续费通知";
        self.timeLabel.text = tt.NoticeTime;
    }else if(model.messageType == MessgaeNutritionistExpire){ //下线会员订单支付成功通知
        HTYinYangShiModel * tt = model.messageModel;
        self.titleLabel.text = @"营养师到期通知";
        self.timeLabel.text = tt.NoticeTime;
    }else if(model.messageType == MessgaeAgentMoneyNotEnough){ //代理商货款不足
        HTYinYangShiModel * tt = model.messageModel;
        self.titleLabel.text = @"货款不足通知";
        self.timeLabel.text = tt.NoticeTime;
    }else if(model.messageType == MessgaeUserBecomeAgent){ //升级为代理商
        HTMessageUpdateModel * tt = model.messageModel;
        self.titleLabel.text = @"代理商升级通知";
        self.timeLabel.text = tt.NoticeTime;
    }else if(model.messageType == MessageInviteBecomeNutritionis){ //邀请用户成为营养师
        HTMessageUpdate * tt = model.messageModel;
        self.titleLabel.text = @"好友升级营养师通知";
        self.timeLabel.text = tt.NoticeTime;
    }else if(model.messageType == MessageInviteBecomeAgent){ //邀请用户成为营养师
        HTMessageUpdateModel * tt = model.messageModel;
        self.titleLabel.text = @"好友升级代理商通知";
        self.timeLabel.text = tt.NoticeTime;
    }
    
    
    

}


@end
