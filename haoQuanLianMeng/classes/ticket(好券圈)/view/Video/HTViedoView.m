//
//  HTViedoView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTViedoView.h"
#import "WCSPreviewViewController.h"

@interface HTViedoView ()

@property (nonatomic,strong)UIImageView * imageView;
@property (nonatomic,strong)UIImageView * videoView;
@property (nonatomic,strong) HTArticleCellModel * model;
@end



@implementation HTViedoView


- (void)btnPay{
    NSString * url =  [self.model.article.VideoUrls firstObject];
    WCSPreviewViewController *vc  =[[WCSPreviewViewController alloc] init];
    vc.videoURL = [NSURL URLWithString:url];
    
    [self.viewContainingController presentViewController:vc animated:YES completion:^{
        
    }];
}

- (UIImageView *)videoView
{
    if (!_videoView) {
        _videoView = [[UIImageView alloc] init];
        _videoView.image = [UIImage imageNamed:@"play"];
        _videoView.userInteractionEnabled = YES;
        __weak typeof(self) wself = self;
        [_videoView bk_whenTapped:^{
            [wself btnPay];
        }];
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
    NSString * url =  [model.article.VideoPictureUrls firstObject];
//#warning luohaibi  设置视频图片
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:url]];
}

- (CGFloat)getHeight
{
    return kAdaptedWidth(180);
}


@end
