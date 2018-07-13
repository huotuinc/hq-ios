//
//  ACBuildTableViewCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BuyAccountPayChanel.h"
@interface ACBuildTableViewCell : UITableViewCell


- (int)getCurrentType;


- (void)configure:(NSArray<BuyAccountPayChanel *> *) accountList;



@end
