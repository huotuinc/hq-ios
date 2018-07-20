//
//  MiFangYaoViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/19.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MiFangYaoViewController.h"
#import "YaoqingHeadView.h"
#import "YaoQingBtnCell.h"
#import "BuyAccountTableViewController.h"
#import <WebKit/WebKit.h>
#import "ToBeAgentTableViewController.h"


@interface MiFangYaoViewController ()<UITableViewDelegate,WKUIDelegate,WKNavigationDelegate>

@property (strong, nonatomic) WKWebView *webView;

@property (nonatomic,strong) UIButton  * btn;


@end

@implementation MiFangYaoViewController

- (UIButton *)btn{
    if (_btn == nil) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(0, KScreenHeight - 50, KScreenWidth, 50)];
        [_btn addTarget:self action:@selector(buyAccount) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _btn;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.btn];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_equalTo(50);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
    
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.navigationController.navigationBar.hidden = NO;
    
    WKWebViewConfiguration * internalConfig = [[WKWebViewConfiguration alloc] init];
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) configuration:internalConfig];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    
    
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.view.mas_top);
        make.bottom.mas_equalTo(self.btn.mas_top);
    }];
    
    
    if (self.type == 0) {
       _btn.backgroundColor = [UIColor redColor];
        [_btn setTitle:@"采购帐号" forState:UIControlStateNormal];
    }else{
        _btn.backgroundColor = [UIColor blueColor];
         [_btn setTitle:@"成为代理商" forState:UIControlStateNormal];
    }
    
//    self.funUrl = @"http://www.baidu.com";
    NSString * encodeUrl;
    if (self.needEnCode) {
        encodeUrl = [self.funUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
    }else{
        encodeUrl = [self.funUrl copy];
    }
    //
    LWLog(@"%@",self.funUrl);
    NSURL * urlStr = [NSURL URLWithString:encodeUrl];
    NSMutableURLRequest * req = [[NSMutableURLRequest alloc] initWithURL:urlStr];
    //    req.allHTTPHeaderFields = [[HTTool HTToolShare] NHToolSetCookes];
    
    //    [self.webView loadRequest:req];
    //加载刷新控件
    //    [self AddMjRefresh];
    
//    [self initWebViewProgress];
    
    [self.webView loadRequest:req];
    
//
    
}


- (void)buyAccount{
    
    if (self.type == 0) {
        BuyAccountTableViewController * vc = [[BuyAccountTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
        vc.type = 0;
        [self.navigationController pushViewController:vc animated:YES];
    }else{ //成为代理
        
        
        ToBeAgentTableViewController * vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ToBeAgentTableViewController"];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        YaoqingHeadView * cell = [tableView dequeueReusableCellWithIdentifier:@"YaoqingHeadView" forIndexPath:indexPath];
        return cell;
    }else{
        YaoQingBtnCell * cell = [tableView dequeueReusableCellWithIdentifier:@"YaoQingBtnCell" forIndexPath:indexPath];
        return cell;
    }
    
}
@end
