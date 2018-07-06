//
// Created by 罗海波 on 2018/6/12.
// Copyright (c) 2018 HT. All rights reserved.
//

#import "LWLaunchViewController.h"
#import "LWTabBarController.h"
#import "MfBangDingTableViewController.h"



@interface LWLaunchViewController ()<WXLoginDelegate>


@property(nonatomic,strong) UIImageView * backImageView;

@end


@implementation LWLaunchViewController


- (UIImageView *)backImageView{
    if (_backImageView == nil) {
        _backImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    }
    return _backImageView;
}

//- (void)networkStateChange{
//    AFNetworkReachabilityManager *ReachabilityManager = [AFNetworkReachabilityManager sharedManager];
//    //[ReachabilityManager startMonitoring];
//    NSLog(@"manager.isReachable === %d++++++", ReachabilityManager.reachable);
//    if (ReachabilityManager.reachable) {
//        [self loadInitData];
//    }else{
//
//        [[HTTool HTToolShare] showAlertWithController:self andTitle:@"错误提示" andMessage:@"当前手机网络状态不可用,请检查网络状态或修改网络权限" conform:^{
//
//            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//
//            if ([[UIApplication sharedApplication] canOpenURL:url]) {
//
//                [[UIApplication sharedApplication] openURL:url];
//
//            }
//
//        } cancle:^{
//
//        }];
//    }
//
//}


- (void)checkNetwork {
    //__block BOOL result;
    AFNetworkReachabilityManager *ReachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStateChange) name:AFNetworkingReachabilityDidChangeNotification object:nil];
    [ReachabilityManager startMonitoring];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setImage];
    // Do any additional setup after loading the view.
    
//    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
//    delegate.currentVC = self;
    
    
    UILabel * version = [[UILabel alloc] init];
    version.text = [NSString stringWithFormat:@"%@V%@",AppName,AppVersion];
    [self.view addSubview:version];
    
    
    
    
//    [self checkNetwork];
    
    //ReachabilityChangedNotification
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    
    [version mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(kAdaptedHeight(-30));;
    }];
    [self loadInitData];
}



- (void)loadInitData {
    
    
}

//处理白屏问题
- (void)setImage {
    
    CGSize viewSize = CGSizeMake(KScreenWidth, KScreenHeight);
    NSString *viewOrientation = @"Portrait";    //横屏请设置成 @"Landscape"
    NSString *launchImage = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    if (imagesDict.count) {
        for (NSDictionary* dict in imagesDict)
        {
            
            LWLog(@"%@",dict);
            CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
            if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
            {
                launchImage = dict[@"UILaunchImageName"];
            }
        }
        self.backImageView.contentMode = UIViewContentModeScaleAspectFit;
        if(launchImage.length){
            [self.backImageView setImage:[UIImage imageNamed:launchImage]];
        }
        
        [self.view addSubview:self.backImageView];
    }
    
    
}
//微信授权登录回调方法
- (void)wxLoginShareSuccess:(NSDictionary *)dict{

    
    NSMutableDictionary * parame = [NSMutableDictionary dictionary];
    parame[@"openId"] = dict[@"openid"];
    parame[@"unionId"] = dict[@"unionid"];
    parame[@"nickName"] = dict[@"nickname"];
    parame[@"userHead"] = dict[@"headimgurl"];
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolGet:@"user/loginByUnionId" parame:parame isHud:YES isHaseCache:NO success:^(id json) {
        
        LWLog(@"%@",json);
        //json[@"data"]
        HTUserModel * userModel = [HTUserModel mj_objectWithKeyValues:json[@"data"]];
        if (userModel.bindedMobile) {
            LWTabBarController * vc = [[LWTabBarController alloc] init];//
            [UIApplication sharedApplication].keyWindow.rootViewController = vc;
        }else{
            MfBangDingTableViewController * vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MfBangDingTableViewController"];
            vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            vc.phoneType = 0;
            LWNavigationController * nav = [[LWNavigationController alloc] initWithRootViewController:vc];
            [self presentViewController:nav animated:true completion:nil];
            
        }
        
        LWLog(@"%@",dict);
    } failure:^(NSError *error) {
        
    }];
    
    
    
}

- (void)wxLoginShareFail:(NSDictionary *)dict{
    
    [MBProgressHUD showError:@"微信登录失败"];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {

    WXLoginShare * share = [WXLoginShare shareInstance];
    share.delegate = self;
    if ([share wxLoginShareRegisterApp]) {
        [share WXLogin];
    }
   
    
    
    
//    LWLog(@"xxxxxx");
//    [ShareSDK authorize:SSDKPlatformTypeWechat settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
//        //判断状态
//        KWeakSelf(self);
//        LWLog(@"%lu",(unsigned long)state);
//        switch (state) {
//            case SSDKResponseStateSuccess:
//            {
//                
//                LWLog(@"%@",user.rawData);
////                WeChatModel * weChatModel = [WeChatModel mj_objectWithKeyValues:user.rawData];
////                [weChatModel WeChatModelWriteToCache];
////                [self  loginInMall];
//                break;
//            }
//                
//            default:
//            {
////                [MBProgressHUD showError:@"授权失败"];
//                break;
//            }
//                
//        }
//    }];
    


}


@end
