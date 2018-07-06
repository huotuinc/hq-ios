//
//  TeamHeadView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TeamHeadView.h"

@interface TeamHeadView ()

@property (weak, nonatomic) IBOutlet TeamBaseView *second;

@property (weak, nonatomic) IBOutlet TeamBaseView *third;

@property (weak, nonatomic) IBOutlet TeamBaseView *fourth;

@property (weak, nonatomic) IBOutlet TeamBaseView *fifth;


@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UILabel *fans;
@property (weak, nonatomic) IBOutlet UILabel *shaixuan;


@property (nonatomic,strong) TeamBaseView * currentLable;
@end


@implementation TeamHeadView

+ (instancetype)TeamHeadViewCreate{
    
   TeamHeadView * view =   [[[NSBundle mainBundle] loadNibNamed:@"TeamHeadView" owner:nil options:nil] lastObject];
    view.frame = CGRectMake(0, 0, KScreenWidth, 44);
    return view;
}



- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.second.tag = 1000;
    self.third.tag = 1001;
    self.fourth.tag = 1002;
    self.fifth.tag = 1003;
    
    self.second.selectType = 1;
    self.currentLable = self.second;
//    self.currentLable = self.time;
//    self.currentLable.textColor = [UIColor redColor];
    [self click];
}


- (void)click{
    
    self.second.userInteractionEnabled = YES;
    self.third.userInteractionEnabled = YES;
    self.fourth.userInteractionEnabled = YES;
    self.fifth.userInteractionEnabled = YES;
    
    
    KWeakSelf(self);
    [self.second bk_whenTapped:^{
        if (weakself.currentLable == self.second) {
            return ;
        }else{
            weakself.currentLable.selectType = 0;
            weakself.second.selectType = 1;
            weakself.currentLable = weakself.second;
            [weakself.delegate TeamHeadViewClick:TeamSortByScoreFlashBackStatus];
        }
    }];
    
    
    [self.third bk_whenTapped:^{
        if (weakself.currentLable == self.third) {
            return ;
        }else{
            weakself.currentLable.selectType = 0;
            weakself.third.selectType = 1;
            weakself.currentLable = weakself.third;
            [weakself.delegate TeamHeadViewClick:TeamSortByScoreFlashBackStatus];
        }
    }];
    [self.fourth bk_whenTapped:^{
        if (weakself.currentLable == self.fourth) {
            return ;
        }else{
            weakself.currentLable.selectType = 0;
            weakself.fourth.selectType = 1;
            weakself.currentLable = weakself.fourth;
            [weakself.delegate TeamHeadViewClick:TeamSortByFansFlashBackStatus];
        }
    }];
    [self.fifth bk_whenTapped:^{
        [weakself.delegate TeamHeadViewClick:TeamSortByShaiXuanStatus];
    }];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
