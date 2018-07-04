//
//  TuiGuangTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/22.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ATuiGuangTableViewCell.h"
#import "TuiGuangBottom.h"
#import "TuiGuangCenter.h"
#import "TuiGuangTop.h"
#import "TuiGuangCellModel.h"
#import "OrderItemModel.h"
#import "TuiGuangModel.h"


@interface ATuiGuangTableViewCell ()

@property (nonatomic,strong) UIView * containviewX;


@property (nonatomic,strong) TuiGuangTop * top;

//@property (nonatomic,strong) TuiGuangCenter * centerV;



@property (nonatomic,strong) NSMutableArray * centerArray;

@property (nonatomic,strong) TuiGuangBottom * bottom;

@end




@implementation ATuiGuangTableViewCell


- (NSMutableArray *)centerArray{
    if (_centerArray == nil) {
        _centerArray = [NSMutableArray array];
    }
    return _centerArray;
}

- (TuiGuangTop *)top{
    if (_top == nil) {
        _top = [[TuiGuangTop alloc] init];
    }
    return _top;
}

//- (TuiGuangCenter *)centerV{
//    if (_centerV == nil) {
//
//    }
//    return _centerV;
//}

- (TuiGuangBottom *)bottom{
    if (_bottom == nil) {
        _bottom = [[TuiGuangBottom alloc] init];
    }
    return _bottom;
}



- (UIView *)containviewX{
    if (_containviewX  == nil) {
        _containviewX = [[UIView alloc] init];
    }
    return _containviewX;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andData:(TuiGuangCellModel *)model{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpInit:model];
        self.selectionStyle  = UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)setUpInit:(TuiGuangCellModel *)model{
    
    [self.contentView addSubview:self.containviewX];
    [self.containviewX mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    self.containviewX.backgroundColor = [UIColor clearColor];
    
    [self.containviewX addSubview:self.top];
    [self.top mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.containviewX.mas_left);
        make.right.mas_equalTo(self.containviewX.mas_right);
        make.top.mas_equalTo(self.containviewX.mas_top);
        
    }];
    [self.top contigure:model.dataModel];

    for (int i = 0; i < model.dataModel.OrderItemInfo.count; i++) {
        TuiGuangCenter  * centerV = [[TuiGuangCenter alloc] init];
        [self.centerArray addObject:centerV];
        
        [self.containviewX addSubview:centerV];
        if (i == 0) {
            [centerV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.containviewX.mas_left);
                make.right.mas_equalTo(self.containviewX.mas_right);
                make.top.mas_equalTo(self.top.mas_bottom);
                //make.bottom.mas_equalTo(self.containviewX.mas_bottom).mas_offset(5);
            }];
        }else{
            TuiGuangCenter  * centerVB = [self.centerArray objectAtIndex:i-1];
            [centerV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.containviewX.mas_left);
                make.right.mas_equalTo(self.containviewX.mas_right);
                make.top.mas_equalTo(centerVB.mas_bottom);
                //make.bottom.mas_equalTo(self.containviewX.mas_bottom).mas_offset(5);
            }];
            
        }
        [centerV contigure:model.dataModel andIndex:i];
    }

    TuiGuangCenter  * centerVB = [self.centerArray lastObject];
    [self.containviewX addSubview:self.bottom];
    [self.bottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.containviewX.mas_left);
        make.right.mas_equalTo(self.containviewX.mas_right);
        make.top.mas_equalTo(centerVB.mas_bottom);
        make.bottom.mas_equalTo(self.containviewX.mas_bottom);
    }];
    
    [self.bottom contigure:model.dataModel];
    
}


- (void)configure:(TuiGuangCellModel *) model{
    
    
}

@end
