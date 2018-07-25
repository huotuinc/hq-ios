//
//  QuanDetailViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/31.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "QuanDetailViewController.h"
#import "QuanDetailBottomView.h"
#import "QuanDetailTitleView.h"
#import "QuanDetailModel.h"


@interface QuanDetailViewController ()<SDCycleScrollViewDelegate>


@property (nonatomic,strong) UIButton * btn;

@property (nonatomic,strong) UIScrollView * container;

@property (nonatomic,strong) QuanDetailBottomView * quanBottom;



//商品大图
@property (nonatomic,strong) SDCycleScrollView  * headIconView;

@property (nonatomic,strong) QuanDetailTitleView  * centerHeaderView;


@property (nonatomic,strong) NSMutableArray * lastView;


@property (nonatomic,strong) QuanDetailModel * model;
@end

@implementation QuanDetailViewController


- (NSMutableArray *)lastView{
    if (_lastView == nil) {
        _lastView = [NSMutableArray array];
    }
    return _lastView;
}

- (SDCycleScrollView *)headIconView{
    if (_headIconView == nil) {
        _headIconView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenWidth) delegate:self placeholderImage:nil];
        _headIconView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
//        _headIconView.hidesForSinglePage = YES;
        _headIconView.autoScrollTimeInterval = 5;
    }
    return _headIconView;
}



- (QuanDetailTitleView *)centerHeaderView{
    if (_centerHeaderView == nil) {
        _centerHeaderView = [[QuanDetailTitleView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 0)];
        _centerHeaderView.backgroundColor = [UIColor whiteColor];
    }
    return _centerHeaderView;
}




- (QuanDetailBottomView *)quanBottom{
    if (_quanBottom == nil) {
        _quanBottom = [[QuanDetailBottomView alloc] init];
        [_quanBottom setTitle:@"立即分享"];
        _quanBottom.userInteractionEnabled = YES;
        UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareClick)];
        [_quanBottom addGestureRecognizer:ges];
    }
    return _quanBottom;
}


- (void)shareClick{
    
    LWLog(@"xxxx");
    [self shareClickTT];
}


- (void)shareClickTT{
    
    // 设置分享内容
    NSString *text = self.model.title;
    NSArray * cc =  [self.model.pictures componentsSeparatedByString:@","];
    NSString * image;
    if (cc) {
        image = [cc firstObject];
    }
    
//    UIImage *image = [UIImage imageNamed:@"play"];
    NSURL *url = [NSURL URLWithString:self.model.shareUrl];
    NSArray *activityItems = @[text,url];
    LWLog(@"xxxxxxx");
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    //    activityViewController.excludedActivityTypes = @[UIActivityTypePostToFacebook,UIActivityTypePostToTwitter, UIActivityTypePostToWeibo,UIActivityTypePrint,UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll,UIActivityTypeAddToReadingList,UIActivityTypePostToFlickr,UIActivityTypePostToVimeo,UIActivityTypePostToTencentWeibo,UIActivityTypeAirDrop,UIActivityTypeOpenInIBooks];
    activityViewController.excludedActivityTypes = @[UIActivityTypePostToFacebook,UIActivityTypePostToTwitter, UIActivityTypePostToWeibo,UIActivityTypeMessage,UIActivityTypeMail,UIActivityTypePrint,UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll,UIActivityTypeAddToReadingList,UIActivityTypePostToFlickr,UIActivityTypePostToVimeo,UIActivityTypePostToTencentWeibo,UIActivityTypeAirDrop,UIActivityTypeOpenInIBooks];
    [self presentViewController:activityViewController animated:YES completion:nil];
    
    // 选中活动列表类型
    [activityViewController setCompletionWithItemsHandler:^(NSString * __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError){
        NSLog(@"act type %@",activityType);
//        if (!activityError) {
//            [self shareStatus];
//        }
        
    }];
}


- (UIScrollView *)container{
    if (_container == nil) {
        _container = [[UIScrollView alloc] init];
        _container.contentInset = UIEdgeInsetsMake(0, 0, 88, 0);
    }
    return _container;
}


- (UIButton *)btn{
    if (_btn == nil) {
        _btn = [[UIButton alloc] init];
        [_btn setImage:[UIImage imageNamed:@"quan_back"] forState:UIControlStateNormal];
        [_btn sizeToFit];
    }
    return _btn;
}



- (void)getGoodDetail{

//    /store/goodsInfo
    NSMutableDictionary * parame = [NSMutableDictionary dictionary];
    parame[@"goodsId"] = @(self.goodId);
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"store/goodsInfo" parame:parame isHud:YES isHaseCache:NO success:^(id json) {
        LWLog(@"%@",json);
        QuanDetailModel * model = [QuanDetailModel mj_objectWithKeyValues:json[@"data"]];
        [self setUpInit:model];
        self.model = model;
    } failure:^(NSError *error) {
        
    }];
}



- (void)setUpInit:(QuanDetailModel *)model{
    
    self.navigationItem.title = model.title;
    
    if (model.pictures.length) {
       self.headIconView.imageURLStringsGroup = [model.pictures componentsSeparatedByString:@","];
    }
   
    
    self.container.backgroundColor = LWColor(240, 239, 244);
    [self.container addSubview:self.headIconView];
    
    
    [self.centerHeaderView configure:model];
    CGFloat height = 0;
    if (self.isDaiLi) {
        height = kAdaptedWidth(40) + kAdaptedWidth(30) + kAdaptedWidth(30) + 20;
    }else{
        height = kAdaptedWidth(40) + kAdaptedWidth(30) + kAdaptedWidth(20) + 20;
    }
    self.centerHeaderView.frame = CGRectMake(0, KScreenWidth, KScreenWidth, height);
    [self.container addSubview:self.centerHeaderView];
   
    
    
    
    
    [self.lastView addObject:self.centerHeaderView];
    
    
    
    
    
//    __block CGFloat inHeight = 0;
    for (int i = 0; i < model.intro.count; i++) {
        
        [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:[model.intro objectAtIndex:i]] options:SDWebImageLowPriority progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
            
            if (error) {
                return ;
            }
            UIImageView * sd = [[UIImageView alloc] init];
            sd.image = image;
            [self.container addSubview:sd];
            
            UIView * frame =  [self.lastView lastObject];
            CGFloat ts = image.size.height  * KScreenWidth * 1.0 / image.size.width;
            CGFloat y = CGRectGetMaxY(frame.frame);
            if (i == 0) {
                y += 10;
            }
            sd.frame = CGRectMake(0, y, KScreenWidth, ts);
            [self.lastView addObject:sd];
            
            self.container.contentSize = CGSizeMake(KScreenWidth, CGRectGetMaxY(sd.frame));
            
            
        }];
    }
    UIView * ss =  [self.lastView lastObject];
    LWLog(@"%@",NSStringFromCGRect(ss.frame));
    LWLog(@"%f",ss.frame.origin.y + ss.frame.size.height);
    
    //CGSizeMake(KScreenWidth, CGRectGetMaxY(self.lastView.frame));
//    self.container.contentSize = CGSizeMake(KScreenWidth, CGRectGetMaxY(frame.frame));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.quanBottom];
    self.quanBottom.backgroundColor = [UIColor redColor];
    [self.quanBottom setTitle:@"立即分享"];
    [self.quanBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
    
    
    [self.view addSubview:self.container];
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.bottom.mas_equalTo(self.quanBottom.mas_top);
    }];
    
    //获取数据
    [self getGoodDetail];
    
    
  
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
