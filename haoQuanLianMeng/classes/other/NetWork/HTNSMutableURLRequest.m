//
//  HTNSMutableURLRequest.m
//  HotTechLoan
//
//  Created by 罗海波 on 2017/12/25.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HTNSMutableURLRequest.h"

@implementation HTNSMutableURLRequest

- (instancetype)initWithURL:(NSURL *)URL{
    
    NSMutableURLRequest * url =  [super initWithURL:URL];
    if (url) {
        
        
//        NSMutableDictionary * parame = [[HTTool HTToolShare] HTToolSignWithParame:nil];
//       
//        [url addValue:[parame objectForKey:@"timestamp"] forHTTPHeaderField:@"timestamp"];
//       
//         [url addValue:[parame objectForKey:@"sign"] forHTTPHeaderField:@"sign"];
//        
//        // 开始设置请求头
//        [url addValue:AppVersion forHTTPHeaderField:@"appVersion"];
        
//        [url addValue:UUIDString forHTTPHeaderField:@"hwid"];
//        
//        [url addValue:[[HTTool HTToolShare] HTToolGetIphoneType]  forHTTPHeaderField:@"mobileType"];
//        [url addValue:@"ios" forHTTPHeaderField:@"osType"];
//        
//        [url addValue:osVersion forHTTPHeaderField:@"osVersion"];
//        [url addValue:AppMerchantId forHTTPHeaderField:@"merchantId"];
//        
//        HTUserModel * usermodel = (HTUserModel *)[[HTTool HTToolShare] HTToolUnArchiveObject:@"HTUserModel"];
//        if(usermodel == nil){
//            [url addValue:@"" forHTTPHeaderField:@"userToken"];
//            [url addValue:@"0" forHTTPHeaderField:@"userId"];
//        }else{
//            [url addValue:usermodel.userToken forHTTPHeaderField:@"userToken"];
//            [url addValue:[NSString stringWithFormat:@"%d",usermodel.userId] forHTTPHeaderField:@"userId"];
//        }
//        
//        BaiduLocalModel * location = (BaiduLocalModel *)[[HTTool HTToolShare] HTToolUnArchiveObject:@"location"];
//        if (location) {
//            
//            [url addValue:location.cityCode forHTTPHeaderField:@"cityCode"];
//            [url addValue:[location.cityName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] forHTTPHeaderField:@"cityName"];
//            [url addValue:[NSString stringWithFormat:@"%f,%f",location.longitude,location.latitude] forHTTPHeaderField:@"coordinate"];
//        }else{
//            [url addValue:@"0" forHTTPHeaderField:@"cityCode"];
//            [url addValue:@"" forHTTPHeaderField:@"cityName"];
//        }
    }
    return url;
}


@end
