//
//  LWNavigationController.m
//  LuoHBWeiBo
//
//  Created by 罗海波 on 15-3-3.
//  Copyright (c) 2015年 LHB. All rights reserved.
//

#import "LWNavigationController.h"

@interface LWNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation LWNavigationController




/**
 *  一个类初始化时会调用一次
 */
+ (void)initialize
{
    //1、设置导航栏的主题
    [self setupNavBarTheme];
    
   
    //2、设置导航栏的按钮主题
    //[self setupNavBarButtonItemTheme];
}

+ (void)setupNavBarButtonItemTheme
{
    UIBarButtonItem * item = [UIBarButtonItem appearance];
   
    
    //设置文字
    NSMutableDictionary * textAttr = [NSMutableDictionary dictionary];
    textAttr[NSForegroundColorAttributeName] =  LWColor(226, 151, 43);
    //取消阴影
//    textAttr[UITextAttributeTextShadowOffset]=[NSValue valueWithUIOffset:UIOffsetZero];
//    textAttr[UITextAttributeFont] = [UIFont systemFontOfSize:15];

    [item setTitleTextAttributes:textAttr forState:UIControlStateNormal];
//    [item setTitleTextAttributes:textAttr forState:UIControlStateHighlighted];
//    
//    NSMutableDictionary * disabletextAttr = [NSMutableDictionary dictionary];
//    disabletextAttr[UITextAttributeTextColor] = [UIColor grayColor];
//    [item setTitleTextAttributes:disabletextAttr forState:UIControlStateDisabled];
    
//    
//    [self.navigationController.navigationBar setTitleTextAttributes:
//     
//  @{NSFontAttributeName:[UIFont systemFontOfSize:19],
//    
//    NSForegroundColorAttributeName:[UIColor redColor]}];
}
/**
 *  设置导航栏的主题
 */
+ (void)setupNavBarTheme
{
//    //取出appeace对象,就能改导航栏的样式了
   UINavigationBar * NavBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    
    [NavBar setTranslucent:NO];
//    if (!iOS7) {
//        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
//        [NavBar setBackgroundImage:[UIImage imageWithName:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
//    }
    //设置标题样式
    NSMutableDictionary * textAttr = [NSMutableDictionary dictionary];
    
    textAttr[NSForegroundColorAttributeName] = LWColor(226, 151, 43);
//    //取消阴影
//    textAttr[UITextAttributeTextShadowOffset]=[NSValue valueWithUIOffset:UIOffsetZero];
    textAttr[NSFontAttributeName] =  [UIFont fontWithName:@"Helvetica-Bold" size:20];
    [NavBar setTitleTextAttributes:textAttr];
//
//    [NavBar setBackgroundColor:[UIColor colorWithRed:0.898 green:0.447 blue:0.173 alpha:1.000]];

    
//    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    
    
//    [NavBar setBarTintColor:[UIColor colorWithRed:233.0/255 green:147/255.0 blue:25/255.0 alpha:1.000]];
    
//    [NavBar setBackgroundImage:[UIImage imageWithColor:[self colorFromHexRGB:@"33cccc"]]
//     
//                       forBarPosition:UIBarPositionAny
//     
//                           barMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.hidesBarsOnSwipe = YES;
//    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>0) {
       viewController.hidesBottomBarWhenPushed = YES;
        
        // 左上角
        UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        [backButton setImageEdgeInsets:UIEdgeInsetsMake(0.0, -10, 0.0, 0.0)];
//        [backButton setImage:[UIImage imageNamed:@"Nav_Left_Return_Back"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"Nav_Left_Return_White_Back"] forState:UIControlStateNormal];
//        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backButton sizeToFit];
        // 这句代码放在sizeToFit后面
        
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//
//        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_more" hightIcon:@"navigationbar_more_highlighted" target:self action:@selector(more)];
        
       
    }
    
    [super pushViewController:viewController animated:YES];
}


- (void)back
{
    [self popViewControllerAnimated:YES];
}
//- (void)more
//{
//    [self popToRootViewControllerAnimated:YES];
//}


@end
