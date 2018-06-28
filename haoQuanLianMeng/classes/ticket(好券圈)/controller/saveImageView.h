//
//  saveImageView.h
//  XingZhang
//
//  Created by 罗海波 on 2017/2/24.
//  Copyright © 2017年 xz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface saveImageView : UIView

@property (weak, nonatomic) IBOutlet UILabel *first;
@property (weak, nonatomic) IBOutlet UILabel *second;
- (void)setTotal:(int)total;
- (void)setProgress:(int)progress;
@end
