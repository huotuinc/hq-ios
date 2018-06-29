//
//  MFPersonHeaderView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/14.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MFPersonHeaderView.h"

@interface MFPersonHeaderView ()

@property (nonatomic,strong) UIImageView  * iconView;

@property (nonatomic,strong) UILabel * nameLabel;

@property (nonatomic,strong) UILabel * levelLabel;

@property (nonatomic,strong) UILabel  * setLabel;

@property (nonatomic,strong) UIButton * erButton;


@end


@implementation MFPersonHeaderView


- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}

- (UILabel *)levelLabel{
    if (_levelLabel == nil) {
        _levelLabel = [[UILabel alloc] init];
        _levelLabel.backgroundColor = [UIColor redColor];
        _levelLabel.text = @"  营养师  ";
        _levelLabel.font = kAdaptedFontSize(15);
        _levelLabel.textColor = [UIColor whiteColor];
        _levelLabel.layer.cornerRadius = 5;
        _levelLabel.layer.masksToBounds = YES;
    }
    return _levelLabel;
}

- (UILabel *)setLabel{
    if (_setLabel == nil) {
        _setLabel = [[UILabel alloc] init];
        _setLabel.userInteractionEnabled = YES;
        KWeakSelf(self);
        [_setLabel bk_whenTapped:^{
            [weakself.delegate MFPersonHeaderViewClick:0];
        }];
    }
    return _setLabel;
}


- (void)erweiMaClick{
    if ([self.delegate respondsToSelector:@selector(MFPersonHeaderViewClick:)]) {
        [self.delegate MFPersonHeaderViewClick:1];
    }
}

- (UIButton *)erButton{
    if (_erButton == nil) {
        _erButton = [[UIButton alloc] init];
        [_erButton setImage:[UIImage imageNamed:@"er"] forState:UIControlStateNormal];
        [_erButton addTarget:self action:@selector(erweiMaClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _erButton;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpInit];
    }
    return self;
}


- (void)configWithData:(MiFangUserCenterModel *)model{
    
    self.nameLabel.text = model.WxNickName;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.WxHeadImg] placeholderImage:nil];
    self.levelLabel.text = [NSString stringWithFormat:@"  %@  ",model.LevelName];
}
- (void)setUpInit{
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.iconView.frame = CGRectMake((KScreenWidth - kAdaptedWidth(70)) * 0.5, self.frame.size.height * 0.5 - 20 - kAdaptedWidth(70) * 0.5, kAdaptedWidth(70), kAdaptedWidth(70));
    self.iconView.layer.cornerRadius = self.iconView.frame.size.width * 0.5;
    self.iconView.layer.masksToBounds = YES;
    [self addSubview:self.iconView];
    
//    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self.mas_centerY);
//        make.height.width.mas_equalTo(kAdaptedWidth(70));
//        make.left.mas_equalTo(self.mas_left).mas_offset(20);
//    }];



        LWLog(@"%@", NSStringFromCGRect(self.iconView.frame));
    CGFloat height = [HTToolShareManager titleHeightWithFont:20];
    self.nameLabel.frame = CGRectMake(0, CGRectGetMaxY(self.iconView.frame)
, KScreenWidth, height);
    [self addSubview:self.nameLabel];
    
    
   
    [self addSubview:self.levelLabel];
    
    [self.levelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLabel.mas_bottom).mas_offset(kAdaptedWidth(3));
        make.height.mas_equalTo(height);
        make.centerX.mas_equalTo(self.nameLabel.mas_centerX);
    }];
//
//    height = [HTToolShareManager titleHeightWithFont:20];
    [self addSubview:self.setLabel];
    self.setLabel.text = @"设置";
    [self.setLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(10);
        make.left.mas_equalTo(self.mas_left).mas_offset(20);
        make.height.width.mas_equalTo(44);
//        make.height.mas_equalTo(height);
    }];
//
//    height = [HTToolShareManager titleHeightWithFont:20];
    [self addSubview:self.erButton];
    [self.erButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(10);
        make.right.mas_equalTo(self.mas_right).mas_offset(-20);
        make.height.width.mas_equalTo(44);
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
