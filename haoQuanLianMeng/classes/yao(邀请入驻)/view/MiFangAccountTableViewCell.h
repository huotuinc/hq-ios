//
//  MiFangAccountTableViewCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/19.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MiFangYaoQingModel.h"


@protocol MiFangAccountTableViewDelegate <NSObject>

- (void)MiFangAccountClick:(NSUInteger)index andUrl:(NSString *)url;

@end


@interface MiFangAccountTableViewCell : UITableViewCell

- (void)configure:(MiFangYaoQingModel *)model;

@property (nonatomic,weak) id  <MiFangAccountTableViewDelegate> delegate;

@end
