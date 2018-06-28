//
//  EightTableViewCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/15.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EightTableViewCell : UITableViewCell

@property(nonatomic,strong)void(^block)(NSUInteger);

@end
