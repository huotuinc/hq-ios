//
//  HTViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/1.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "LWTabBarController.h"
#import "HTMessageListTableViewController.h"
#import "LWInviteViewController.h"
#import "MFPersonTableViewController.h"
#import "HaoTickContainerViewController.h"
#import "MiFangYaoQingController.h"
#import "MyShopTableViewController.h"


@interface LWTabBarController ()

@end

@implementation LWTabBarController





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //tabbar 的样式
    self.tabBar.tintColor = LWColor(207, 50, 60);
    [self setupAllChildViewControllers];
    
    
}



- (void)setupAllChildViewControllers
{
    HaoTickContainerViewController * backVC = [[HaoTickContainerViewController alloc] init];
    [self setupChildViewController:backVC title:@"素材库" imageName:@"home" selectedImageName:@"home_hight"];
    
    MyShopTableViewController * vc = [[MyShopTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self setupChildViewController:vc title:@"我的小店" imageName:@"home" selectedImageName:@"home_hight"];
  
    MiFangYaoQingController * menberVC1 = [[MiFangYaoQingController alloc] initWithStyle:UITableViewStyleGrouped];
    [self setupChildViewController:menberVC1 title:@"邀请入驻" imageName:@"yqlz" selectedImageName:@"yqlz_hight"];
    
    MFPersonTableViewController * myVC = [[MFPersonTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self setupChildViewController:myVC title:@"个人中心" imageName:@"person" selectedImageName:@"person_hight"];

}


- (void)setupChildViewController:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVC.title = title;
    // 设置图标
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    if (iOS7) {
        childVC.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        childVC.tabBarItem.selectedImage = selectedImage;
    }
//    childVC.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, -8, 0);
    // 2.包装一个导航控制器
    LWNavigationController *nav = [[LWNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
    
}




@end
