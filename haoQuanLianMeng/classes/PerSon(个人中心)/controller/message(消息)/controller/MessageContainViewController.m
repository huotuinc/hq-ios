//
//  MessageContainViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MessageContainViewController.h"
#import "XTSegmentControl.h"
#import "HTMessageListTableViewController.h"

@interface MessageContainViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) XTSegmentControl * segmentControl;


@property (nonatomic, strong) NSArray * titleItems;


@property(nonatomic,strong) UIScrollView * scrollView;

@end

@implementation MessageContainViewController


- (void)setupScrollView
{
    // 不允许自动调整scrollView的内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    //    scrollView.backgroundColor = [UIColor redColor];
    scrollView.frame = self.view.bounds;
    //    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    // 添加所有子控制器的view到scrollView中
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * scrollView.frame.size.width, 0);
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    self.scrollView.backgroundColor = [UIColor whiteColor];
}


- (NSArray *)titleItems {
    if(_titleItems == nil){
        _titleItems = @[@"全部",@"系统消息",@"注册通知",@"支付通知"];
    }
    return _titleItems;
}


- (void)setupTitlesView
{
    
    
    
    self.segmentControl = [[XTSegmentControl alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth , kAdaptedWidth(50)) Items:self.titleItems andSelectColor:[UIColor blackColor] andDefault:[UIColor blackColor] selectedBlock:^(NSInteger index) {
        
        //        [self selectCurrentOption:index];
    }];
    [self.segmentControl setDefaultColor:[UIColor blackColor]];
    [self.segmentControl setDefaultColor:[UIColor orangeColor]];
    [self.view addSubview:self.segmentControl];
    
    
    //    self.rightIcon.frame = CGRectMake(CGRectGetMaxX(self.segmentControl.frame), 0, kAdaptedWidth(40), kAdaptedWidth(40));
    //    [self.view addSubview:self.rightIcon];
    
}

- (void)addChildVcView
{
    // 子控制器的索引
    NSUInteger index = self.scrollView.contentOffset.x / KScreenWidth;
    
    // 取出子控制器
    UIViewController *childVc = self.childViewControllers[index];
    if ([childVc isViewLoaded]) return;
    
    childVc.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:childVc.view];
}


- (void)setupChildViewControllers
{
    for(int i = 0; i<  self.titleItems.count; i++){
        HTMessageListTableViewController * homeViewController = [[HTMessageListTableViewController alloc] init];
        homeViewController.type = i;
//        homeViewController.content = CGRectGetMaxY(self.navigationController.navigationBar.frame);
        [self addChildViewController:homeViewController];
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:NO];
    
    self.navigationItem.title = @"消息动态";
    
    [self setupChildViewControllers];
    
    [self setupScrollView];
    
    [self setupTitlesView];
    
    [self addChildVcView];
    
}

/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 使用setContentOffset:animated:或者scrollRectVisible:animated:方法让scrollView产生滚动动画
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self addChildVcView];
}

/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 人为拖拽scrollView产生的滚动动画
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 选中\点击对应的按钮
    NSUInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    //    HomeTitleButton *titleButton = self.titleView.subviews[index];
    //    [self.titleView titleClick:titleButton];
    
    [self.segmentControl selectIndex:index];
    // 添加子控制器的view
    [self addChildVcView];
    
    // 当index == 0时, viewWithTag:方法返回的就是self.titlesView
    //    XMGTitleButton *titleButton = (XMGTitleButton *)[self.titlesView viewWithTag:index];
}


- (void)dealloc{
    [self.navigationController setNavigationBarHidden:YES];
}
@end
