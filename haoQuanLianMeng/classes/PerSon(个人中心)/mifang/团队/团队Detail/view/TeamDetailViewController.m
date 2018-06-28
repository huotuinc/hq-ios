//
//  TeamDetailViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "TeamDetailViewController.h"
#import "TeamHeadView.h"
#import "TeanTableViewCell.h"

@interface TeamDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) TeamHeadView * head;


@property (nonatomic,strong) UITableView  * content;


@end

@implementation TeamDetailViewController


- (UITableView *)content{
    if (_content == nil) {
        _content = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _content.delegate = self;
        _content.dataSource = self;
        [_content registerClass:[TeanTableViewCell class] forCellReuseIdentifier:@"TeanTableViewCell"];
        _content.rowHeight = UITableViewAutomaticDimension;
        _content.estimatedRowHeight = 500;
    }
    return _content;
}
- (TeamHeadView *)head{
    if (_head == nil) {
        _head = [TeamHeadView TeamHeadViewCreate];
    }
    return _head;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    [self.view addSubview:self.head];
    [self.head mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.view.mas_top);
        make.height.mas_equalTo(44);
        
        
    }];
    
    
    [self.view addSubview:self.content];
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.head.mas_bottom);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TeanTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TeanTableViewCell" forIndexPath:indexPath];
    return cell;
}

@end
