//
//  AccountTableViewCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/20.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol AccountTableViewDelegate <NSObject>


- (void)BuildClick;


@end


@interface AccountTableViewCell : UITableViewCell


@property (nonatomic,weak) id <AccountTableViewDelegate> delegate;

@end
