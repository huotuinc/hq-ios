//
// Created by 罗海波 on 2018/6/12.
// Copyright (c) 2018 HT. All rights reserved.
//

#import "LWLaunchViewController.h"
#import "LWTabBarController.h"
#import "MfBangDingTableViewController.h"
#import <WXApi.h>


@interface LWLaunchViewController ()<WXLoginDelegate>


@property(nonatomic,strong) UIImageView * backImageView;


@property(nonatomic,strong) UIButton * loginBtn;


@end


@implementation LWLaunchViewController

- (UIButton *)loginBtn {
    if (_loginBtn == nil){
        _loginBtn = [[UIButton alloc] init];
        _loginBtn.center = CGPointMake(KScreenWidth * 0.5, KScreenHeight * 0.5 + kAdaptedHeight(100));
        _loginBtn.bounds = CGRectMake(0, 0, KScreenWidth * 0.6, 44);
        _loginBtn.backgroundColor = [UIColor blackColor];
        
        if ([WXApi isWXAppInstalled]) {
            [_loginBtn setTitle:@"微信授权登录" forState:UIControlStateNormal];
        }else{
            [_loginBtn setTitle:@"立即体验" forState:UIControlStateNormal];
        }
        _loginBtn.layer.cornerRadius = 22;
        [_loginBtn addTarget:self action:@selector(loginIn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (UIImageView *)backImageView{
    if (_backImageView == nil) {
        _backImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    }
    return _backImageView;
}

//登录操作
- (void)loginIn{

    if ([WXApi isWXAppInstalled]) { //正常的登录逻辑
        WXLoginShare * share = [WXLoginShare shareInstance];
        share.delegate = self;
        if ([share wxLoginShareRegisterApp]) {
            [share WXLogin];
        }
    }else{ //没安装微信  和 面对苹果审核


    }
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
    [version mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(kAdaptedHeight(-30));;
    }];


    
  


//    [self checkNetwork];
    
    //ReachabilityChangedNotification
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    

    [self getInitDate];
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


//获取初始化数据
- (void)getInitDate{

    [[HTNetworkingTool HTNetworkingManager]
        HTNetworkingToolPost:@"user/appInit" parame:nil
                       isHud:NO isHaseCache:NO success:^(id json) {
                           LWLog(@"%@",json);
                           HTUserModel * model = [HTUserModel mj_objectWithKeyValues:json[@"data"]];
                           HTAppSettingModel * sett = [HTAppSettingModel mj_objectWithKeyValues:json[@"data"]];
                           [[HTTool HTToolShare] HTToolArchiveRootObject:sett withPath:NSStringFromClass([HTAppSettingModel class])];
                           if (model == nil || !model.userId) {
                               [self showLoginBtn];
                           } else{
                               [[HTTool HTToolShare] HTToolArchiveRootObject:model withPath:NSStringFromClass([HTUserModel class])];
                               [self getInApp];
                           }
            LWLog(@"%@",json);
        } failure:^(NSError *error) {
            LWLog(@"%@",error);
//            [self getInitDate];
        }];
}


//显示登录按钮
- (void)showLoginBtn{
    
    [self.view addSubview:self.loginBtn];
    [UIView animateWithDuration:5
                          delay:1
         usingSpringWithDamping:0.01f
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         _loginBtn.bounds = CGRectMake(0, 0, KScreenWidth * 0.6, 44);
                     } completion:^(BOOL finished) {
                         
                     }];
}


//微信授权登录回调方法
- (void)wxLoginShareSuccess:(NSDictionary *)dict{
    NSMutableDictionary * parame = [NSMutableDictionary dictionary];
    parame[@"openId"] = dict[@"openid"];
#warning luohaibo 修改unionid
    parame[@"unionId"] = @"ovFVjwxPntkPKCv4taywvyW9DgnE";//dict[@"unionid"];
    parame[@"nickName"] = dict[@"nickname"];
    parame[@"userHead"] = dict[@"headimgurl"];
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"user/loginByUnionId" parame:parame isHud:YES isHaseCache:NO success:^(id json) {
        LWLog(@"%@",json);
        HTUserModel * userModel = [HTUserModel mj_objectWithKeyValues:json[@"data"]];
        [[HTTool HTToolShare] HTToolArchiveRootObject:userModel withPath:NSStringFromClass([HTUserModel class])];
         if (userModel.bindedMobile) { //绑定手机了
            [self getInApp];
        }else{ //未绑定手机
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


- (void)getInApp{
    LWTabBarController * vc = [[LWTabBarController alloc] init];//
    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
}


- (void)wxLoginShareFail:(NSDictionary *)dict{
    
    [MBProgressHUD showError:@"微信登录失败"];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {


   
    
    
    
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
