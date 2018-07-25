//
//  MfBangDingTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/28.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MfBangDingTableViewController.h"
#import "LWTabBarController.h"

@interface MfBangDingTableViewController ()

@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *inPutPhone;
@property (weak, nonatomic) IBOutlet UITextField *inputCode;
@property (weak, nonatomic) IBOutlet UILabel *yanz;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation MfBangDingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);

    self.yanz.layer.cornerRadius = 5;
    self.yanz.layer.masksToBounds = YES;
    self.btn.layer.cornerRadius = 5;
    self.btn.layer.masksToBounds = YES;
    
    
    
    
    self.navigationItem.title = @"绑定手机号";
   
    
    
    KWeakSelf(self);
    self.yanz.userInteractionEnabled = YES;
    [self.yanz bk_whenTapped:^{

        [weakself getCode];

    }];
}



- (void)getCode{
//    /user/sendCode
    if(![[HTTool HTToolShare] HTToolValidateMobile:self.inPutPhone.text]){
        [MBProgressHUD showError:@"手机号码错误"];
    }

    [self begainCountDown];
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"user/sendCode"
                                                                 parame:dict isHud:NO isHaseCache:NO success:^(id json) {
            LWLog(@"%@",json);
                                                                     [MBProgressHUD  showMessage:@"验证码请求成功"];
#warning luohaibo  获取手机验证码
        } failure:^(NSError *error) {

        }];

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//绑定手机
- (IBAction)btn:(id)sender {
    
//    user/updateMobile
    if (!self.inputCode.text.length){
        [MBProgressHUD showError:@"验证码错误"];
    }
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"mobile"] = self.inPutPhone.text;
    dict[@"code"] = self.inputCode.text;
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"user/updateMobile" parame:dict isHud:YES isHaseCache:NO success:^(id json) {
        LWLog(@"%@",json);
#warning luohaibo
        if (self.phoneType == 0){
            LWTabBarController * vc = [[LWTabBarController alloc] init];//
            [UIApplication sharedApplication].keyWindow.rootViewController = vc;
        }else{
            [MBProgressHUD showSuccess:json[@"msg"]];
        }

    } failure:^(NSError *error) {
        LWLog(@"%@",error.description);
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0 ) {
        if(self.phoneType == 0)
            return 0;
        return 1;
    }
    return 2;
}
- (void)begainCountDown{
    __block NSInteger timeout = 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.yanz.userInteractionEnabled = YES;
                self.yanz.text = @"获取验证码";
                self.yanz.backgroundColor = [UIColor blackColor];
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示
                self.yanz.userInteractionEnabled = NO;
                self.yanz.text = [NSString stringWithFormat:@"%ld重新获取",(long)timeout];
                self.yanz.backgroundColor = [UIColor lightGrayColor];
            });
            timeout = timeout - 1;
        }
    });
    dispatch_resume(_timer);
}

@end
