//
//  PayMiMaTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/25.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "PayMiMaTableViewController.h"
#import "SettPayPassTableViewController.h"



@interface PayMiMaTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *phoneLable;
@property (weak, nonatomic) IBOutlet UITextField *yanzhengma;
@property (weak, nonatomic) IBOutlet UILabel *yanmaBtn;
@property (weak, nonatomic) IBOutlet UITextField *tuxing;
@property (weak, nonatomic) IBOutlet NNValidationView *tuxingma;


@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

//进行
@property (weak, nonatomic) IBOutlet UILabel *desCripe;


@property (copy, nonatomic)  NSString * tuxiangcode;


@end

@implementation PayMiMaTableViewController


- (void)getCode{
    //    /user/sendCode
//    if(![[HTTool HTToolShare] HTToolValidateMobile:self.inPutPhone.text]){
//        [MBProgressHUD showError:@"手机号码错误"];
//    }
    
    [self begainCountDown];
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"mobile"] = self.phoneNumber;
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"user/sendCode"
                                                          parame:dict isHud:NO isHaseCache:NO success:^(id json) {
                                                              LWLog(@"%@",json);
                                                              [MBProgressHUD  showSuccess:@"验证码请求成功"];
//#warning luohaibo  获取手机验证码
                                                          } failure:^(NSError *error) {
                                                              
                                                          }];
    
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
                self.yanmaBtn.userInteractionEnabled = YES;
                self.yanmaBtn.text = @"获取验证码";
                self.yanmaBtn.backgroundColor = [UIColor blackColor];
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示
                self.yanmaBtn.userInteractionEnabled = NO;
                self.yanmaBtn.text = [NSString stringWithFormat:@"%ld重新获取",(long)timeout];
                self.yanmaBtn.backgroundColor = [UIColor lightGrayColor];
            });
            timeout = timeout - 1;
        }
    });
    dispatch_resume(_timer);
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"设置支付密码";
    self.yanmaBtn.layer.cornerRadius = 5;
    self.yanmaBtn.layer.masksToBounds = YES;
    self.nextBtn.layer.cornerRadius = 5;
    self.tableView.backgroundColor = LWColor(242, 242, 242);
    self.phoneLable.text = [NSString stringWithFormat:@"您当前绑定的手机号:%@",self.phoneNumber];
    
    
    
    self.tuxiangcode = self.tuxingma.charString;
    KWeakSelf(self);
    self.yanmaBtn.userInteractionEnabled = YES;
    [self.yanmaBtn bk_whenTapped:^{
        [weakself getCode];
    }];
    self.tuxingma.changeValidationCodeBlock = ^(NSString * code) {
        weakself.tuxiangcode = code;
        LWLog(@"%@",code);
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)nextStep:(id)sender {
    
    if (![[self.tuxing.text lowercaseString] isEqualToString:[self.tuxiangcode lowercaseString]]) {
        [MBProgressHUD showError:@"图形验证码错误"];
        return;
    }
    if (self.yanzhengma.text.length) {
        
//        user/checkCode
        NSMutableDictionary * dict = [NSMutableDictionary dictionary];
        dict[@"mobile"] = self.phoneNumber;
        dict[@"code"] = self.yanzhengma.text;
        [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"user/checkCode" parame:dict isHud:YES isHaseCache:NO success:^(id json) {
            SettPayPassTableViewController * vc =  [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SettPayPassTableViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        } failure:^(NSError *error) {
            
        }];

        
        
    }
   
    
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
