//
//  HTTuiGuangViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTTuiGuangViewController.h"
#import "TuiGuangTopView.h"
#import "XTSegmentControl.h"
#import "TuiGuangTableViewCell.h"



@interface HTTuiGuangViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) TuiGuangTopView * tuiGuangTopView;

@property (nonatomic, strong) XTSegmentControl * segmentControl;

@property (nonatomic, strong) UITableView * contentView;


@end

@implementation HTTuiGuangViewController


- (UITableView *)contentView {
    if (_contentView == nil){
        _contentView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _contentView.delegate = self;
        _contentView.dataSource = self;
        [_contentView registerClass:[TuiGuangTableViewCell class] forCellReuseIdentifier:@"TuiGuangTableViewCell"];
    }
    return _contentView;
}


- (TuiGuangTopView *)tuiGuangTopView {
    if (_tuiGuangTopView == nil){
        _tuiGuangTopView = [[TuiGuangTopView alloc] init];
        _tuiGuangTopView.backgroundColor = [UIColor whiteColor];
        
    }
    return _tuiGuangTopView;
}


- (XTSegmentControl *)segmentControl {
    if (_segmentControl == nil){
        _segmentControl = [[XTSegmentControl alloc]
            initWithFrame:CGRectMake(0, 0, KScreenWidth , kAdaptedWidth(40))
                    Items:@[@"全部",@"预估",@"收获",@"失效",@"到账"] andSelectColor:[UIColor orangeColor] andDefault:[UIColor blackColor]
            selectedBlock:^(NSInteger index) {
        }];
    }
    return _segmentControl;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    self.navigationItem.title = @"推广订单";
    
    [self.navigationController setNavigationBarHidden:NO];
    [self.view addSubview:self.tuiGuangTopView];
    [self.tuiGuangTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.view.mas_top);
        make.height.mas_equalTo(kAdaptedHeight(71 * 0.5));
    }];

    [self.view addSubview:self.segmentControl];
    [self.segmentControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.tuiGuangTopView.mas_bottom);
        make.height.mas_equalTo(kAdaptedHeight(40));
    }];


    [self.view addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.segmentControl.mas_bottom);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];

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




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TuiGuangTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TuiGuangTableViewCell" forIndexPath:indexPath];
    return cell;
}
@end
