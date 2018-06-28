//
//  MyTeamHead.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MyTeamHead.h"

@interface MyTeamHead ()

@property (nonatomic,strong) UIImageView * iconView;

@property (nonatomic,strong) UILabel * teamLable;

@property (nonatomic,strong) UILabel * rightLable;

@property (nonatomic,strong) UIImageView * rightArrLable;
@end


@implementation MyTeamHead


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = LWColor(255, 51, 52);
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    self.iconView.image = [UIImage imageNamed:@"tm"];
    [self addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(16);
        make.height.width.mas_equalTo(kAdaptedWidth(16));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    self.teamLable = [[UILabel alloc] init];
    self.teamLable.text = @"团队详情";
    self.teamLable.textColor = [UIColor whiteColor];
    [self addSubview:self.teamLable];
    [self.teamLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(5);
        make.centerY.mas_equalTo(self.iconView.mas_centerY);
    }];
    
    
    self.rightArrLable = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [self addSubview:self.rightArrLable];
    [self.rightArrLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).mas_offset(-16);
        make.height.width.mas_equalTo(kAdaptedWidth(16));
        make.centerY.mas_equalTo(self.iconView.mas_centerY);
    }];
    
    
    self.rightLable = [[UILabel alloc] init];
    self.rightLable.text = @"更多";
    self.rightLable.textColor = [UIColor whiteColor];
    [self addSubview:self.rightLable];

    [self.rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.iconView.mas_centerY);
        make.right.mas_equalTo(self.rightArrLable.mas_left).mas_offset(-5);
    }];
    
    
    
}
@end
