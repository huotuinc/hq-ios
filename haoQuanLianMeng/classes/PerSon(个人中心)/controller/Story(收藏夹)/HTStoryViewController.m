//
//  HTStoryViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/6.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTStoryViewController.h"
#import "HTStoryBottomView.h"
#import "HomeRowTableViewCell.h"

@interface HTStoryViewController ()<UITableViewDelegate,UITableViewDataSource,HTStoryBottomViewDelegate>

@property (nonatomic,strong) HTStoryBottomView * bottom;

@property (nonatomic,strong) UITableView * contaner;

@property (nonatomic,strong) UIBarButtonItem * right;


@property (nonatomic,strong) NSMutableArray * selectArray;

@end

@implementation HTStoryViewController


- (NSMutableArray *)selectArray{
    if (_selectArray == nil) {
        _selectArray = [NSMutableArray array];
    }
    return _selectArray;
}


- (UIBarButtonItem *)right{
    if (_right == nil) {
        _right = [[UIBarButtonItem alloc] initWithTitle:@"批量删除" style:UIBarButtonItemStylePlain target:self action:@selector(doClick)];

    }
    return _right;
}


- (UITableView *)contaner{
    if (_contaner == nil) {
        _contaner = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _contaner.delegate = self;
        _contaner.dataSource = self;
        _contaner.allowsMultipleSelectionDuringEditing = YES;
        [_contaner registerClass:[HomeRowTableViewCell class] forCellReuseIdentifier:@"HomeRowTableViewCell"];
        [_contaner setEditing:YES animated:YES];
    }
    return _contaner;
}

- (HTStoryBottomView *)bottom{
    if (_bottom == nil) {
        _bottom = [[HTStoryBottomView alloc] init];
        _bottom.delegate = self;
    }
    return _bottom;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title = @"收藏夹";
    
    self.navigationItem.rightBarButtonItem = self.right;
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.bottom];
    [self.bottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.height.mas_equalTo(kAdaptedWidth(46));
    }];
    // Do any additional setup after loading the view.
    
    
    [self.view addSubview:self.contaner];
    [self.contaner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.bottom.mas_equalTo(self.bottom.mas_top);
        make.top.mas_equalTo(self.view.mas_top);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeRowTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HomeRowTableViewCell" forIndexPath:indexPath];
    
    return cell;
}


-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath* )indexPath
{
    return UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LWLog(@"%ld",(long)indexPath.row);
    [self.selectArray addObject:indexPath];
    [self.bottom setNumber:(int)self.selectArray.count];
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.selectArray removeObject:indexPath];
    [self.bottom setNumber:(int)self.selectArray.count];
}


- (void)shareClick{
    LWLog(@"xxxxx");
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
