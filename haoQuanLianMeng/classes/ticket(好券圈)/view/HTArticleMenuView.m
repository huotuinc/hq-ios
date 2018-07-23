//
//  HTArticleMenuView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTArticleMenuView.h"
#import "HTArticleCellModel.h"
#import <AssetsLibrary/AssetsLibrary.h>
@implementation HTMenuButton


- (void)setMenubuttontype:(HTMenuButtonType)menubuttontype{
    _menubuttontype = menubuttontype;
    if (HTMenuButtonTypeDownLoadVideo == menubuttontype) {
        [self setTitle:@"保存视频" forState:UIControlStateNormal];
    }
    if (HTMenuButtonTypeCopy == menubuttontype) {
        [self setTitle:@"复制文本" forState:UIControlStateNormal];
    }
}
@end


@interface HTArticleMenuView()

@property (nonatomic ,strong) HTMenuButton *firstBtn;
@property (nonatomic ,strong) HTMenuButton * secondBtn;

@property (nonatomic ,strong) UIView * sliderView;

@property (nonatomic ,strong) UIView * sliderCenterView;


//数据模型
@property (nonatomic,strong) HTArticleCellModel * model;


@end


@implementation HTArticleMenuView


- (UIView *)sliderView{
    if (_sliderView == nil) {
        _sliderView = [[UIView alloc] init];
        _sliderView.backgroundColor = LWColor(231, 230, 232);
    }
    return _sliderView;
}

- (UIView *)sliderCenterView{
    if (_sliderCenterView == nil) {
        _sliderCenterView = [[UIView alloc] init];
        _sliderCenterView.backgroundColor = [UIColor blackColor];
        _sliderCenterView.backgroundColor = LWColor(231, 230, 232);
    }
    return _sliderCenterView;
}


- (HTMenuButton *)firstBtn{
    if (!_firstBtn) {
        _firstBtn = [HTMenuButton buttonWithType:UIButtonTypeCustom];
        _firstBtn.tag = 1001;
        _firstBtn.titleLabel.font = kAdaptedFontSize(13);
        _firstBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_firstBtn setImageEdgeInsets:UIEdgeInsetsMake(0, kAdaptedWidth(-5), 0, 0)];
        [_firstBtn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        [_firstBtn setTitle:@"下载图片" forState:UIControlStateNormal];
        [_firstBtn setTitleColor:LWColor(117, 117, 117) forState:UIControlStateNormal];
        [_firstBtn addTarget:self action:@selector(selectMenu:) forControlEvents:UIControlEventTouchUpInside];
        [_firstBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    }
    return _firstBtn
    ;
}


- (HTMenuButton *)secondBtn{
    if (!_secondBtn) {
        _secondBtn = [HTMenuButton buttonWithType:UIButtonTypeCustom];
        _secondBtn.tag = 1001;
        _secondBtn.titleLabel.font = kAdaptedFontSize(13);
        _secondBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_secondBtn setImageEdgeInsets:UIEdgeInsetsMake(0, kAdaptedWidth(-5), 0, 0)];
        [_secondBtn setImage:[UIImage imageNamed:@"turn"] forState:UIControlStateNormal];
        [_secondBtn setTitle:@"一键转发" forState:UIControlStateNormal];
        [_secondBtn setTitleColor:LWColor(117, 117, 117) forState:UIControlStateNormal];
        [_secondBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        [_secondBtn addTarget:self action:@selector(shareMenuClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _secondBtn;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupView];
        self.userInteractionEnabled = YES;
    }
    return self;
}
- (void)setupView{
    
    [self addSubview:self.sliderView];
    [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(kAdaptedWidth(20));
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(.8f);
        make.top.equalTo(self);
    }];
    
    [self addSubview:self.sliderCenterView];
    [self.sliderCenterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(.8f);
        make.top.equalTo(self).mas_offset(5);
        make.bottom.equalTo(self).mas_offset(-5);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    
    [self addSubview:self.firstBtn];
    [self.firstBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self.sliderCenterView.mas_left);
        make.top.equalTo(self.sliderView.mas_bottom);
        make.bottom.equalTo(self);
    }];
    
    [self addSubview:self.secondBtn];
    [self.secondBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sliderCenterView.mas_right);
        make.right.equalTo(self);
        make.top.equalTo(self.sliderView.mas_bottom);
        make.bottom.equalTo(self);
    }];
    
}

- (void)configArticleView:(HTArticleCellModel *)cellModel withDelegate:(id<HTMenuViewDelegate>)delegate{
    
    _cellModel = cellModel;
    _delegate = delegate;
    
    //0:普通 1:图片 2:视频 HTMenuButtonTypeDownLoadImage,
    //HTMenuButtonTypeDownLoadVideo,
    
    switch (cellModel.articleType) {
        case HTArticleTypeMoreImage:
            self.firstBtn.menubuttontype = HTMenuButtonTypeDownLoadImage;            break;
        case HTArticleTypeVideo:
            self.firstBtn.menubuttontype = HTMenuButtonTypeDownLoadVideo;
            break;
        case HTArticleTypeTitle:
            self.firstBtn.menubuttontype = HTMenuButtonTypeCopy;
            break;
        default:
            break;
    }
}

- (void)selectMenu:(HTMenuButton *)btn{
    
    LWLog(@"%lu",(unsigned long)btn.menubuttontype);
    switch (btn.menubuttontype) { //图片
        case HTMenuButtonTypeDownLoadImage:
            [self downLoadImagesWithShare:0];
            break;
        
        case HTMenuButtonTypeDownLoadVideo: //下载视频
            [self downVedio];
            break;
        default:
            break;
    }
}


- (void)downVedio{
    
    
}

- (void)downLoadVideo
{
    
    
    
////    programView * VedioDownView = [[programView alloc] initWithFrame:CGRectMake(0,0, kScreenWidth , kScreenHeight)];
////    //            pc.bounds = CGRectMake(0, 0, KScreenWidth * 0.8, KScreenHeight * 0.3);
////    //            pc.center = CGPointMake(KScreenWidth * 0.5, KScreenHeight * 0.5);
////    _VedioDownView = VedioDownView;
////    VedioDownView.delegate = self;
////    [[UIApplication sharedApplication].keyWindow addSubview:VedioDownView];
//    
//    
//    NSString * vedioUrl = [self.cellModel.article.VideoUrls firstObject];
//    //  下载视频
//    //1.创建会话管理者
//    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
//    NSURL *url = [NSURL URLWithString:vedioUrl];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    __weak typeof(self) wself = self;
//    
//    //2.下载文件
//    /*
//     
//     第一个参数:请求对象
//     
//     第二个参数:progress 进度回调 downloadProgress
//     
//     第三个参数:destination 回调(目标位置)
//     
//     有返回值
//     
//     targetPath:临时文件路径
//     
//     response:响应头信息
//     
//     第四个参数:completionHandler 下载完成之后的回调
//     
//     filePath:最终的文件路径
//     
//     */
//    NSURLSessionDownloadTask *download = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
//        //监听下载进度
//        //completedUnitCount 已经下载的数据大小
//        //totalUnitCount     文件数据的中大小
//        CGFloat aa = 1.0 *downloadProgress.completedUnitCount / downloadProgress.totalUnitCount;
//        LWLog(@"%f",aa);
//        wself.VedioDownView.progressBarRoundedSlim.progress = aa;
//    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
//        NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:response.suggestedFilename];
//        NSLog(@"targetPath:%@",targetPath);
//        
//        NSLog(@"fullPath:%@",fullPath);
//        return [NSURL fileURLWithPath:fullPath];
//        
//    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
//        NSLog(@"%@",[filePath.absoluteString substringFromIndex:7]);
//        if (!error) {
//            
//            wself.VedioDownView.titlex.text = @"视频下载成功";
//            [wself saveVedio:[filePath.absoluteString substringFromIndex:8]];
//        }else{
//            [UIView animateWithDuration:0.5 animations:^{
//                [self.VedioDownView removeFromSuperview];
//            } completion:^(BOOL finished) {
//                [MBProgressHUD showMessage:@"视频保存失败"];
//            }];
//        }
//        
//    }];
//    _download = download;
//    //3.执行Task
//    [download resume];
}


- (void)shareClick:(NSMutableArray * )imageArray {
    
    // 设置分享内容
//    NSString *text = @"分享内容";
//    UIImage *image = [UIImage imageNamed:@"play"];
//    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSArray *activityItems = [imageArray copy];
    LWLog(@"xxxxxxx");
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
//    activityViewController.excludedActivityTypes = @[UIActivityTypePostToFacebook,UIActivityTypePostToTwitter, UIActivityTypePostToWeibo,UIActivityTypePrint,UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll,UIActivityTypeAddToReadingList,UIActivityTypePostToFlickr,UIActivityTypePostToVimeo,UIActivityTypePostToTencentWeibo,UIActivityTypeAirDrop,UIActivityTypeOpenInIBooks];
    activityViewController.excludedActivityTypes = @[UIActivityTypePostToFacebook,UIActivityTypePostToTwitter, UIActivityTypePostToWeibo,UIActivityTypeMessage,UIActivityTypeMail,UIActivityTypePrint,UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll,UIActivityTypeAddToReadingList,UIActivityTypePostToFlickr,UIActivityTypePostToVimeo,UIActivityTypePostToTencentWeibo,UIActivityTypeAirDrop,UIActivityTypeOpenInIBooks];
    [self.viewContainingController presentViewController:activityViewController animated:YES completion:nil];
    
    // 选中活动列表类型
    [activityViewController setCompletionWithItemsHandler:^(NSString * __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError){
        NSLog(@"act type %@",activityType);
        if (!activityError) {
           [self shareStatus];
        }
        
    }];
}


- (void)shareStatus{
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"dataId"] = @(self.model.article.dataId);
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"Material/success" parame:dict isHud:NO isHaseCache:NO success:^(id json) {
        
    } failure:^(NSError *error) {
        
    }];
}


//右边的分享
- (void)shareMenuClick:(HTMenuButton *)btn{
    
    UIPasteboard * tt = [UIPasteboard generalPasteboard];
    tt.string = [self.cellModel.article.Content copy];
    
    [[HTTool HTToolShare] showInfo:@"文案已付之" withBlock:^{
        [self downLoadImagesWithShare:1];
    }];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        //    [self shareClick];
//    });
    
//    if ([self.delegate respondsToSelector:@selector(shareADKWithCellModel:)]) {
//        [self.delegate shareADKWithCellModel:self.cellModel];
//    }
}


- (void)downLoadImagesWithShare:(int) type //1 表示分享下载
{
    //[MobClick event:kUmeng_event_saveImages label:[NSString stringWithFormat:@"%d",self.cellModel.article.goodsId]];
    //saveImageView *save = [MBProgressHUD showSaveImageProgress];
    NSArray * imagesPath = self.cellModel.article.ImageUrls;
    MBProgressHUD * hub = [MBProgressHUD showWaittingView:[NSString stringWithFormat:@"正在下载%lu张图片到本地",(unsigned long)imagesPath.count]];
    KWeakSelf(self);
    [self downloadImages:imagesPath completion:^(NSMutableArray* obj) {
//        [self writeImages:obj completion:^(id error) {
        [hub hide:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD showSuccess:@"下载成功"];
            if (type == 1) {
                [weakself shareClick:obj];
                
               
            }
        });
//            [MBProgressHUD showXZSuecceView:[NSString stringWithFormat:@"成功保存%lu张图到本地相册",(unsigned long)imagesPath.count] image:[UIImage imageNamed:@"成功"] iconImage:[UIImage imageNamed:@"下载_黑色"]];
//
//        }];
    }];
}

//- (void) writeImages:(NSMutableArray*)images
//          completion:(void(^)(id obj))completionHandler {
//    if ([images count] == 0) {
//
//        if (completionHandler) {
//            // Signal completion to the call-site. Use an appropriate result,
//            // instead of @"finished" possibly pass an array of URLs and NSErrors
//            // generated below  in "handle URL or error".
//            completionHandler(@"images are all saved.");
//        }
//        return;
//    }
//    UIImage* image = [images firstObject];
//    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
//    [assetsLibrary writeImageToSavedPhotosAlbum:image.CGImage
//                                    orientation:ALAssetOrientationUp
//                                completionBlock:^(NSURL *assetURL, NSError *error){
//                                    // Caution: check the execution context - it may be any thread,
//                                    // possibly use dispatch_async to dispatch to the main thread or
//                                    // any other queue.
//                                    // handle URL or error
//                                    if (error) {
//                                        NSLog(@"error = %@", [error localizedDescription]);
//                                        //isImagesSavedFailed = true;
//                                        return;
//                                    }
//                                    [images removeObjectAtIndex:0];
//                                    // next image:
//                                    [self writeImages:images completion:completionHandler];
//                                }];
//}




- (void)downloadImages:(NSArray *)imagesPath completion:(void(^)(id obj))completionHandler {
    
    
    NSMutableArray * arr = [NSMutableArray array];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    for (NSString * str in imagesPath) {

        dispatch_group_async(group, queue, ^{
            NSURL *url = [NSURL URLWithString:str];
            [[SDWebImageManager sharedManager] diskImageExistsForURL:nil completion:^(BOOL isInCache) {
                if (isInCache) {
                    NSString *key = [[SDWebImageManager sharedManager] cacheKeyForURL:url];
                    UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:key];
                    [arr addObject:image];
                } else {
                    NSError *error = nil;
                    NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingMappedIfSafe error:&error];
                    if (error) {
                        //图片失败。。。
                        //[arr addObject:error];
                    } else {
                        UIImage *image = [UIImage imageWithData:data];
                        [[SDWebImageManager sharedManager] saveImageToCache:image forURL:url];
                        [arr addObject:image];
                    }
                }
            }];
        });
        
    }
    dispatch_group_notify(group, queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(arr);
        });
    });
}




@end
