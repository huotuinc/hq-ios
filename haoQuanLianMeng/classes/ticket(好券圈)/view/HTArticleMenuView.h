//
//  HTArticleMenuView.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/30.
//  Copyright © 2018年 HT. All rights reserved.
//

typedef enum : NSUInteger {
    HTMenuButtonTypeDownLoadImage,
    HTMenuButtonTypeDownLoadVideo,
    HTMenuButtonTypeCopy,
    HTMenuButtonTypeShare,
    HTMenuButtonTypeOpenWxin,
    HTMenuButtonTypeAkeyToShare,
} HTMenuButtonType;


#import <UIKit/UIKit.h>

@interface HTMenuButton : UIButton
@property (nonatomic ,assign) HTMenuButtonType menubuttontype;
@end



@class HTArticleCellModel;

@protocol HTMenuViewDelegate <NSObject>

- (void)shareADKWithCellModel:(HTArticleCellModel *)cellModel;

@end



@interface HTArticleMenuView : UIView

@property (nonatomic, strong)HTArticleCellModel * cellModel;
@property (nonatomic, assign)id<HTMenuViewDelegate> delegate;

- (void)configArticleView:(HTArticleCellModel *)cellModel withDelegate:(id<HTMenuViewDelegate>)delegate;

@end
