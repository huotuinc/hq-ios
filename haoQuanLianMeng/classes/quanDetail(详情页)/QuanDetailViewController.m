//
//  QuanDetailViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/31.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "QuanDetailViewController.h"
#import "QuanDetailBottomView.h"
#import "QuanDetailTitleView.h"

@interface QuanDetailViewController ()


@property (nonatomic,strong) UIButton * btn;

@property (nonatomic,strong) UIScrollView * container;

@property (nonatomic,strong) QuanDetailBottomView * quanBottom;


//商品大图
@property (nonatomic,strong) UIImageView  * headIconView;

@property (nonatomic,strong) QuanDetailTitleView  * centerHeaderView;
@end

@implementation QuanDetailViewController


- (QuanDetailTitleView *)centerHeaderView{
    if (_centerHeaderView == nil) {
        
        _centerHeaderView = [[QuanDetailTitleView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 0)];
//        _centerHeaderView.backgroundColor = [UIColor grayColor];
    }
    return _centerHeaderView;
}

- (UIImageView *)headIconView{
    if (_headIconView == nil) {
        _headIconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenWidth)];
        _headIconView.backgroundColor = [UIColor yellowColor];
    }
    return _headIconView;
}


- (QuanDetailBottomView *)quanBottom{
    if (_quanBottom == nil) {
        _quanBottom = [QuanDetailBottomView QuanDetailBottomViewShare];
    }
    return _quanBottom;
}

- (UIScrollView *)container{
    if (_container == nil) {
        _container = [[UIScrollView alloc] init];
        _container.contentInset = UIEdgeInsetsMake(0, 0, 88, 0);
    }
    return _container;
}


- (UIButton *)btn{
    if (_btn == nil) {
        _btn = [[UIButton alloc] init];
        [_btn setImage:[UIImage imageNamed:@"quan_back"] forState:UIControlStateNormal];
        [_btn sizeToFit];
    }
    return _btn;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
//    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.container];
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    [self.view insertSubview:self.btn aboveSubview:self.container];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(40);
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(30);
    }];
    
    
    [self.view insertSubview:self.quanBottom aboveSubview:self.container];
    [self.quanBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(88);
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
    
    
    [self setUPInit];
    
}

- (void)setUPInit{
    [self.container addSubview:self.headIconView];
    
    
    LWLog(@"%@",NSStringFromCGRect(self.centerHeaderView.frame));
    self.centerHeaderView.y = CGRectGetMaxY(self.headIconView.frame);
    
    [self.container addSubview:self.centerHeaderView];
    
    
    self.container.contentSize = CGSizeMake(KScreenWidth, CGRectGetMaxY(self.centerHeaderView.frame));
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
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
