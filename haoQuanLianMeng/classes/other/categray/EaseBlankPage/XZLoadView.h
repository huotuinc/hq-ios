//
//  XZBLoadView.h
//  XingZhang
//
//  Created by 孟辉 on 2017/3/8.
//  Copyright © 2017年 xz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZLoadView : UIView


@property (nonatomic, strong)  NSTimer *timer;
@property (strong, nonatomic)  UILabel *titleLabel;
@property (strong, nonatomic)  UIImageView *loadImageView;

- (void)configView:(NSString *)text;
@end
