//
//  MiFangWalletHeader.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/3.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MiFangWalletHeader.h"
@interface MiFangWalletHeader ()

@property (nonatomic,strong) UILabel * leftLable;
@property (nonatomic,strong) UILabel * leftMoneyLable;
@property (nonatomic,strong) UILabel * righrLable;
@property (nonatomic,strong) UILabel * rightMoneyLable;
@property (nonatomic,strong) UILabel * cdLable;
@end


@implementation MiFangWalletHeader


//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//
//        self.leftLable = [[UILabel alloc] init];
//        self.leftMoneyLable = [[UILabel alloc] init];
//        self.righrLable = [[UILabel alloc] init];
//        self.rightMoneyLable = [[UILabel alloc] init];
//        self.cdLable = [[UILabel alloc] init];
//
//        [self.contentView addSubview:self.cdLable];
//        self.cdLable.text = @"/";
////        self.cdLable.center = CGPointMake(frame.size.width * 0.5, frame.size.height * 0.5);
//        [self.cdLable mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.mas_equalTo(self.contentView.centerX);
//            make.centerY.mas_equalTo(self.contentView.centerY);
//            make.top.mas_equalTo(self.contentView.mas_top).mas_offset(20);
//            make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-20);
//
//        }];
//
//        [self.contentView addSubview:self.leftMoneyLable];
//        self.leftMoneyLable.text = @"可用积分";
//        [self.leftMoneyLable mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(self.cdLable.mas_left);
//            make.centerY.mas_equalTo(self.cdLable.centerY);
//        }];
//
//        [self.contentView addSubview:self.leftLable];
//        self.leftLable.text = @"0";
//        [self.leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(self.leftMoneyLable.mas_left);
//            make.centerY.mas_equalTo(self.cdLable.centerY);
//        }];
//
//
//        [self.contentView addSubview:self.righrLable];
//        self.righrLable.text = @"带结算积分";
//        [self.righrLable mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(self.cdLable.mas_right);
//            make.centerY.mas_equalTo(self.cdLable.centerY);
//        }];
//
//        [self.contentView addSubview:self.rightMoneyLable];
//        self.rightMoneyLable.text = @"10";
//        [self.rightMoneyLable mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(self.righrLable.mas_right);
//            make.centerY.mas_equalTo(self.cdLable.centerY);
//        }];
//
//    }
//    return self;
//}
- (instancetype)init{
    if (self = [super init]) {
        self.leftLable = [[UILabel alloc] init];
        self.leftMoneyLable = [[UILabel alloc] init];
        self.righrLable = [[UILabel alloc] init];
        self.rightMoneyLable = [[UILabel alloc] init];
        self.cdLable = [[UILabel alloc] init];

//        self.cdLable.frame = CGRectMake((KScreenWidth - 10) * 0.5, (frame.size.height - 30) * 0.5, 10, 30);
        [self addSubview:self.cdLable];
        self.cdLable.text = @"/";
        [self.cdLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.cdLable.centerX);
            make.centerY.mas_equalTo(self.cdLable.centerY);
        }];
        
        
        [self addSubview:self.leftMoneyLable];
        self.leftMoneyLable.text = @"0";
        [self.leftMoneyLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.cdLable.mas_left);
            make.centerY.mas_equalTo(self.cdLable.centerY);
        }];
        
        
        
        [self addSubview:self.leftLable];
        self.leftLable.text = @"总收入";
        [self.leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.leftMoneyLable.mas_left);
            make.centerY.mas_equalTo(self.cdLable.centerY);
        }];



        [self addSubview:self.righrLable];
        self.righrLable.text = @"总支出";
        [self.righrLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.cdLable.mas_right);
            make.centerY.mas_equalTo(self.cdLable.centerY);
        }];



        [self addSubview:self.rightMoneyLable];
        self.rightMoneyLable.text = @"0";
        [self.rightMoneyLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.righrLable.mas_right);
            make.centerY.mas_equalTo(self.cdLable.centerY);
        }];
//        self.cdLable.center = CGPointMake(frame.size.width * 0.5, frame.size.height * 0.5);


    }
    return self;
}

- (void)configure:(MiBenModel *)model{
    self.leftMoneyLable.text = [NSString stringWithFormat:@"%d",model.SumImportIntegral];
    self.rightMoneyLable.text = [NSString stringWithFormat:@"%d",model.SumExportIntegral];
}
@end
