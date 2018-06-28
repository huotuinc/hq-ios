//
//  HTApiHelper.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/29.
//  Copyright © 2018年 HT. All rights reserved.
//

#ifndef HTApiHelper_h
#define HTApiHelper_h

#ifdef DEBUG  //测试地址
#define HTMainIpAddress @"http://api.mingshz.com/mock/65/"
#else //正式地址
#define HTMainIpAddress @"http://zhengxin2.51morecash.com/api"
#endif

#define HTApiUrlWithInterfaceString(url)  [NSString stringWithFormat:@"%@%@",HTMainIpAddress,url]


#define AppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define UUIDString [[UIDevice currentDevice].identifierForVendor UUIDString]
#define OSVersion [[UIDevice currentDevice] systemVersion]
#define ServiceMerchantId @"4886" //服务端商户ID

#define HTSecretKey @"" //网络请求的Key

#endif /* HTApiHelper_h */
