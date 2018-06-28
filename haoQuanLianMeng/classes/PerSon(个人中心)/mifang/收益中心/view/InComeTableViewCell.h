//
//  InComeTableViewCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/20.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol InComeTableViewCellDelegate <NSObject>

-(void)InComeClicl:(int)index;

@end


@interface InComeTableViewCell : UITableViewCell

@property (nonatomic,strong) NSIndexPath  * indexPath;

@property (nonatomic,weak) id <InComeTableViewCellDelegate> delegate;


@end
