//
//  HTTool.m
//  HotTechLoan
//
//  Created by 罗海波 on 2017/11/9.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HTTool.h"
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <sys/utsname.h>


@implementation HTTool

static HTTool * _htTool;



- (NSString *)HTToolGetTimeStap{
    NSDate * dateNow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[dateNow timeIntervalSince1970]*1000];
    return timeSp;
}


- (CGFloat)titleHeightWithFont:(int)font withTitle:(NSString *)title {
    if (!title || !title.length) {
        return 0;
    }
    //NSString *titleContent = @"亲，欢迎您";
    CGSize titleSize = [title boundingRectWithSize:CGSizeMake(KScreenWidth -  (kAdaptedWidth(10) + kAdaptedWidth(40) + kAdaptedWidth(16) + kAdaptedWidth(15)), MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:kAdaptedFontSize(font)} context:nil].size;
    return titleSize.height;
}



- (CGFloat)titleHeightWithFont:(int)font{
    NSString *titleContent = @"亲，欢迎您";
    CGSize titleSize = [titleContent boundingRectWithSize:CGSizeMake(KScreenWidth - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:kAdaptedFontSize(font)} context:nil].size;
    return titleSize.height;
}

+ (instancetype)HTToolShare{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _htTool = [[self alloc] init];
    });
    return _htTool;
}


- (NSString*)HTToolGetIphoneType {
    
    //需要导入头文件：

    struct utsname systemInfo;

    uname(&systemInfo);

    NSString*platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];

    if([platform isEqualToString:@"iPhone1,1"]){
        return @"iPhone 2G";
    }

    if([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";

    if([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";

    if([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";

    if([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";

    if([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";

    if([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";

    if([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";

    if([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";

    if([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";

    if([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";

    if([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";

    if([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";

    if([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";

    if([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";

    if([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";

    if([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";

    if([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";

    if([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";

    if([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";

    if([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";

    if([platform isEqualToString:@"iPhone10,4"]) return @"iPhone 8";

    if([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";

    if([platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";

    if([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X";

    if([platform isEqualToString:@"iPhone10,6"]) return @"iPhone X";

    if([platform isEqualToString:@"iPod1,1"]) return @"iPod Touch 1G";

    if([platform isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G";

    if([platform isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G";

    if([platform isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G";

    if([platform isEqualToString:@"iPod5,1"]) return @"iPod Touch 5G";

    if([platform isEqualToString:@"iPad1,1"]) return @"iPad 1G";

    if([platform isEqualToString:@"iPad2,1"]) return @"iPad 2";

    if([platform isEqualToString:@"iPad2,2"]) return @"iPad 2";

    if([platform isEqualToString:@"iPad2,3"]) return @"iPad 2";

    if([platform isEqualToString:@"iPad2,4"]) return @"iPad 2";

    if([platform isEqualToString:@"iPad2,5"]) return @"iPad Mini 1G";

    if([platform isEqualToString:@"iPad2,6"]) return @"iPad Mini 1G";

    if([platform isEqualToString:@"iPad2,7"]) return@"iPad Mini 1G";

    if([platform isEqualToString:@"iPad3,1"]) return@"iPad 3";

    if([platform isEqualToString:@"iPad3,2"]) return@"iPad 3";

    if([platform isEqualToString:@"iPad3,3"]) return@"iPad 3";

    if([platform isEqualToString:@"iPad3,4"]) return@"iPad 4";

    if([platform isEqualToString:@"iPad3,5"]) return@"iPad 4";

    if([platform isEqualToString:@"iPad3,6"]) return@"iPad 4";

    if([platform isEqualToString:@"iPad4,1"]) return@"iPad Air";

    if([platform isEqualToString:@"iPad4,2"]) return@"iPad Air";

    if([platform isEqualToString:@"iPad4,3"]) return@"iPad Air";

    if([platform isEqualToString:@"iPad4,4"]) return@"iPad Mini 2G";

    if([platform isEqualToString:@"iPad4,5"]) return@"iPad Mini 2G";

    if([platform isEqualToString:@"iPad4,6"]) return@"iPad Mini 2G";

    if([platform isEqualToString:@"iPad4,7"]) return@"iPad Mini 3";

    if([platform isEqualToString:@"iPad4,8"]) return@"iPad Mini 3";

    if([platform isEqualToString:@"iPad4,9"]) return@"iPad Mini 3";

    if([platform isEqualToString:@"iPad5,1"]) return@"iPad Mini 4";

    if([platform isEqualToString:@"iPad5,2"]) return@"iPad Mini 4";

    if([platform isEqualToString:@"iPad5,3"]) return@"iPad Air 2";

    if([platform isEqualToString:@"iPad5,4"]) return@"iPad Air 2";

    if([platform isEqualToString:@"iPad6,3"]) return@"iPad Pro 9.7";

    if([platform isEqualToString:@"iPad6,4"]) return@"iPad Pro 9.7";

    if([platform isEqualToString:@"iPad6,7"]) return@"iPad Pro 12.9";

    if([platform isEqualToString:@"iPad6,8"]) return@"iPad Pro 12.9";

    if([platform isEqualToString:@"i386"]) return@"iPhone Simulator";

    if([platform isEqualToString:@"x86_64"]) return@"iPhone Simulator";

    return nil;
    
}

- (NSString *)HTToolGetDeviceIPAdress{
    
    NSString *address = @"an error occurred when obtaining ip address";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    success = getifaddrs(&interfaces);
    
    if (success == 0) { // 0 表示获取成功
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in  *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    freeifaddrs(interfaces);
    
    LWLog(@"%@", address);
    
    return address;
    
}

//- (NSMutableDictionary *)HTYXToolSignWithParame:(NSMutableDictionary *)parame{
//    if (parame == nil) {
//        parame = [NSMutableDictionary dictionary];
//    }
//    parame[@"merchantId"] = se;
//    YxUserInfo * usermodel = (YxUserInfo *)[[HTTool HTToolShare] HTToolUnArchiveObject:@"YxUserInfo"];
//    if(usermodel == nil){
//        parame[@"userToken"] = @"";
//        parame[@"userId"] = @"0";
//
//    }else{
//        parame[@"userToken"] = usermodel.userToken;
//        parame[@"userId"] = @(usermodel.userId);
//    }
//
//
//    //1、加入时间戳
//    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
//    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
//    NSString *timeString = [NSString stringWithFormat:@"%.f", a];
//    parame[@"timestamp"] = timeString;
//
//    //2、剔除字段为空的数据
//    NSArray * arrKey = [parame allKeys];
//    [arrKey enumerateObjectsUsingBlock:^(NSString*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSString * cc =[NSString stringWithFormat:@"%@", [parame objectForKey:obj]];
//        if (cc.length==0) {
//            [parame removeObjectForKey:obj];
//        }
//    }];
//
//    //3、数据进行排序
//    arrKey = [parame allKeys];
//    arrKey = [arrKey sortedArrayUsingComparator:^NSComparisonResult(NSString* obj1, NSString* obj2) {
//        return [[obj1 lowercaseString] compare:[obj2 lowercaseString]] == NSOrderedDescending;
//    }];
//
//    //4、对数据进行拼接
//    NSMutableString * signCap = [[NSMutableString alloc] init];
//    for (NSString * dicKey in arrKey) {
//        [signCap appendString:[NSString stringWithFormat:@"%@%@", [dicKey lowercaseString], [parame objectForKey:dicKey]]];
//    }
//
//    NSString * cc  = [NSString stringWithFormat:@"%@%@",signCap,HTSecretKey];
//
//    //LWLog(@"参数拼接后的字符串%@",cc);
//
//    NSString * sign = [[MD5Encryption md5by32:cc] uppercaseString];
//    //LWLog(@"签名的后的字符串%@",sign);
//    parame[@"sign"] = sign;
//    return parame;
//}

- (NSMutableDictionary *)HTToolSignWithParame:(NSMutableDictionary *)parame{

    if (parame == nil) {
        parame = [NSMutableDictionary dictionary];
    }
    //parame[@"merchantId"] = ServiceMerchantId;
    HTUserModel * usermodel = (HTUserModel *)[[HTTool HTToolShare] HTToolUnArchiveObject:@"HTUserModel"];
    if(usermodel == nil){
        parame[@"userToken"] = @"";
        //parame[@"userId"] = @"0";
        
    }else{
        parame[@"userToken"] = usermodel.token;
        //parame[@"userId"] = @(usermodel.userId);
    }

    
    //1、加入时间戳
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
    NSString *timeString = [NSString stringWithFormat:@"%.f", a];
    parame[@"timestamp"] = timeString;

    //2、剔除字段为空的数据
    NSArray * arrKey = [parame allKeys];
    [arrKey enumerateObjectsUsingBlock:^(NSString*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString * cc =[NSString stringWithFormat:@"%@", [parame objectForKey:obj]];
        if (cc.length==0) {
            [parame removeObjectForKey:obj];
        }
    }];

    //3、数据进行排序
    arrKey = [parame allKeys];
    arrKey = [arrKey sortedArrayUsingComparator:^NSComparisonResult(NSString* obj1, NSString* obj2) {
        return [[obj1 lowercaseString] compare:[obj2 lowercaseString]] == NSOrderedDescending;
    }];

    //4、对数据进行拼接
    NSMutableString * signCap = [[NSMutableString alloc] init];
    for (NSString * dicKey in arrKey) {
        [signCap appendString:[NSString stringWithFormat:@"%@%@", [dicKey lowercaseString], [parame objectForKey:dicKey]]];
    }

    NSString * cc  = [NSString stringWithFormat:@"%@%@",signCap,HTSecretKey];

    //LWLog(@"参数拼接后的字符串%@",cc);
    
    NSString * sign = [[MD5Encryption md5by32:cc] uppercaseString];
    //LWLog(@"签名的后的字符串%@",sign);
    parame[@"sign"] = sign;
    return parame;
}


- (BOOL)HTToolValidateMobile:(NSString *)mobile
{
    // 130-139  150-153,155-159  180-189  145,147  170,171,173,176,177,178
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(14[57])|(17[013678]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}


/**
 *  自定义对象沙河存储
 **/
- (BOOL)HTToolArchiveRootObject:(NSObject *)object withPath:(NSString *)path{
    //2.获取文件路径
     NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
     NSString *paths=[docPath stringByAppendingPathComponent:path];
     NSLog(@"path=%@",path);
    //3.将自定义的对象保存到文件中
    return [NSKeyedArchiver archiveRootObject:object toFile:paths];
}

/**
 *  自定义对象解析
 **/
- (NSObject *)HTToolUnArchiveObject:(NSString *)path{
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *paths=[docPath stringByAppendingPathComponent:path];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:paths]){
       return [NSKeyedUnarchiver unarchiveObjectWithFile:paths];
    }
    return nil;
}

/**
 *  删除沙河数据
 **/
- (void)HTToolDeleteObject:(NSString *)path{
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *paths=[docPath stringByAppendingPathComponent:path];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:paths]){
        [fileManager removeItemAtPath:paths error:nil];
    }
}

- (void)showAlertWithController:(UIViewController *)vc andTitle:(NSString *)title andMessage:(NSString *)message conform:(void(^)(void))conformBlock cancle:(void(^)(void))cancleBlock{
    
    //@"温馨提示" @"您的通讯录暂未允许访问，请去设置->隐私里面授权!"
    UIAlertController * alerController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    //UIView *subView1 = alerController.view.subviews[0];
    
    bool flag = false;
    if ([message rangeOfString:@"本公司承诺为之保密不外泄"].location != NSNotFound) {
        flag = true;
    }
    
    if (conformBlock) {
        
        UIAlertAction * ac = [UIAlertAction actionWithTitle:(flag ? @"同意" : @"确定") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                conformBlock();
        }];
         [alerController addAction:ac];
    }
    
    if (cancleBlock) {
        UIAlertAction * ac1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (cancleBlock) {
                cancleBlock();
            }
        }];
        [alerController addAction:ac1];
    }
    
    [vc presentViewController:alerController animated:YES completion:nil];
}


- (UIImage *)HTToolWaterAtImage:(UIImage *)image
               waterImgae:(UIImage *)waterImage
                     rect:(CGRect)rect {
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //绘制原图片
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.width)];
    //绘制水印
    [waterImage drawInRect:rect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)scaleImage:(UIImage *)image sclae:(CGFloat)scale {
    //确定压缩后的size
    CGFloat scaleWidth = image.size.width * scale;
    CGFloat scaleHeight = image.size.height * scale;
    CGSize scaleSize = CGSizeMake(scaleWidth, scaleHeight);
    //开启图形上下文
    UIGraphicsBeginImageContext(scaleSize);
    //绘制图片
    [image drawInRect:CGRectMake(0, 0, scaleWidth, scaleHeight)];
    //从图形上下文获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形上下文
    UIGraphicsEndImageContext();
    return newImage;
}

- (NSString *)HTToolCurrentDateStringWithFormat:(NSString *)formatterStr {
    
    if (formatterStr == nil) {
        formatterStr = @"yyyy-MM-dd HH:mm:ss";
    }
    
    // 获取系统当前时间
    NSDate *currentDate = [NSDate date];
    // 用于格式化NSDate对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置格式：yyyy-MM-dd HH:mm:ss
    formatter.dateFormat = formatterStr;
    // 将 NSDate 按 formatter格式 转成 NSString
    NSString *currentDateStr = [formatter stringFromDate:currentDate];
    // 输出currentDateStr
    return currentDateStr;
}

/**
 * @method
 *
 * @brief 获取两个日期之间的天数
 * @param fromDate       起始日期
 * @param toDate         终止日期
 * @return    总天数
 */
- (NSInteger)HTToolNumberOfDaysWithFromDate:(NSString *)fromDate toDate:(NSString *)toDate{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *resDate1 = [formatter dateFromString:fromDate];
    NSDate *resDate2 = [formatter dateFromString:toDate];
    NSDateComponents    * comp = [calendar components:NSCalendarUnitDay
                                             fromDate:resDate1
                                               toDate:resDate2
                                              options:NSCalendarWrapComponents];
    return comp.day;
}

- (NSInteger)HTToolNumberOfDaysWithMonth:(NSString *)fromDate month:(NSString *)Month{
    
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *resDate1 = [formatter dateFromString:fromDate];
    
    
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //NSString *currentDateStr = [dateFormatter stringFromDate:resDate1];
    //NSLog(@"---当前的时间的字符串 =%@",currentDateStr);
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
//    NSDateComponents *comps = nil;
//    
//    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:resDate1];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:0];
    [adcomps setMonth:[Month integerValue]];
    [adcomps setDay:0];
    
    
    
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:resDate1 options:0];
    NSString *beforDate = [dateFormatter stringFromDate:newdate];
    //DebugLog(@"---前两个月 =%@",beforDate);
    

    return [self HTToolNumberOfDaysWithFromDate:fromDate toDate:beforDate];
    
}



/**
 转发借条
 */
- (void)HTToolToTurnShare:(UIViewController *)vc andShareImage:(NSString *)imageUrl andShareTitle:(NSString *)title andDes:(NSString *)des andShareUrl:(NSString *)shareUrl{
////    //1、创建分享参数
//    NSArray* imageArray = @[imageUrl];
//    //    （注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
//    if (imageArray) {
//        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
//        [shareParams SSDKSetupShareParamsByText:des
//                                         images:imageArray
//                                            url:[NSURL URLWithString:shareUrl]
//                                          title:title
//                                           type:SSDKContentTypeAuto];
//        //有的平台要客户端分享需要加此方法，例如微博
//        [shareParams SSDKEnableUseClientShare];
//        //2、分享（可以弹出我们的分享菜单和编辑界面）
//        [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
//                                 items:nil
//                           shareParams:shareParams
//                   onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
//
//                       switch (state) {
//                           case SSDKResponseStateSuccess:
//                           {
//
//                               [self showAlertWithController:vc andTitle:@"分享成功" andMessage:nil conform:^{
//
//                               } cancle:nil];
//                               break;
//                           }
//                           case SSDKResponseStateFail:
//                           {
//                               [self showAlertWithController:vc andTitle:@"分享失败" andMessage:nil conform:^{
//
//                               } cancle:nil];
//
//                               break;
//                           }
//                           default:
//                               break;
//                       }
//                   }
//         ];}
}




///**
// 获取所有的城市
//
// @return <#return value description#>
// */
//- (NSMutableArray *)HTToolGetCityS{
//
//    NSMutableArray *  _cityS = [NSMutableArray array];
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"BRCity" ofType:@"plist"];
//    NSArray *arrData = [NSArray arrayWithContentsOfFile:filePath];
//    for (NSDictionary *dic in arrData) {
//        // 此处用 YYModel 进行解析
//        HTProvinceModel *proviceModel = [HTProvinceModel yy_modelWithDictionary:dic];
//        //        [self.addressModelArr addObject:proviceModel];
//        LWLog(@"%@",[proviceModel mj_keyValues]);
//        [_cityS addObject:proviceModel];
//    }
//    return  _cityS;
//}
//
///**获取城市citycode*/
//- (NSDictionary *)HTToolGetCityCode:(NSArray * )selectAddressArr{
//
//    __block int priCode;
//    __block int cityCode;
//    __block int AreaCode;
//    [[self HTToolGetCityS] enumerateObjectsUsingBlock:^(HTProvinceModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        LWLog(@"%@",[obj mj_keyValues]);
//        LWLog(@"%@",[NSString stringWithFormat:@"%@%@%@", selectAddressArr[0], selectAddressArr[1], selectAddressArr[2]]);
//        if ([obj.name isEqualToString:selectAddressArr[0]]) {
//            LWLog(@"%@",[obj mj_keyValues]);
//            priCode = obj.cityCode;
//            [obj.city enumerateObjectsUsingBlock:^(HTCityModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                if([obj.name isEqualToString:selectAddressArr[1]]){
//                    LWLog(@"%@",[obj mj_keyValues]);
//                    cityCode = obj.cityCode;
//                    [obj.town enumerateObjectsUsingBlock:^(HTTownModel*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                        if([obj.name isEqualToString:selectAddressArr[2]]){
//                            
//                            LWLog(@"%@",[obj mj_keyValues]);
//                            AreaCode = obj.cityCode;
//                            *stop = YES;
//                        }
//                    }];
//                    *stop = YES;
//                }
//            }];
//            *stop = YES;
//        }
//    }];
//    return @{@"priCode":@(priCode),@"cityCode":@(cityCode),@"AreaCode":@(AreaCode)};
//}

- (UIImage *)imageWithOriginal:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (NSString *)DeCodeAES:(NSString *)text{
    //NSString *strUrl = [text stringByReplacingOccurrencesOfString:@"*" withString:@"="]; //替换字符
    //NSString *decryptedText = [AESCipher decryptAES:strUrl key:@"hiyouxinguohai66"];
    return nil;
}


//- (NSDictionary *)NHToolSetCookes{
//    
//    YxUserInfo * usermodel = (YxUserInfo *)[[HTTool HTToolShare] HTToolUnArchiveObject:@"YxUserInfo"];
//    if(usermodel){
//        AppSettingModel * mode = (AppSettingModel *)[[HTTool HTToolShare] HTToolUnArchiveObject:@"AppSettingModel"];
//        NSRange rang = [mode.applyListUrl rangeOfString:@"com"];
//        NSString * doman =  [mode.applyListUrl substringToIndex:(rang.location+ rang.length)];
//        doman = [NSURL URLWithString:doman].host;
//        NSDictionary *properties = [NSDictionary dictionaryWithObjectsAndKeys:
//                                    doman, NSHTTPCookieDomain,
//                                    @"User-Id", NSHTTPCookieName,
//                                    @"/", NSHTTPCookiePath,
//                                    [NSString stringWithFormat:@"%d",usermodel.userId], NSHTTPCookieValue,
//                                    nil];
//        NSHTTPCookie *cookiex = [NSHTTPCookie cookieWithProperties:properties];
//        
//        NSDictionary *properties1 = [NSDictionary dictionaryWithObjectsAndKeys:
//                                     doman, NSHTTPCookieDomain,
//                                     @"/", NSHTTPCookiePath,
//                                     @"User-Token", NSHTTPCookieName,
//                                     usermodel.userToken, NSHTTPCookieValue,
//                                     nil];
//        NSHTTPCookie *cookiex1 = [NSHTTPCookie cookieWithProperties:properties1];
//        
//        
//        
//        NSDictionary *properties2 = [NSDictionary dictionaryWithObjectsAndKeys:
//                                     doman, NSHTTPCookieDomain,
//                                     @"/", NSHTTPCookiePath,
//                                     @"User-Info", NSHTTPCookieName,
//                                     [usermodel mj_JSONString], NSHTTPCookieValue,
//                                     nil];
//        NSHTTPCookie *cookiex2 = [NSHTTPCookie cookieWithProperties:properties2];
//        
//        NSDictionary *properties3 = [NSDictionary dictionaryWithObjectsAndKeys:
//                                     doman, NSHTTPCookieDomain,
//                                     @"/", NSHTTPCookiePath,
//                                     @"showmenu", NSHTTPCookieName,
//                                     @"0", NSHTTPCookieValue,
//                                     nil];
//        NSHTTPCookie *cookiex3 = [NSHTTPCookie cookieWithProperties:properties3];
//        
//        
//        
//        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookiex];
//        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookiex1];
//        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookiex2];
//        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookiex3];
//    }
//    return nil;
//}


- (void)removeCookie{
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    [[cookieJar cookies] enumerateObjectsUsingBlock:^(NSHTTPCookie * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([cookie.name isEqualToString:@"User-Id"] ||
            [cookie.name isEqualToString:@"User-Info"] ||
            [cookie.name isEqualToString:@"User-Token"]) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:obj];
        }
       
    }];

}


-(BOOL)requestBeforeJudgeConnect
{
    struct sockaddr zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sa_len = sizeof(zeroAddress);
    zeroAddress.sa_family = AF_INET;
    SCNetworkReachabilityRef defaultRouteReachability =
    SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    BOOL didRetrieveFlags =
    SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    if (!didRetrieveFlags) {
        printf("Error. Count not recover network reachability flags\\n");
        return NO;
    }
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    BOOL isNetworkEnable  =(isReachable && !needsConnection) ? YES : NO;
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].networkActivityIndicatorVisible =isNetworkEnable;/*  网络指示器的状态： 有网络 ： 开  没有网络： 关  */
    });
    return isNetworkEnable;
}



- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}


@end
