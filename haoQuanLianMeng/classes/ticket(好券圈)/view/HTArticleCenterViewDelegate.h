//
//  HTArticleCenterViewDelegate.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HTArticleTableViewCell;
@class HTArticleCellModel;

@protocol HTArticleCenterViewDelegate <NSObject>

- (void)articleTableViewCell:(HTArticleTableViewCell *)tableViewCell selectedVideoWithDataModel:(HTArticleCellModel *)cellModel;

- (void)articleTableViewCell:(HTArticleTableViewCell *)tableViewCell saveVideoWithDataModel:(HTArticleCellModel *)cellModel;

- (void)articleTableViewCell:(HTArticleTableViewCell *)tableViewCell saveImageWithDataModel:(HTArticleCellModel *)cellModel;


- (void)articleTableViewCell:(HTArticleTableViewCell *)tableViewCell  shareWxinWithDataModel:(HTArticleCellModel *)cellModel;



@end
