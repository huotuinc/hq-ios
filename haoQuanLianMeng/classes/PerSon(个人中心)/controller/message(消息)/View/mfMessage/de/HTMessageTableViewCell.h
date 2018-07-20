//
//  HTMessageTableViewCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/17.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWMessageHeaderView.h"
#import "MessageBaseCenterView.h"
#import "MessageBottomView.h"
#import "HTMessageCellModel.h"
#import "MessageBottomView.h"

@interface HTMessageTableViewCell : UITableViewCell{
    MessageBaseCenterView * _centerView;
}


//头部试图
@property (nonatomic,strong) LWMessageHeaderView * header;


//中间试图
@property (nonatomic,strong) MessageBaseCenterView * centerView;


//尾部试图
@property (nonatomic,strong) MessageBottomView * messageBottomView;



@property (nonatomic,strong) HTMessageCellModel * messageCellModel;




//子类重写必须 先调父类。。。。。。。。。。。。。。
- (void)updateCell;
- (void)configCellWithCellModel:(HTMessageCellModel *)model;




@end
