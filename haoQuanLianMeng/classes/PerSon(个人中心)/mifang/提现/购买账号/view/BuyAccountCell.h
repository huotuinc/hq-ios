//
//  BuyAccountCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BuyAccountModel.h"


@interface BuyAccountCell : UITableViewCell

- (void)configure:(int)account andAccountInfo:(int)price;

@end
