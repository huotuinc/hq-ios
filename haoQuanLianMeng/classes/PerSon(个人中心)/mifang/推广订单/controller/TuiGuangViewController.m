//
//  TuiGuangViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/23.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TuiGuangViewController.h"
#import "XTSegmentControl.h"
#import "TuiGuanListTableViewController.h"
#import "NavRightImage.h"
#import <PGDatePicker.h>
#import <PGDatePickManager.h>

@interface TuiGuangViewController ()<UIScrollViewDelegate,PGDatePickerDelegate,NavRightImageDelegate>


@property (nonatomic, strong) NSArray * titleItems;


@property (nonatomic, strong) XTSegmentControl * segmentControl;


@property(nonatomic,strong) UIScrollView * scrollView;


@property(nonatomic,strong) NavRightImage * btn;


@property (nonatomic,strong) PGDatePicker *datePicker;

@property (nonatomic,assign) NSUInteger index;
@end

@implementation TuiGuangViewController

    
- (NavRightImage *)btn{
    if (_btn == nil) {
        _btn = [[NavRightImage alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        _btn.userInteractionEnabled = YES;
        _btn.delegate = self;
    }
    return _btn;
}
    



- (void)datePicker:(PGDatePicker *)datePicker didSelectDate:(NSDateComponents *)dateComponents{
    int month = (int)dateComponents.month;
    int year = (int)dateComponents.year;
    
    TuiGuanListTableViewController * childVc = self.childViewControllers[self.index];
    childVc.month = month;
    childVc.year = year;
    [childVc timePick];
    
}

// 点击时间选择
- (void)btnRightClick{
    
    PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
    PGDatePicker *datePicker = datePickManager.datePicker;
    datePicker.datePickerMode = PGDatePickerModeYearAndMonth;
    datePicker.datePickerType =  PGDatePickerType1;
    datePicker.delegate = self;
    [self presentViewController:datePickManager animated:false completion:nil];
    

}



    
- (NSArray *)titleItems {
    if(_titleItems == nil){
        _titleItems = @[@"全部",@"待发货",@"待收货",@"已完成",@"已退款"];
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

    NSDate * date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY年MM"];
    NSCalendar * ca = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents *dateComponent = [ca components:unitFlags fromDate:date];
    
    int year = (int)[dateComponent year];
    int month= (int)[dateComponent month];

    for(int i = 0; i<  self.titleItems.count; i++){
        TuiGuanListTableViewController * homeViewController = [[TuiGuanListTableViewController alloc] initWithStyle:UITableViewStylePlain];
        homeViewController.year = year;
        homeViewController.month = month;
        TuiGuangOrderStatus status;
        if (i == 0) {
            status = TuiGuangOrderPlane;
        }else if(i == 1){
            status = TuiGuangOrderWaitSendGoood;
        }else if(i == 2){
            status = TuiGuangOrderWaitGetGood;
        }else if(i == 3){
            status = TuiGuangOrderGetGood;
        }else {
            status = TuiGuangOrderBackGood;
        }
        homeViewController.orderStatus = status;
        [self addChildViewController:homeViewController];
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.btn];
 
    self.navigationItem.title = @"推广订单";
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
    self.index = index;
    [self.segmentControl selectIndex:index];
    // 添加子控制器的view
    [self addChildVcView];
    
    // 当index == 0时, viewWithTag:方法返回的就是self.titlesView
    //    XMGTitleButton *titleButton = (XMGTitleButton *)[self.titlesView viewWithTag:index];
}



@end
