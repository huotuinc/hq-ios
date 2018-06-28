//
//  InComeTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/20.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "InComeTableViewCell.h"
#import "InComeTopView.h"
#import "InComeBottom.h"


@interface InComeTableViewCell ()


@property (nonatomic,strong) InComeTopView * inComeTopView;

@property (nonatomic,strong) InComeBottom * inComeBottom1;

@property (nonatomic,strong) InComeBottom * inComeBottom;


@end


@implementation InComeTableViewCell


- (InComeTopView *)inComeTopView{
    if (_inComeTopView == nil) {
        _inComeTopView = [[InComeTopView alloc] init];
        _inComeTopView.userInteractionEnabled = YES;
        KWeakSelf(self);
        [_inComeTopView bk_whenTapped:^{
            [weakself.delegate InComeClicl:(int)weakself.indexPath.row];
        }];
    }
    return _inComeTopView;
}

- (InComeBottom *)inComeBottom1{
    if (_inComeBottom1 == nil) {
        _inComeBottom1 = [[InComeBottom alloc] init];
    }
    return _inComeBottom1;
}

- (InComeBottom *)inComeBottom{
    if (_inComeBottom == nil) {
        _inComeBottom = [[InComeBottom alloc] init];
    }
    return _inComeBottom;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor =  LWColor(215, 215, 215);
        [self setUpInit];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)setUpInit{
    
    [self.contentView addSubview:self.inComeTopView];
    [self.inComeTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top);
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(kAdaptedWidth(45));
    }];
    
    [self.contentView addSubview:self.inComeBottom];
    [self.contentView addSubview:self.inComeBottom1];
    [self.inComeBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.inComeTopView.mas_bottom).mas_offset(1);
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.inComeBottom1.mas_left).mas_offset(-1);
        make.height.mas_equalTo(kAdaptedWidth(87));
        make.width.mas_equalTo(self.inComeBottom1.mas_width);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    
    [self.inComeBottom1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.inComeBottom.mas_top);
        make.left.mas_equalTo(self.inComeBottom.mas_right).mas_offset(1);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(kAdaptedWidth(87));
        make.width.mas_equalTo(self.inComeBottom.mas_width);
        make.bottom.mas_equalTo(self.inComeBottom.mas_bottom);
    }];
    
    
    
}

@end
