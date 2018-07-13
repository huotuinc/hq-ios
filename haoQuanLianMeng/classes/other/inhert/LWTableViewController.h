//
//  LWTableViewController.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/14.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>

@interface LWTableViewController : UITableViewController



@property (nonatomic,strong) NSMutableArray * dataArray;


@property (nonatomic,strong)  MJRefreshNormalHeader * header;

@property (nonatomic,strong)  MJRefreshAutoFooter * footer;


//获取当前列表的页面
@property (nonatomic, assign) int refreshPageIndex;


@end
