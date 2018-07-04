//
//  MiBenModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/3.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MiBenIn : NSObject
@property (nonatomic,assign) int ChangeIntegral;
@property (nonatomic,copy) NSString * ChangeTime;
@property (nonatomic,copy) NSString * ChangeDesc;
@end



@interface MiBenModel : NSObject
@property (nonatomic,assign) int SumImportIntegral;
@property (nonatomic,assign) int SumExportIntegral;
@property (nonatomic,strong) NSArray <MiBenIn *>* Items;

@end
