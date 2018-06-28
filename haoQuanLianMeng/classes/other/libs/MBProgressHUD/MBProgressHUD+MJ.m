//
//  MBProgressHUD+MJ.m
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD+MJ.h"
#import "XZWaittingView.h"
//#import "XZPasteboardSuccessView.h"

@implementation MBProgressHUD (MJ)
#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:1];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
//    hud.bac
//    hud.dimBackground = YES;
    return hud;
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}

+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

+ (saveImageView *)showSaveImageProgress{
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // 设置图片
    //hud.minSize = CGSizeMake(100, 100);
//    hud.color = OutFitMainColor;
    saveImageView * save = [[[NSBundle mainBundle] loadNibNamed:@"saveImageView" owner:nil options:nil] lastObject];
    save.frame = CGRectMake(0, 0, KScreenWidth-kAdaptedWidth(60), kAdaptedWidth(100));
    // 再设置模式
    hud.customView = save;
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;

    return save;
}

+ (MBProgressHUD *)showLoadViewMessage:(NSString *)message toView:(UIView *)view{
    
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.labelText = message;
    
    
    hud.mode = MBProgressHUDModeIndeterminate;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    return hud;
}
+ (void)showXZSuecceView:(NSString *)title image:(UIImage *)image iconImage:(UIImage *)iconImage{
//    UIView *view = [[UIApplication sharedApplication].windows lastObject];
//    // 快速显示一个提示信息
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    // 设置图片
//    //hud.minSize = CGSizeMake(100, 100);
//    hud.color = OutFitMainColor;
//    XZPasteboardSuccessView * successView = [[XZPasteboardSuccessView alloc] init];
//    successView.frame = CGRectMake(0, 0, kScreenWidth-kAdaptedWidth(100), kAdaptedWidth(120));
//    // 再设置模式
//    [successView setTitle:title image:image iconImage:iconImage];
//    hud.customView = successView;
//    hud.mode = MBProgressHUDModeCustomView;
//    // 隐藏时候从父控件中移除
//    hud.removeFromSuperViewOnHide = YES;
//
//    [hud hide:YES afterDelay:2];
}
+ (MBProgressHUD *)showWaittingView:(NSString *)title {
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // 设置图片
    //hud.minSize = CGSizeMake(100, 100);
    hud.color = [UIColor redColor];
    XZWaittingView * waittingView = [[XZWaittingView alloc] init];
    waittingView.frame = CGRectMake(0, 0, KScreenWidth-kAdaptedWidth(100), kAdaptedWidth(120));
    // 再设置模式
    [waittingView configView:title];
    hud.customView = waittingView;
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    //[hud hide:YES afterDelay:2];
    return hud;
}
+ (MBProgressHUD *)showLoadView:(NSString *)title {
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // 设置图片
    //hud.minSize = CGSizeMake(100, 100);
//    hud.color = OutFitMainColor;
    XZWaittingView * waittingView = [[XZWaittingView alloc] init];
    waittingView.frame = CGRectMake(0, 0, kAdaptedWidth(150), kAdaptedWidth(100));
    // 再设置模式
    [waittingView configView:title];
    hud.customView = waittingView;
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    //[hud hide:YES afterDelay:2];
    return hud;
}
@end
