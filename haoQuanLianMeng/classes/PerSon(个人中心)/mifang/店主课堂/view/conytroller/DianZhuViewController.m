//
//  DianZhuViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/23.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "DianZhuViewController.h"
#import "XTSegmentControl.h"
#import "DianZhuTableViewController.h"
#import "DZOption.h"


@interface DianZhuViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSArray * titleItems;


@property (nonatomic, strong) XTSegmentControl * segmentControl;


@property(nonatomic,strong) UIScrollView * scrollView;


//
@property(nonatomic,strong) NSArray * dataTitleOption;


@end

@implementation DianZhuViewController

- (NSArray *)titleItems {
    if(_titleItems == nil){
        NSMutableArray * temp = [NSMutableArray array];
        for (int i = 0; i < self.dataTitleOption.count; i++) {
            DZOption * t = [self.dataTitleOption objectAtIndex:i];
            [temp addObject:t.title];
        }
        _titleItems = [temp copy];
    }
    return _titleItems;
}

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


- (void)setupTitlesView
{
    
    
    self.segmentControl = [[XTSegmentControl alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth , kAdaptedWidth(40)) Items:self.titleItems andSelectColor:[UIColor orangeColor] andDefault:[UIColor blackColor] selectedBlock:^(NSInteger index) {
        
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
        DianZhuTableViewController * homeViewController = [[DianZhuTableViewController alloc] initWithStyle:UITableViewStylePlain];
        DZOption * model = [self.dataTitleOption objectAtIndex:i];
        homeViewController.type = model.typeId;
        [self addChildViewController:homeViewController];
    }
}



- (void)initData{

    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"ShopClassRoom/categorys" parame:nil isHud:YES isHaseCache:NO success:^(id json) {
        LWLog(@"%@",json);
        NSArray * dataArray =  [DZOption mj_objectArrayWithKeyValuesArray:json[@"data"]];
        self.dataTitleOption = dataArray;
        [self setUpInit];
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"店主课堂";
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self initData];
    
    
    
    
}

- (void)setUpInit{
    
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

@end
