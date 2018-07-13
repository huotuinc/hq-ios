//
//  HTSysMessageModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTMessageModel.h"

@interface HTSysMessageModel : HTMessageModel

/// <summary>
/// 通知类型
/// </summary>
@property (nonatomic,assign) int NoticeType;
/// <summary>
/// 通知场景
/// </summary>
@property (nonatomic,assign) int NoticeScene;
/// <summary>
/// 通知场景
/// </summary>

/// 通知时间
/// </summary>
@property (nonatomic,copy) NSString  * NoticeTime;
/// <summary>
/// 通知标题
/// </summary>
@property (nonatomic,copy) NSString  * NoticeTitle;
/// <summary>
/// 通知图片
/// </summary>
@property (nonatomic,copy) NSString  * NoticeImgURL;
/// <summary>
/// 通知内容
/// </summary>
@property (nonatomic,copy) NSString  * NoticeContent;
/// <summary>
/// 跳转地址
/// </summary>
@property (nonatomic,copy) NSString  * JumpURL;




@end
