//
//  HTPersonTableViewCell.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTPersonTableViewCell : UITableViewCell


- (void)setHTPersonName:(NSString *)name andIconName:(NSString * )iconName;





- (void)cellClickAT:(NSIndexPath *) index andVC:(UIViewController *)vc;

@end
