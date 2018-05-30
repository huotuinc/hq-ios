//
//  UITableViewCell+CreateCell.m
//  iAsku
//
//  Created by niehaili on 15/5/27.
//
//

#import "UITableViewCell+CreateCell.h"

@implementation UITableViewCell (CreateCell)
+ (UITableViewCell *)cellWithTableView:(UITableView *)tableView
{
    NSString *identifer = NSStringFromClass([self class]);
    return [self cellWithTableView:tableView identifer:identifer withIsExist:YES];
}

+ (UITableViewCell *)cellGetTableView:(UITableView *)tableView
{
    NSString *identifer = NSStringFromClass([self class]);
    return [self cellWithTableView:tableView identifer:identifer withIsExist:NO];
}
/**
 *  根据tableView、identifer创建对应的cell
 *
 *  @param tableView tableView
 *  @param identifer cell的重用标识
 *
 *  @return 返回对应的cell
 */
+ (UITableViewCell *)cellWithTableView:(UITableView *)tableView identifer:(NSString *)identifer withIsExist:(BOOL)isExist
{
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];

    if (!cell) {
//         BOOL isExist = [self fileIsExistWithNibName:identifer];
        if (isExist) {
            cell = [[[NSBundle mainBundle] loadNibNamed:identifer owner:self options:nil] lastObject];
        }
        else
        { 
          
            cell = [[NSClassFromString(identifer) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
@end
