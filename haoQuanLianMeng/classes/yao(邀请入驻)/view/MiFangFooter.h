//
//  MiFangFooter.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/19.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MiFangFooterDelegate <NSObject>


- (void)btnClcik;


@end


@interface MiFangFooter : UIView


@property (nonatomic,weak) id <MiFangFooterDelegate>delegate;

@end
