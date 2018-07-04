//
//  TuiGuangCellModel.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/4.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TuiGuangCellModel.h"
#import "ATuiGuangTableViewCell.h"

@implementation TuiGuangCellModel


+ (ATuiGuangTableViewCell *)confirmCellWithArticle:(TuiGuangModel *)dateModel  slideType:(TuiGuangOrderStatus)selectType WithTableView:(UITableView *)tableView witdDelegate:(id<TuiGuangListDelegate>)delegate{

    TuiGuangCellModel * modelx = [[self alloc] initWithTuiGuangCellModel:selectType data:dateModel];
    ATuiGuangTableViewCell * cell = (ATuiGuangTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ATuiGuangTableViewCell"];
    if (cell == nil) {
        cell = [[ATuiGuangTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ATuiGuangTableViewCell" andData:modelx];
    }
    cell.delegate = delegate;
    return cell;
}


- (instancetype)initWithTuiGuangCellModel:(TuiGuangOrderStatus)orderType  data:(TuiGuangModel *)model{

    self =  [super init];
    if (self){
        self.dataModel = model;
        self.orderType =  orderType;
    }
    return self;
}
@end
