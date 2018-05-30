//
//  UITableViewCell+CreateCell.h
//  iAsku
//
//  Created by niehaili on 15/5/27.
//
//

#import <UIKit/UIKit.h>
@interface UITableViewCell (CreateCell)

/**
 *  根据tableView、重用标识 创建对应的cell 根据 xib 加载
 *
 *  @param tableView tableView
 *
 *  @return 返回对应的cell
 */
+ (UITableViewCell *)cellWithTableView:(UITableView *)tableView;
/**
 *  根据tableView、重用标识 创建对应的cell  没有 xib
 *
 *  @param tableView tableView
 *
 *  @return 返回对应的cell
 */
+ (UITableViewCell *)cellGetTableView:(UITableView *)tableView;
@end
