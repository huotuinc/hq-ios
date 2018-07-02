//
//  HTArticleTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTArticleTableViewCell.h"

@interface HTArticleTableViewCell()<HTMenuViewDelegate>


@property (nonatomic,strong) UIView  * sliderView;


@property (nonatomic,strong) UILabel  * souqi;


@property (nonatomic,assign) bool  isOpen;


@end


@implementation HTArticleTableViewCell

@synthesize centerView = _centerView;


- (UILabel *)souqi{
    if (_souqi == nil) {
        _souqi = [[UILabel alloc] init];
    }
    return _souqi;
}

- (UIView *)sliderView{
    if (_sliderView == nil) {
        _sliderView = [[UIView alloc] init];
        _sliderView.backgroundColor = LWColor(242, 242, 242);
    }
    return _sliderView;
}

- (UILabel *)iTitleLabel{
    if (_iTitleLabel == nil) {
        _iTitleLabel = [[UILabel alloc] init];
        _iTitleLabel.numberOfLines = 0;
        _iTitleLabel.font = kAdaptedFontSize(17);
        _iTitleLabel.textColor = LWColor(117, 158, 224);
    }
    return _iTitleLabel;
}

- (UILabel *)contextlabel{
    if (_contextlabel == nil) {
        _contextlabel = [[UILabel alloc] init];
        _contextlabel.numberOfLines = 0;
        _contextlabel.font = kAdaptedFontSize(15);
    }
    return _contextlabel;
}


- (UIImageView *)headView{
    if (_headView == nil) {
        _headView = [[UIImageView alloc] init];
    }
    return _headView;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.isOpen = NO;
        [self setUpInit];
    }
    return self;
}



- (HTArticleBottomTitleView *)htArticleBottomTitleView{
    if (_htArticleBottomTitleView == nil) {
        _htArticleBottomTitleView = [[HTArticleBottomTitleView alloc] init];
    }
    return _htArticleBottomTitleView;
}



- (HTArticleMenuView *)htArticleMenuView{
    if (_htArticleMenuView == nil) {
        _htArticleMenuView = [[HTArticleMenuView alloc] init];
    }
    return _htArticleMenuView;
}



//初始化页面
- (void)setUpInit{
    
    //设置默认的样式
    [self setupDefault];
    
    
//    //设置中间视图
    [self setupArticleView];
//
//    //设置底部文字
    [self setBottomTitleView];
//
//
//    LWLog(@"ssssssss");
//    //设置底部工具栏
    [self setBottomMenuView];
    
    
    [self setSliderView];

}

- (void)setupDefault{
    
    
    [self.contentView addSubview:self.headView];
    self.headView.contentMode = UIViewContentModeScaleAspectFit;
//    self.headView.backgroundColor = [UIColor redColor];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(kAdaptedHeight(10));
        make.left.equalTo(self.contentView.mas_left).offset(kAdaptedWidth(10));
        make.height.width.mas_equalTo(kAdaptedWidth(40));
    }];
    
    [self.contentView addSubview:self.iTitleLabel];
//    self.iTitleLabel.textColor = [UIColor redColor];
    [self.iTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headView.mas_top);
//make.height.mas_equalTo(kAdaptedWidth(20));
        make.right.equalTo(self.contentView.mas_right).offset(kAdaptedWidth(-15));
        make.left.equalTo(self.headView.mas_right).offset(kAdaptedWidth(16));
    }];
    
    [self.contentView addSubview:self.contextlabel];
    [self.contextlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iTitleLabel.mas_bottom).offset(kAdaptedWidth(5));
        make.right.equalTo(self.iTitleLabel.mas_right);
        make.left.equalTo(self.iTitleLabel);
//        make.height.mas_equalTo(0);//先定50
        
    }];
    
    
   // LWLog(@"%@",NSStringFromClass([[[HTTool HTToolShare] getCurrentVC] class]));
    
                      
    
//    [self.contentView addSubview:self.souqi];
//    [self.souqi mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.contextlabel.mas_bottom).offset(kAdaptedWidth(5));
//        //make.right.equalTo(self.iTitleLabel.mas_right);
//        make.left.equalTo(self.iTitleLabel);
//        //make.height.mas_equalTo(100);//先定50
//
//    }];
    
}


- (void)setupArticleView
{
    [self.contentView addSubview:self.centerView];
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contextlabel.mas_bottom).offset(kAdaptedWidth(5));
        make.right.equalTo(self.iTitleLabel.mas_right);//.offset(kAdaptedWidth(-15));
        make.left.equalTo(self.iTitleLabel);
        make.height.mas_equalTo([self.centerView getHeight]);
        
    }];
}



//设置底部文字
- (void)setBottomTitleView{
    [self.contentView addSubview:self.htArticleBottomTitleView];
//    self.htArticleBottomTitleView.backgroundColor = [UIColor redColor];
    [self.htArticleBottomTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.centerView.mas_bottom);
        make.right.equalTo(self.iTitleLabel.mas_right);
        make.left.equalTo(self.iTitleLabel);
//        make.height.mas_equalTo(58);//先定50
//        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    
}

- (void)getHeight:(NSString *)title{
    
    //文字的具体高度
    //CGFloat height =  [[HTTool HTToolShare] titleHeightWithFont:15 withTitle:title];
    CGFloat witdth =  KScreenWidth -  (kAdaptedWidth(10) + kAdaptedWidth(40) + kAdaptedWidth(16) + kAdaptedWidth(15));
                     
    //LWLog(@"%@",NSStringFromCGRect(self.contextlabel.frame));
    
    CGFloat labelHeight = [self.contextlabel sizeThatFits:CGSizeMake(witdth, 6)].height;
    NSInteger count = (labelHeight) / self.contextlabel.font.lineHeight;
    LWLog(@"%ld",(long)count);
    if (count > 6) {
        self.souqi.text = @"全文";
        [self.contextlabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self.contextlabel.font.lineHeight * 6);
        }];
    }else{
        self.souqi.text = @"";
        [self.contextlabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(labelHeight);
        }];
    }
    
    self.souqi.userInteractionEnabled = YES;
    __weak typeof(self) weakself = self;
    [self.souqi bk_whenTapped:^{
        if (weakself.isOpen) {  //关闭
            weakself.souqi.text = @"全文";
            [weakself.contextlabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(self.contextlabel.font.lineHeight * 6);
            }];
        }else{//打开
            weakself.souqi.text = @"收起";
            [weakself.contextlabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(labelHeight);
            }];
            
        }
        weakself.isOpen = !weakself.isOpen;
    }];
    
    
}

- (void)setBottomMenuView{
    
    [self.contentView addSubview:self.htArticleMenuView];
    [self.htArticleMenuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.htArticleBottomTitleView.mas_bottom);
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.height.mas_equalTo(40);//先定50
        //make.bottom.equalTo(self.contentView.mas_bottom).mas_offset(5);
    }];
    
}

- (void)setSliderView{
    [self.contentView addSubview:self.sliderView];
    [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.htArticleMenuView.mas_bottom);
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.height.mas_equalTo(10);//先定50
        make.bottom.equalTo(self.contentView.mas_bottom).mas_offset(5);
    }];
}

- (void)configCellWithCellModel:(HTArticleCellModel *)model{
    _htArticleModel = model;
    [self updateCell];
}


- (void)updateCell{
    
#warning luohaibo
    
    
    
    [self.headView sd_setImageWithURL:[NSURL URLWithString:self.htArticleModel.article.logo]];
    self.iTitleLabel.text = self.htArticleModel.article.Title;
    self.contextlabel.text = self.htArticleModel.article.Content;
//    [self getHeight:self.htArticleModel.article.Content];
    
    
    
//    NSString * contentString = [self.htArticleModel stringForCoreText];
//    self.contextlabel.text =  contentString;
//    [self.contextlabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo( [self calculateContentLabelHeight]);
//        //make.height.mas_equalTo(self.cellModel.textLayout.textBoundingSize.height);
//    }];
    
    //配置中间视图
    [self.centerView configArticleView:self.htArticleModel];
    
    
    
    LWLog(@"xxxxxx");
    
    //更新文字
    [self.htArticleBottomTitleView configArticleView:self.htArticleModel];
    
    
    [self.htArticleMenuView configArticleView:self.htArticleModel withDelegate:self];
    
}


#pragma func
- (CGFloat)calculateContentLabelHeight
{
    //CGFloat labelWidth = [UIScreen mainScreen].bounds.size.width - kAvatarSize - 3 * 10;
//    CGFloat width = KScreenWidth - kAdaptedWidth((70));
//    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
//    NSDictionary* textAttrs = @{ NSFontAttributeName : kAdaptedFontSize(15) };
//    CGFloat height = [[self.htArticleModel stringForCoreText]
//                      boundingRectWithSize:maxSize
//                      options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
//                      attributes:textAttrs
//                      context:nil]
//    .size.height;
    return ceilf(20);
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
}

@end
