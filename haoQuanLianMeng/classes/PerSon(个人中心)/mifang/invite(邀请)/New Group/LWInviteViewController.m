//
//  LWInviteViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "LWInviteViewController.h"
#import "InviteHeader.h"


@interface LWInviteViewController ()

@property (nonatomic,strong) InviteHeader * inviteHeader;
@end

@implementation LWInviteViewController


- (InviteHeader *)inviteHeader{
    if (_inviteHeader == nil) {
        _inviteHeader = [[InviteHeader alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 200)];
    }
    return _inviteHeader;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.inviteHeader];
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
