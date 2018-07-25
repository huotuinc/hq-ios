//
//  MessageContainerModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/17.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageContainerModel : NSObject


@property (nonatomic,copy) NSString *NotificationContent;
@property (nonatomic,copy) NSString *JpushType;
@property (nonatomic,copy) NSString *PushTime;
@property (nonatomic,copy) NSString * NoticeScene;


//"NotificationContent": "{\"NoticeContent\":\"高速你一个好消息高速你一个好消息高速你一个好消息高速你一个好消息高速你一个好消息高速你一个好消息高速你一个好消息高速你一个好消息高速你一个好消息高速你一个好消息\",\"NoticeImgURL\":\"http://images.liqucn.com/img/h21/h56/img_localize_a056fdf57f1d33f64be99175b0fbfa40_400x400.png\",\"NoticeTitle\":\"高速你一个坏消息\",\"NoticeScene\":0,\"NoticeTime\":\"\",\"JumpURL\":\"http:www.baidu.com\",\"NoticeType\":0}",
//"JpushType": "1",
//"PushTime": "23232323232"
//


@end
