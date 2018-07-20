//
//  MessageBottomView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/17.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MessageBottomView.h"


@interface MessageBottomView ()


@property (nonatomic,strong) UIView *sliderView;


@property (nonatomic,strong) UILabel  *title;

@end


@implementation MessageBottomView

- (UIView *)sliderView{
    if (_sliderView == nil) {
        _sliderView = [[UIView alloc] init];
        _sliderView.backgroundColor = [UIColor blackColor];
    }
    return _sliderView;
}

- (UILabel *)title{
    if (_title == nil) {
        _title = [[UILabel alloc] init];
        _title.textColor = [UIColor blueColor];
    }
    return _title;
}


- (instancetype)init{
    if (self = [super init]) {
        
        
        [self setUpInit];
//        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}



- (void)setUpInit{
    [self addSubview:self.sliderView];
    [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.top.mas_equalTo(self.mas_top);
        make.height.mas_equalTo(0);
    }];
    
    [self addSubview:self.title];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.top.mas_equalTo(self.sliderView.mas_bottom).mas_offset(2);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)configArticleView:(HTMessageCellModel * )model{
//     |
    NSString * tt;
//    [self.sliderView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.mas_left);
//        make.right.mas_equalTo(self.mas_right);
//        make.top.mas_equalTo(self.mas_top);
//        make.height.mas_equalTo(.8);
//    }];
    
    if ((model.messageType == MessgaeNutritionistExpire) || (model.messageType == MessgaeUserBecomeAgent) || (model.messageType == MessgaeAgentMoneyNotEnough) ) {
        [self.sliderView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left);
            make.right.mas_equalTo(self.mas_right);
            make.top.mas_equalTo(self.mas_top);
            make.height.mas_equalTo(.8);
        }];
    }else{
        [self.sliderView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left);
            make.right.mas_equalTo(self.mas_right);
            make.top.mas_equalTo(self.mas_top);
            make.height.mas_equalTo(0);
        }];
    }
    
    if (model.messageType == MessgaeNutritionistExpire) {
        self.title.text = @"立即续费";
    }else if(model.messageType == MessgaeUserBecomeAgent){
        self.title.text = @"查看小店";
    }else if(model.messageType == MessgaeAgentMoneyNotEnough){
        self.title.text = @"立即充值";
    }else{
        self.title.text = nil;
    }
    
    
    
}
//- (void)configure:(NSString * )title{
//    self.title.text = title;
//    [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.mas_left);
//        make.right.mas_equalTo(self.mas_right);
//        make.top.mas_equalTo(self.mas_top);
//        make.height.mas_equalTo(.8);
//    }];
//}

@end
