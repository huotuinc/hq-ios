//
//  MFPersonHeaderView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/14.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MFPersonHeaderView.h"
#import "MiFangPersonHeaderView.h"



@interface MFPersonHeaderView ()

@property (nonatomic,strong) MiFangPersonHeaderView  * titleHeader;


@property (nonatomic,strong) UIImageView  * iconView;

@property (nonatomic,strong) UILabel * nameLabel;

@property (nonatomic,strong) UILabel * levelLabel;

@property (nonatomic,strong) UILabel  * setLabel;

@property (nonatomic,strong) UIButton * erButton;

@property (nonatomic,assign) BOOL  haveHeader;


@end


@implementation MFPersonHeaderView


- (MiFangPersonHeaderView *)titleHeader{
    if (_titleHeader == nil) {
        _titleHeader = [[MiFangPersonHeaderView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 0)];
        _titleHeader.backgroundColor = LWColor(109, 164, 242);
    }
    return _titleHeader;
}



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

- (instancetype)initWithFrame:(CGRect)frame withHeader:(BOOL)header{
    
    if (self = [super initWithFrame:frame]) {
        self.haveHeader = header;
        [self setUpInit];
    }
    return self;
    
    
}




- (void)configWithData:(MiFangUserCenterModel *)model{
    
    self.nameLabel.text = model.WxNickName;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.WxHeadImg] placeholderImage:nil];
    self.levelLabel.text = [NSString stringWithFormat:@"  %@  ",model.LevelName];
    [self.titleHeader configWithData:model];
}
- (void)setUpInit{
    
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.titleHeader];
    if (self.haveHeader) {
        self.titleHeader.frame = CGRectMake(0, 0, KScreenWidth, 30);
    }
    
    CGFloat a = CGRectGetMaxY(self.titleHeader.frame);
//    self.iconView.frame = CGRectMake((KScreenWidth - kAdaptedWidth(70)) * 0.5, CGRectGetMaxY(self.titleHeader.frame) + kAdaptedWidth(21), kAdaptedWidth(70), kAdaptedWidth(70));
    self.iconView.layer.cornerRadius = kAdaptedWidth(70) * 0.5;
    self.iconView.layer.masksToBounds = YES;
    [self addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(kAdaptedWidth(70));
        make.top.mas_equalTo(self.titleHeader.mas_bottom).mas_offset(kAdaptedWidth(21));
        make.left.mas_equalTo(self.mas_left).mas_offset((KScreenWidth - kAdaptedWidth(70)) * 0.5);
    }];
//    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self.mas_centerY);
//        make.height.width.mas_equalTo(kAdaptedWidth(70));
//        make.left.mas_equalTo(self.mas_left).mas_offset(20);
//    }];



        LWLog(@"%@", NSStringFromCGRect(self.iconView.frame));
    CGFloat height = [HTToolShareManager titleHeightWithFont:20];
//    self.nameLabel.frame = CGRectMake(0, CGRectGetMaxY(self.iconView.frame) + kAdaptedWidth(5)
//, KScreenWidth, height);
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconView.mas_bottom).mas_offset(kAdaptedWidth(5));
        make.height.mas_equalTo(height);
        make.centerX.mas_equalTo(self.iconView.mas_centerX);
    }];
    
   
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
        make.top.mas_equalTo(self.titleHeader.mas_bottom).mas_offset(5);
        make.left.mas_equalTo(self.mas_left).mas_offset(20);
        make.height.width.mas_equalTo(44);
//        make.height.mas_equalTo(height);
    }];
//
//    height = [HTToolShareManager titleHeightWithFont:20];
    [self addSubview:self.erButton];
    [self.erButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleHeader.mas_bottom).mas_offset(5);
        make.right.mas_equalTo(self.mas_right).mas_offset(-20);
        make.height.width.mas_equalTo(44);
    }];
    CGFloat heightx = kAdaptedWidth(21) + kAdaptedWidth(70) + kAdaptedWidth(5) + kAdaptedWidth(3) + height + height + kAdaptedWidth(20);
    if (self.haveHeader) {
        heightx += 20;
    }
    self.heightx = heightx;
    self.frame = CGRectMake(0, 0, KScreenWidth, heightx);
}

- (CGFloat)getHeader{
    return self.heightx;
}


- (void)refresh{
    self.titleHeader.height = 0;
    CGFloat height = [HTToolShareManager titleHeightWithFont:20];
    CGFloat heightx = kAdaptedWidth(21) + kAdaptedWidth(70) + kAdaptedWidth(5) + kAdaptedWidth(3) + height + height + kAdaptedWidth(20);
    self.frame = CGRectMake(0, 0, KScreenWidth, heightx);
    [self layoutSubviews];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
