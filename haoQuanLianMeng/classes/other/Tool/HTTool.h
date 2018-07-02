//
//  HTTool.h
//  HotTechLoan
//
//  Created by 罗海波 on 2017/11/9.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>


#define  HTToolShareManager [HTTool HTToolShare]


@interface HTTool : NSObject

+ (instancetype)HTToolShare;



/**
 * 获取时间戳
 **/
- (NSString *)HTToolGetTimeStap;

/**
 * 获取设置型号
 **/
- (NSString*)HTToolGetIphoneType;


/**
 * 获取IP地址
 **/
- (NSString *)HTToolGetDeviceIPAdress;


/**
 *  火图签名工具
 **/
- (NSMutableDictionary *)HTToolSignWithParame:(NSMutableDictionary *)parame;



///**
// *  有信签名工具
// **/
//- (NSMutableDictionary *)HTYXToolSignWithParame:(NSMutableDictionary *)parame;



/**
 *  手机号11位验证
 **/
- (BOOL)HTToolValidateMobile:(NSString *)mobile;


/**
 *  自定义对象沙河存储
 **/
- (BOOL)HTToolArchiveRootObject:(NSObject *)object withPath:(NSString *)path;

/**
 *  自定义对象解析
 **/
- (NSObject *)HTToolUnArchiveObject:(NSString *)className;

/**
 *  删除沙河数据
 **/
- (void)HTToolDeleteObject:(NSString *)path;


- (void)showAlertWithController:(UIViewController *)vc andTitle:(NSString *)title andMessage:(NSString *)message conform:(void(^)(void))conformBlock cancle:(void(^)(void))cancleBlock;



/**图片水印*/
- (UIImage *)HTToolWaterAtImage:(UIImage *)image
                     waterImgae:(UIImage *)waterImage
                           rect:(CGRect)rect;

/**图片伸缩*/
- (UIImage *)scaleImage:(UIImage *)image sclae:(CGFloat)scale;


/**获取当前时间*/
- (NSString *)HTToolCurrentDateStringWithFormat:(NSString *)formatterStr;


/**
 获取2个时间的天数

 @param fromDate <#fromDate description#>
 @param toDate <#toDate description#>
 @return <#return value description#>
 */
- (NSInteger)HTToolNumberOfDaysWithFromDate:(NSString *)fromDate toDate:(NSString *)toDate;



/**
 获取天数

 @param Month <#Month description#>
 @return <#return value description#>
 */
- (NSInteger)HTToolNumberOfDaysWithMonth:(NSString *)fromDate month:(NSString *)Month;




/**获取城市citycode*/
//- (NSDictionary *)HTToolGetCityCode:(NSArray * )selectAddressArr;



/**
 获取原图

 @param imageName <#imageName description#>
 @return <#return value description#>
 */
- (UIImage *)imageWithOriginal:(NSString *)imageName;



/**
 转发
 @param vc <#vc description#>
 @param imageUrl <#imageUrl description#>
 @param title <#title description#>
 @param des <#des description#>
 */
- (void)HTToolToTurnShare:(UIViewController *)vc andShareImage:(NSString *)imageUrl andShareTitle:(NSString *)title andDes:(NSString *)des andShareUrl:(NSString *)shareUrl;



/**
 AES 解密

 @param text <#text description#>
 @return <#return value description#>
 */
- (NSString *)DeCodeAES:(NSString *)text;


/**
 * 设置cooker
 **/
- (NSDictionary *)NHToolSetCookes;


/**
 * 删除cookie
 **/
- (void)removeCookie;



/**
 * 获取一行文字的高低
 */
- (CGFloat)titleHeightWithFont:(int)font;


/**
 * 设置具体文字的高度
 */
- (CGFloat)titleHeightWithFont:(int)font withTitle:(NSString *)title;

/**
 * 判断网络状态
 */
-(BOOL)requestBeforeJudgeConnect;


- (UIViewController *)getCurrentVC;
@end
