//
//  AccountListController.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWTableViewController.h"


@protocol AccountListControllerDelegate <NSObject>


- (void)accountSelect:(AccountList *)model;


@end



@interface AccountListController : LWTableViewController


@property (nonatomic,weak) id <AccountListControllerDelegate> delegate;


@end
