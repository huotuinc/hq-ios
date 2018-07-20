//
//  WXLoginShare.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/12.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "WXLoginShare.h"
#import <WXApi.h>



@implementation WXLoginShare

+(WXLoginShare *)shareInstance{
    static WXLoginShare *loginShare = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loginShare = [[WXLoginShare alloc]init];
    });
    return loginShare;
}


// 注册ID
-(BOOL)wxLoginShareRegisterApp{
    return [WXApi registerApp:WXAppID];
}


// 微信登录
-(void)WXLogin{
    SendAuthReq *req = [[SendAuthReq alloc]init];
    req.scope = @"snsapi_userinfo";
    req.state = [HTToolShareManager HTToolGetTimeStap];
    req.openID = WXAppID;
    LWLog(@"%@",req.state);
    [WXApi sendReq:req];
}


-(void)onReq:(BaseReq *)req{
    NSLog(@"微信的回调方法---");
}


-(void)onResp:(BaseResp *)resp{
    NSLog(@"微信的回调方法222---");
    // 微信登录
    //**resp.errCode  0 允许授权登录  -2用户取消
    if ([resp isKindOfClass:[SendAuthResp class]]) {
        if (resp.errCode == 0) {
            SendAuthResp *aresp = (SendAuthResp *)resp;
            [self getAccessTokenWithCode:aresp.code];
            NSLog(@"微信的回调方法333---%@",aresp.state);
            return;
        }
    }else if([resp isKindOfClass:[PayResp class]]){ //支付成功
        PayResp *aresp = (PayResp *)resp;
        NSLog(@"微信的回调方法333---%@-----%d",aresp.returnKey,aresp.type);
        
    }
}

// *  获取access_token
- (void)getAccessTokenWithCode:(NSString *)code
{
    NSString *urlString =[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code",WXAppID,WXAPPSecret,code];
    NSLog(@"urlString = %@",urlString);
    NSURL *url = [NSURL URLWithString:urlString];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *dataStr = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data)
            {
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                NSLog(@"dict = %@",dict);
                /*
                 "access_token" = "yDYlmcI4Td1s1zrqjA6v_a0ptx7wEJaKfgr65OMbBecvO4iBYyLujsfHxu82DSGxYqssbMSyiZbHI3XYC2tAJg";  //
                 "expires_in" = 7200;
                 openid = o9TVB1Co3947nBNB51XfQLB7CLSg;
                 "refresh_token" = "-icY6qNcesIqrRY8CXhtDH9kiXrFxdf59GNusPfpk221X-pSCDFDnIKDnAMPGClwqSERrtuyj_dan4vkPBxTfg";
                 scope = "snsapi_userinfo";
                 unionid = o4E2Q1fAj84mf3ziOqrVzjWbxH7I;
                 */
                if ([dict objectForKey:@"errcode"])
                {// 如果这里有值，说明授权失败
                    // 授权失败(用户取消/拒绝)
                    if ([self.delegate respondsToSelector:@selector(wxLoginShareFail:)]) {
                        [self.delegate wxLoginShareFail:dict];
                    }
                }else{
                    [self getUserInfoWithAccessToken:[dict objectForKey:@"access_token"] andOpenId:[dict objectForKey:@"openid"]];
                }
            }
        });
    });
}


//*  获取用户信息
- (void)getUserInfoWithAccessToken:(NSString *)accessToken andOpenId:(NSString *)openId
{
    // 存入本地
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:accessToken forKey:WX_REFRESH_TOKEN];
//    [defaults setObject:openId forKey:OPENID];
//    [defaults synchronize];
    
    NSString *urlString =[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/userinfo?access_token=%@&openid=%@",accessToken,openId];
    NSLog(@"urlString = %@",urlString);
    NSURL *url = [NSURL URLWithString:urlString];
    
    
    KWeakSelf(self);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *dataStr = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data)
            {
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                NSLog(@"dict = %@",dict);
                /**
                 *city = Foshan;
                 country = CN;
                 headimgurl = "http://wx.qlogo.cn/mmopen/vi_32/oXUy91CibcGpekG7sOB7O0icpxq7B3kv4oZyia3AA1mPPjH9qAbA8tG1Xx6WNE03vNwhyibhA7LKSBia0t5qc9dSeow/0";
                 language = "zh_CN";
                 nickname = "\U5929\U9053\U916c\U52e4";
                 openid = o9TVB1Co3947nBNB51XfQLB7CLSg;
                 privilege =     (
                 );
                 province = Guangdong;
                 sex = 1;
                 unionid = o4E2Q1fAj84mf3ziOqrVzjWbxH7I;
                 *
                 */
                if ([dict objectForKey:@"errcode"])
                {
                    //AccessToken失效
//                    [self getAccessTokenWithRefreshToken:[[NSUserDefaults standardUserDefaults]objectForKey:WX_REFRESH_TOKEN]];
                }else{
                    if ([weakself.delegate respondsToSelector:@selector(wxLoginShareSuccess:)]) {
                        [weakself.delegate wxLoginShareSuccess:dict];
                    }
                }
            }
        });
    });
}


// *  刷新access_token
- (void)getAccessTokenWithRefreshToken:(NSString *)refreshToken
{
    NSString *urlString =[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=%@&grant_type=refresh_token&refresh_token=%@",@"wx29c1153063de230b",refreshToken];
    NSLog(@"urlString = %@",urlString);
    NSURL *url = [NSURL URLWithString:urlString];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
        NSString *dataStr = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (data)
            {
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                if ([dict objectForKey:@"errcode"])
                {
                    //授权过期
                }else{
                    //重新使用AccessToken获取信息
                    
//                    NSString *token = [[NSUserDefaults standardUserDefaults]objectForKey:WX_REFRESH_TOKEN];
//                    NSString *openID = [[NSUserDefaults standardUserDefaults]objectForKey:OPENID];
                    
                    NSString *token = nil;
                    NSString *openID = nil;
                    
                    
                    if([dict objectForKey:@"access_token"] && [dict objectForKey:@"access_token"]!=nil){
                        token = [dict objectForKey:@"access_token"];
                    }
                    if([dict objectForKey:@"openid"] && [dict objectForKey:@"openid"]!=nil){
                        openID = [dict objectForKey:@"openid"];
                    }
                    [self getUserInfoWithAccessToken:token andOpenId:openID];
                }
            }
        });
    });
    
}


-(void)WXOpenXiaoChengXu{
    WXLaunchMiniProgramReq *launchMiniProgramReq = [WXLaunchMiniProgramReq object];
    launchMiniProgramReq.userName = WXXiaoChenXu;//拉起的小程序的username
    launchMiniProgramReq.path=@"pages/index/index";//拉起小程序页面的可带参路径，不填默认拉起小
    launchMiniProgramReq.miniProgramType=WXMiniProgramTypePreview; //拉起小程序的类型
    [WXApi sendReq:launchMiniProgramReq];
}


- (void)WXShareXiaoChengXu:(NSString *)des{
    

    
    WXMiniProgramObject * wxMiniObject =  [WXMiniProgramObject object];
    wxMiniObject.webpageUrl = @"http://www.baidu.com";
    wxMiniObject.userName = WXXiaoChenXu;
    wxMiniObject.path = @"pages/index/index";
    wxMiniObject.miniProgramType = WXMiniProgramTypePreview;
    //        [NSData da]
//    NSString *file2 = [[NSBundle mainBundle] pathForResource:@"cccccccc" ofType:@"png"];
    NSString *file2 = [[NSBundle mainBundle] pathForResource:@"mf" ofType:@"bundle"];
    NSString *imageName = @"cccccccc@3x.png";
    imageName = [file2 stringByAppendingPathComponent:imageName];


    NSData *imageData = [NSData dataWithContentsOfFile:imageName];
    wxMiniObject.hdImageData = imageData;

    WXMediaMessage * message = [WXMediaMessage message];
    message.title = @"觅方";
    message.description = @"京达达大厦";
    message.mediaObject = wxMiniObject;
//    [message setThumbImage:[UIImage imageNamed:@"headerMoren"]];
//    message.thumbData = nil;
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.scene = WXSceneSession;
    req.bText = NO;
    req.message = message;
    [WXApi sendReq:req];
}


//微信支付
-(void)WXWeChatPay{
    
    
    PayReq *request = [[PayReq alloc] init];
    request.partnerId = @"10000100";
    request.prepayId= @"1101000000140415649af9fc314aa427";
    request.package = @"Sign=WXPay";
    request.nonceStr= @"a462b76e7436e98e0ed6e13c64b4fd1c";
//    request.timeStamp= [[[HTTool HTToolShare] HTToolGetTimeStap] longLongValue];
    request.sign= @"582282D72DD2B03AD892830965F428CB16E7A256";
    [WXApi sendReq:request];
    
}
@end


