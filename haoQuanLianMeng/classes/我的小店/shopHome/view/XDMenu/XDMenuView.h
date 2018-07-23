//
//  XDMenuView.h
//  TestPresentationController
//
//  Created by 李信达 on 2018/3/28.
//  Copyright © 2018年 李信达. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XDMenuView;
@class XDMenuItem;

typedef void(^XDmenuItemClickBlock)(XDMenuItem * item,XDMenuView * menu);

@interface XDMenuItem : NSObject

@property(nonatomic,copy)XDmenuItemClickBlock clickBlock;
@property(nonatomic,copy)NSString * titleStr;
@property(nonatomic,copy)NSString * iconTitleStr;


+(instancetype) item:(NSString *)titleStr icon:(NSString *)iconTitleStr clickBlock:(XDmenuItemClickBlock) clickBlock;

@end


@interface XDMenuView : UIViewController
@property(nonatomic,copy)UIColor * backColor;
@property(nonatomic,copy)UIColor * titleColor;

+(instancetype)menuViewWithSender:(id)sender;

-(void)addItem:(XDMenuItem *)item;

@end

