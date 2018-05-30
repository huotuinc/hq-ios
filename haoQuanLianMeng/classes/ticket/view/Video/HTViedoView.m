//
//  HTViedoView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTViedoView.h"

@interface HTViedoView ()

@property (nonatomic,strong)UIImageView * imageView;
@property (nonatomic,strong)UIImageView * videoView;
@property (nonatomic,strong) HTArticleCellModel * model;
@end



@implementation HTViedoView

- (UIImageView *)videoView
{
    if (!_videoView) {
        _videoView = [[UIImageView alloc] init];
#warning luohaibo 设置视频前面小图标
        _videoView.image = [UIImage imageNamed:@"play"];
    }
    return _videoView;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}



- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView{
    
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.equalTo(self);
        make.width.mas_equalTo(kAdaptedWidth(120));
        
    }];
    
    [self addSubview:self.videoView];
    [self.videoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.imageView);
        make.height.width.mas_equalTo(kAdaptedWidth(40));
        
    }];
}


- (void)configArticleView:(HTArticleCellModel *)model{
    _model = model;
#warning luohaibi  设置视频图片
}

- (CGFloat)getHeight
{
    return kAdaptedWidth(180);
}


@end
