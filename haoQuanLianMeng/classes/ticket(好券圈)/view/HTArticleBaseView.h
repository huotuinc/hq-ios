//
//  HTArticleBaseView.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HTArticleCellModel;

@interface HTArticleBaseView : UIView

//获取高度
- (CGFloat)getHeight;

//设置数据
- (void)configArticleView:(HTArticleCellModel * )model;


@end
