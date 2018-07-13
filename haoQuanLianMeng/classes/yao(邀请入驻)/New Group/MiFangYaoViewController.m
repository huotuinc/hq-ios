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

@interface MiFangYaoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * contentTableview;

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


- (UITableView *)contentTableview{
    if (_contentTableview == nil) {
        _contentTableview = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _contentTableview.delegate = self;
        _contentTableview.dataSource = self;
        _contentTableview.rowHeight = UITableViewAutomaticDimension;
        _contentTableview.estimatedRowHeight = 500;
        [_contentTableview registerClass:[YaoqingHeadView class] forCellReuseIdentifier:@"YaoqingHeadView"];
        [_contentTableview registerClass:[YaoQingBtnCell class] forCellReuseIdentifier:@"YaoQingBtnCell"];
        
//        _contentTableview.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
        _contentTableview.sectionFooterHeight  = 10;
        _contentTableview.sectionHeaderHeight = 0;
    }
    return _contentTableview;
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
    
    
    [self.view addSubview:self.contentTableview];
    [self.contentTableview mas_makeConstraints:^(MASConstraintMaker *make) {
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
    
    
//
    
}


- (void)buyAccount{
    
    BuyAccountTableViewController * vc = [[BuyAccountTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    vc.type = 0;
    [self.navigationController pushViewController:vc animated:YES];
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
