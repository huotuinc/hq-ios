//
//  HTMessageTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTMessageTableViewCell.h"


@interface HTMessageTableViewCell()

@property (nonatomic,strong) UILabel * titleLabel;

@property (nonatomic,strong) UILabel * timeLabel;

@property (nonatomic,strong) UIImageView * headView;


@property (nonatomic,strong) UIImageView * contentImageView;

@property (nonatomic,strong) UILabel * contentTitle;


@end


@implementation HTMessageTableViewCell

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor
        = LWColor(131, 131, 131);
        _titleLabel.font = kAdaptedFontSize(16);
        _titleLabel.text = @"系统通知";
    }
    return _titleLabel;
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor
            = LWColor(195, 195, 195);
        _timeLabel.font = kAdaptedFontSize(12);
        _timeLabel.text = @"2018-05-29 16:09";
    }
    return _timeLabel;
}


- (UIImageView *)headView{
    if (_headView == nil) {
        _headView = [[UIImageView alloc] init];
        _headView.layer.cornerRadius = 5;
        _headView.layer.masksToBounds = YES;
    }
    return _headView;
}


- (UIImageView *)contentImageView {
    if(_contentImageView == nil){
        _contentImageView = [[UIImageView alloc] init];
    }
    return _contentImageView;
}


- (UILabel *)contentTitle{
    if (_contentTitle == nil) {
        _contentTitle = [[UILabel alloc] init];
        _contentTitle.textColor
            = LWColor(131, 131, 131);
        _contentTitle.font = kAdaptedFontSize(14);
        _contentTitle.numberOfLines = MAXFLOAT;
        _contentTitle.text = @"dasdadasdasfkdjaiewiqowueiqweuqweiuqw+\
        dasdadasdadasdasfkdjaiewiqowueiqweuqweiuqw+\
        dasda";
    }
    return _contentTitle;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit {

    [self.contentView addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(10);
        make.height.mas_equalTo(kAdaptedWidth(43));
        make.width.mas_equalTo(kAdaptedWidth(43));
        make.top.mas_equalTo(self.contentView).mas_offset(10);
        
    }];
    self.headView.backgroundColor = [UIColor blueColor];

    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headView.mas_right).mas_offset(10);
        make.right.mas_equalTo(self.contentView).mas_offset(-10);
        make.top.mas_equalTo(self.headView.mas_top);
    }];

    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.right.mas_equalTo(self.titleLabel.mas_right);
        make.bottom.mas_equalTo(self.headView.mas_bottom);
    }];

    [self.contentView addSubview:self.contentImageView];
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
        make.top.mas_equalTo(self.headView.mas_bottom).mas_offset(15);
        make.height.mas_equalTo(self.contentImageView.mas_width).multipliedBy(0.5);
    }];
    self.contentImageView.backgroundColor = [UIColor blackColor];

    [self.contentView addSubview:self.contentTitle];
    [self.contentTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentImageView.mas_left);
        make.right.mas_equalTo(self.contentImageView.mas_right);
        make.top.mas_equalTo(self.contentImageView.mas_bottom).mas_offset(12);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-10);
    }];
    
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;

}


- (void)setFrame:(CGRect)frame{
    CGRect fm = frame;
    fm.origin.x += 10;
    fm.size.width -= 20;
    fm.origin.y += 10;
    fm.size.height -= 10;
    [super setFrame:fm];
    
}

@end
