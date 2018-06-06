//
//  HomeOtherSectionHeaderView.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeOtherSectionHeaderViewDelegate <NSObject>


- (void)selectItem:(int)type;

@end


@interface HomeOtherSectionHeaderView : UIView


@property (nonatomic,weak) id <HomeOtherSectionHeaderViewDelegate> delegate;
@end
