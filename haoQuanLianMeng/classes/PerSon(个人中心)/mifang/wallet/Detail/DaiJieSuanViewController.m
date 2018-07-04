//
//  DaiJieSuanViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/3.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "DaiJieSuanViewController.h"
#import "MiFangWalletHeader.h"


@interface DaiJieSuanViewController ()


@property (nonatomic,strong) MiFangWalletHeader * headerxx;

@end

@implementation DaiJieSuanViewController


- (MiFangWalletHeader *)headerxx{
    if (_headerxx == nil) {
        _headerxx = [[MiFangWalletHeader alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 44)];
        _headerxx.backgroundColor = [UIColor whiteColor];
    }
    return _headerxx;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
