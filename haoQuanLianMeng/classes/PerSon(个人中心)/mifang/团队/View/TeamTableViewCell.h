//
//  TeamTableViewCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Team.h"


@interface TeamTableViewCell : UITableViewCell


@property (nonatomic,assign) int type;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withType:(int)type;


@property (nonatomic,strong) NSIndexPath  * indexPath;



- (void)configure:(Team *)model;

@end
