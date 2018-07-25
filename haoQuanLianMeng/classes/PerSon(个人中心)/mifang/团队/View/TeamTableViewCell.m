//
//  TeamTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TeamTableViewCell.h"

@interface TeamTableViewCell ()

@property (nonatomic,strong) UILabel * left;

@property (nonatomic,strong) UILabel * centerL;

@property (nonatomic,strong) UILabel * right;

@end


@implementation TeamTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withType:(int)type{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.type = type;
        [self setUpInit];
        if (self.type == 0) {
            self.left.text = @"用户等级";
            self.centerL.text = @"一级团队(人)";
            self.right.text = @"二级团队(人)";
        }else{
            self.left.text = @"团队类型";
            self.centerL.text = @"今日(人)";
            self.right.text = @"本月(人)";
        }
    }
    
    return self;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //self.type = type;
        [self setUpInit];
    }
    
    return self;
}

- (void)setUpInit{

    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.left = [[UILabel alloc] init];
    self.left.textAlignment =  NSTextAlignmentCenter;
    self.centerL = [[UILabel alloc] init];
    self.right = [[UILabel alloc] init];
    self.centerL.textAlignment =  NSTextAlignmentCenter;
    self.right.textAlignment =  NSTextAlignmentCenter;
    [self.contentView addSubview:self.left];
    [self.contentView addSubview:self.centerL];
    [self.contentView addSubview:self.right];
    
    [self.left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.centerL.mas_left);
        make.top.mas_equalTo(self.contentView.mas_top);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(self.centerL.mas_width);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    
    
    [self.centerL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.left.mas_right);
        make.right.mas_equalTo(self.right.mas_left);
        make.top.mas_equalTo(self.contentView.mas_top);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(self.right.mas_width);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);

    }];
    
    
    [self.right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.centerL.mas_right);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.contentView.mas_top);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(self.left.mas_width);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);

    }];
    
    LWLog(@"%d",self.type)
    ;
    
    
    
}


- (void)configure:(Team *)model{
    
//    BelongOneNumByMonth = 6;
//    BelongOneNumByToday = 1;
//    BelongTwoNumByMonth = 13;
//    BelongTwoNumByToday = 5;
    
    LWLog(@"%@",self.indexPath);
    if (self.indexPath.section) {
        if (self.indexPath.row == 1) {
            self.left.text = @"一级团队";
            self.centerL.text = [NSString stringWithFormat:@"%d",model.BelongOneNumByToday];
            self.right.text = [NSString stringWithFormat:@"%d",model.BelongOneNumByMonth];
        }else{
            self.left.text = @"二级团队";
            self.centerL.text = [NSString stringWithFormat:@"%d",model.BelongTwoNumByToday];
            self.right.text = [NSString stringWithFormat:@"%d",model.BelongTwoNumByMonth];
        }
    }else{
        
        TeamInfoModel * modelx = model.TeamInfo[self.indexPath.row - 1];
       
        self.left.text = modelx.LevelName;
        
        
        self.centerL.text = [NSString stringWithFormat:@"%d",modelx.BelongOneMemberNum];
        self.right.text = [NSString stringWithFormat:@"%d",modelx.BelongTwoMemberNum];
    }
    
//    if (self.indexPath.section == 0) {
//        if (self.indexPath.row == 1) {
//            self.left.text = @"用户等级";
//            self.centerL.text = @"一级团队(人)";
//            self.right.text = @"二级团队(人)";
//        }else{
//
//            self.left.text = @"会员";
//            self.centerL.text = @"";
//            self.right.text = @"";
//        }
//    }
}
@end
