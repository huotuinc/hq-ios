//
//  PushWebViewController.m
//  HuoBanMallBuy
//
//  Created by lhb on 15/10/9.
//  Copyright (c) 2015年 HT. All rights reserved.
//  跳转的网页页面

#import "WKWebViewController.h"
#import "MD5Encryption.h"
#import "HTNSMutableURLRequest.h"
#import <WebKit/WebKit.h>

//#import "HeiMingViewController.h"
//#import "XiongYongRenZhengController.h"
//#import "HTNSMutableURLRequest.h"
//#import "WKCookieSyncManager.h"
@interface WKWebViewController ()<WKUIDelegate,WKNavigationDelegate>

@property (strong, nonatomic) WKWebView *webView;

@property (strong, nonatomic) UIButton * shareBtn;

@property (strong, nonatomic) UIProgressView *progressView;

@end


@implementation WKWebViewController



- (UIButton *)shareBtn{
    if (_shareBtn == nil) {
        _shareBtn = [[UIButton alloc] init];
        _shareBtn.frame = CGRectMake(0, 0, 25, 25);
//        _shareBtn.userInteractionEnabled = NO;
//        [_shareBtn addTarget:self action:@selector(shareBtnClick) forControlEvents:UIControlEventTouchUpInside];
//        [_shareBtn setBackgroundImage:[UIImage imageNamed:@"home_title_right_share"] forState:UIControlStateNormal];
    }
    return _shareBtn;
}


//-(UIButton *)refreshBtn{
//    if (_refreshBtn == nil) {
//        _refreshBtn = [[UIButton alloc] init];
//        _refreshBtn.frame = CGRectMake(0, 0, 25, 25);
//        [_refreshBtn addTarget:self action:@selector(refreshToWebView) forControlEvents:UIControlEventTouchUpInside];
//        [_refreshBtn setBackgroundImage:[UIImage imageNamed:@"main_title_left_refresh"] forState:UIControlStateNormal];
//        [_refreshBtn setBackgroundImage:[UIImage imageNamed:@"loading"] forState:UIControlStateHighlighted];
//    }
//    return _refreshBtn;
//}

//- (NSString * )resetUserAgent{
//    //WeChatModel * model = [WeChatModel WeChatModelModelGetFromCache];
//    OutFitUserModel * Uer = [OutFitUserModel outFitUserModelGetFromCache];
//    NSString *userID = [NSString stringWithFormat:@"%d",Uer.userId];
//    //    NSString *tempUserId = [(NSNumber*)userID  stringValue]
//    if ([NSString stringWithFormat:@"%@", userID].length == 0) {
//        userID = @"";
//    }
//    if (Uer) {
//        if (Uer.unionid) {
//        }else {
//            Uer.unionid = @"";
//        }
//        if (Uer.openid) {
//        }else {
//            Uer.openid= @"";
//        }
//    }
//    NSString *str = [MD5Encryption md5by32:[NSString stringWithFormat: @"%@%@%@%@",userID, Uer.unionid, Uer.openid, @"08afd6f9ae0c6017d105b4ce580de885"]];
//    NSString * newAgent = [NSString stringWithFormat: @";mobile;hottec:%@:%@:%@:%@;",str,userID, Uer.unionid, Uer.openid];
//    return newAgent;
//}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
//    delegate.currentVC = self;
    
//    [[HTTool HTToolShare] NHToolSetCookes];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.hidden = NO;
    
    WKWebViewConfiguration * internalConfig = [[WKWebViewConfiguration alloc] init];
//    WKCookieSyncManager * ma = [WKCookieSyncManager shareInstance];
//    internalConfig.processPool = ma.processPool;
    
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) configuration:internalConfig];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
//    self.webView.customUserAgent = [self resetUserAgent];
//    [self.view addSubview:self.webView];
    
//    LWLog(@"%@",[self resetUserAgent]);
    self.view = _webView;
    
//    if (!self.funUrl) {
//
////        OutFitUserModel * usermodel = [OutFitUserModel outFitUserModelGetFromCache];
////        self.funUrl = [NSString stringWithFormat:@"http://m.xingzhuangmall.com/UserCenter/Index.aspx?customerid=4886&userType=%d&userid=%d",usermodel.userType,usermodel.userId];
//    }
    //gh_credit://authTaobao
    //NSURL * urlStr = [NSURL URLWithString:@"gh_credit_authtaobao"
//                      ];
    
//    self.funUrl = @"http://youxin.51huotao.com/cookie";
    NSString *encodeUrl;
    if (self.needEnCode) {
        encodeUrl = [self.funUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
      
    }else{
      encodeUrl = [self.funUrl copy];
    }
//
    LWLog(@"%@",self.funUrl);
    NSURL * urlStr = [NSURL URLWithString:encodeUrl];
    NSMutableURLRequest * req = [[HTNSMutableURLRequest alloc] initWithURL:urlStr];
//    req.allHTTPHeaderFields = [[HTTool HTToolShare] NHToolSetCookes];
    
//    [self.webView loadRequest:req];
    //加载刷新控件
//    [self AddMjRefresh];
    
    [self initWebViewProgress];
    
    [self.webView loadRequest:req];
    

    

    
}
- (void)BackToHome{
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.webView evaluateJavaScript:@"document.title" completionHandler:^(id _Nullable title, NSError * _Nullable error) {
        
        if (!error) {
            self.navigationItem.title = title;
        }else{
            
//            self.navigationItem.title = NewOutFitName;
        }
    }];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    self.webView.frame = self.view.frame;
//    NSURL * urlStr = [NSURL URLWithString:_funUrl];
//    NSURLRequest * req = [[NSURLRequest alloc] initWithURL:urlStr];
//    self.webView.tag = 20;
//    [self.webView loadRequest:req];
    
//    LWLog(@"%@",NSStringFromCGRect(self.view.frame));
}

//- (void)AddMjRefresh{
//    // 添加下拉刷新控件
//    MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    // 隐藏时间
//    header.lastUpdatedTimeLabel.hidden = YES;
//    // 隐藏状态
//    header.stateLabel.hidden = YES;
//    header.arrowView.image= nil;
//    self.webView.scrollView.mj_header = header;
//}


/*
 *网页下拉刷新
 */
- (void)loadNewData{
    
    [self.webView reload];
}



/**
 *  返回
 */
- (void)back{
    
    [self.webView goBack];
}

/**
 *  刷新
 */
- (void)refreshToWebView{
   
//    
//    [_refreshBtn setBackgroundImage:[UIImage imageNamed:@"loading"] forState:UIControlStateNormal];
//    self.refreshBtn.userInteractionEnabled = NO;
//    [self.webView reload];
}


/**
 *  分享
 */
- (void)shareBtnClick{

    
//    [self shareSdkSha];
}





- (void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark 切换账号


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [_progressView removeFromSuperview];
}

#pragma mark wk


//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
//
//    LWLog(@"decidePolicyForNavigationResponse");
//    NSString *temp = webView.URL.absoluteString;
//    LWLog(@"%@",temp);
//    LWLog(@"decidePolicyForNavigationResponse");
//    //NSString *temp = webView.URL.absoluteString;
//    LWLog(@"%@",temp);
//    NSString *url = [temp lowercaseString];
//
////    if ([url isEqualToString:@"about:blank"]) {
////        decisionHandler(WKNavigationActionPolicyCancel);
////    }
//    
//    decisionHandler(WKNavigationActionPolicyAllow);
//    //gh_credit://authTaobao
//    //gh_credit://authTaobao
//    if ([url rangeOfString:@"gh_credit_authtaobao"].location !=  NSNotFound) {
//        //gh_credit://authTaobao?orderId=" + order.getOrderId();
//        NSRange rang = [temp rangeOfString:@"orderId="];
//        NSRange orderIdRang = NSMakeRange(rang.location + rang.length, temp.length - (rang.location + rang.length));
//
//        decisionHandler(WKNavigationActionPolicyCancel);
//        [self openAfterthing:[temp substringWithRange:orderIdRang]];
//    }else{
//        decisionHandler(WKNavigationActionPolicyAllow);
//    }
//
//
//}



- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {

    LWLog(@"decidePolicyForNavigationResponse");
    NSString *temp = webView.URL.absoluteString;
    LWLog(@"%@",temp);
    NSString *url = [temp lowercaseString];

//    if ([url isEqualToString:@"about:blank"]) {
//        decisionHandler(WKNavigationResponsePolicyCancel);
//    }
//
//    if ([url rangeOfString:@"gh_credit_authtaobao"].location !=  NSNotFound) {
//        decisionHandler(WKNavigationResponsePolicyCancel);
//        NSRange rang = [temp rangeOfString:@"orderId="];
//        NSRange orderIdRang = NSMakeRange(rang.location + rang.length, temp.length - (rang.location + rang.length));
//        [self openAfterthing:[temp substringWithRange:orderIdRang] andType:0];
//    }else if([url rangeOfString:@"gh_credit_authjindong"].location !=  NSNotFound){
//        decisionHandler(WKNavigationResponsePolicyCancel);
//        NSRange rang = [temp rangeOfString:@"orderId="];
//        NSRange orderIdRang = NSMakeRange(rang.location + rang.length, temp.length - (rang.location + rang.length));
//        [self openAfterthing:[temp substringWithRange:orderIdRang] andType:1];
//    }else if([url rangeOfString:@"/authentication"].location !=  NSNotFound){
//        decisionHandler(WKNavigationResponsePolicyCancel);
//        NSArray * vcs =  self.navigationController.viewControllers;
//        for (int i = 0; i < vcs.count; i++) {
//            UIViewController * vc =  [vcs objectAtIndex:i];
//            if ([vc isKindOfClass:[XiongYongRenZhengController class]]) {
//                [self.navigationController popToViewController:vc animated:YES];
//            }
//        }
//    }else{
//        decisionHandler(WKNavigationResponsePolicyAllow);
//    }
    decisionHandler(WKNavigationResponsePolicyAllow);
}


/**
 <#Description#>

 @param type 0 淘宝  1 京东
 */
- (void)openAfterthing:(NSString *)orderId andType:(int)type{
//
//    self.orderId = [orderId copy];
//
//    PBBaseReq *br = [PBBaseReq new];
//    br.partnerCode=partner_code;//合作方code
//    br.partnerKey = partner_key;//合作方key
//
//    if (type == 0) {
//        br.channel_code = @"005003";//授权渠道code
//    }else{
//        br.channel_code = @"005011";//授权渠道code
//    }
//
//    /*
//     基础设置
//     如果不用自定义PBBaseSet，withBaseSet传nil
//     如果只用某一个颜色、字体大小、图片，创建PBBaseSet对象，给相应颜色、字体大小、图片的对象即可.
//     */
//    PBBaseSet *set = [PBBaseSet new];
//    //导航栏颜色
//    set.navBGColor = AppMainColor;
//    //导航栏标题颜色
//    set.navTitleColor = [UIColor whiteColor];
//    //导航栏标题字体
//    set.navTitleFont = [UIFont systemFontOfSize:19];
//    //导航栏按钮图片
//    set.backBtnImage = [UIImage imageNamed:@"icon_back_PB"];
//
//
//    [shujumohePB openPBPluginAtViewController:self withDelegate:self withReq:br withBaseSet:set];
//
//    [self.navigationController popToRootViewControllerAnimated:NO];
//
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"goOrderList" object:nil];
}


- (void)showInfo:(NSString *)message
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, (height-50)/2, width-2*50, 50)];
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    label.text = message;
    label.textAlignment = NSTextAlignmentCenter;
    label.clipsToBounds = YES;
    label.adjustsFontSizeToFitWidth = YES;
    label.minimumScaleFactor = 0.6;
    label.layer.cornerRadius = 7;
    [[UIApplication sharedApplication].keyWindow addSubview:label];
    
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        label.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [label removeFromSuperview];
    }];
}



- (void)thePBMissionWithCode:(NSString *)code withMessage:(NSString *)message{
    
//    LWLog(@"%@---%@",code,self.orderId);
//    if ([code intValue] == 0) {
//        
//        NSMutableDictionary * dict = [NSMutableDictionary dictionary];
//        dict[@"orderId"] = self.orderId;
//        dict[@"taskId"] = message;
//        [HTNetworkingTool HTNetworkingToolPost:@"carrier/saveTaskId" parame:dict isHud:NO success:^(id json) {
//            LWLog(@"%@",json);
//        } failure:^(NSError *error) {
//        }];
//        
//        
////        if (self.navigationController) {
////            <#statements#>
////        }
//        NSArray * vcs =  self.navigationController.viewControllers;
//        for (int i = 0; i < vcs.count; i++) {
//            UIViewController * vc =  [vcs objectAtIndex:i];
//            if ([vc isKindOfClass:[HeiMingViewController class]]) {
//                [self.navigationController popToViewController:vc animated:YES];
//                break;
//            }
//            if ([vc isKindOfClass:[OrderTableViewController class]]) {
//                [self.navigationController popToViewController:vc animated:YES];
//                break;
//            }
//        }
//        [self showInfo:@"请求已提交，稍后请去订单列表刷新查看"];
//        //[SVProgressHUD showSuccessWithStatus:@"请求已提交，请去订单列表查看"];
//    }else{
//        [self.navigationController popViewControllerAnimated:YES];
//    }
}


- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {

    [webView evaluateJavaScript:@"document.title" completionHandler:^(id _Nullable title, NSError * _Nullable error) {
        
        if (!error) {
            self.navigationItem.title = title;
        }else{
            
//            self.navigationItem.title = NewOutFitName; 
        }
    }];

    if(self.delegate){
        
        
    }
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    _shareBtn.userInteractionEnabled = NO;
}


- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(nonnull NSString *)message initiatedByFrame:(nonnull WKFrameInfo *)frame completionHandler:(nonnull void (^)(BOOL))completionHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }])];
    [alertController addAction:([UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }])];    [self presentViewController:alertController animated:YES completion:nil];
}

/**
 *  初始化进度条
 */
- (void)initWebViewProgress {
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    CGFloat progressBarHeight = 2.f;
    CGRect navigationBarBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0, navigationBarBounds.size.height - progressBarHeight, navigationBarBounds.size.width, progressBarHeight);
    self.progressView = [[UIProgressView alloc] initWithFrame:barFrame];
    self.progressView.tintColor = [UIColor greenColor];
    self.progressView.trackTintColor = LWColor(255, 255, 255);
    [self.navigationController.navigationBar addSubview:_progressView];
    
}

// 计算wkWebView进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        if (newprogress == 1) {
            self.progressView.hidden = YES;
            [self.progressView setProgress:0 animated:NO];
        }else {
            self.progressView.hidden = NO;
            [self.progressView setProgress:newprogress animated:YES];
        }
    }
}


#pragma mark 微信授权登录

@end
