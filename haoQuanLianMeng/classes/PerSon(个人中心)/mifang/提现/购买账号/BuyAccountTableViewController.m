//
//  BuyAccountTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "BuyAccountTableViewController.h"
#import "BuyAccountTableViewCell.h"
#import "ACBuildTableViewCell.h"
#import "BuyAccountCenTableViewCell.h"
#import "BuyAccountCell.h"
#import "AcFooterView.h"
#import "BuyAccountModel.h"
#import "BuyAccountPayChanel.h"

@interface BuyAccountTableViewController ()<AcFooterViewDelegate>


@property (nonatomic,strong) AcFooterView * acFooter;

//帐号
@property (nonatomic,strong) BuyAccountTableViewCell *cell1;

@property (nonatomic,strong) ACBuildTableViewCell *cell12;


@property (nonatomic,strong) BuyAccountCell * bottom;
@property (nonatomic,strong) BuyAccountModel * accountInfo;
@property (assign,nonatomic) int num;

@property (nonatomic,strong) NSArray * Paylist;
@end

@implementation BuyAccountTableViewController


- (void)btnClick{
    
    int price = [self.accountInfo.GoodsPrice intValue];
    
    int c =  [self.cell12 getCurrentType];
    LWLog(@"xxxx");
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.acFooter = [[AcFooterView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 60)];
    self.acFooter.delegate = self;
    self.tableView.tableFooterView = self.acFooter;
    self.acFooter.backgroundColor = [UIColor clearColor]; 
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    [self.tableView registerClass:[BuyAccountTableViewCell class] forCellReuseIdentifier:@"BuyAccountTableViewCell"];
    [self.tableView registerClass:[ACBuildTableViewCell class] forCellReuseIdentifier:@"ACBuildTableViewCell"];
    if (self.type == 1) {
       [self.tableView registerClass:[BuyAccountCenTableViewCell class] forCellReuseIdentifier:@"BuyAccountCenTableViewCell"];
    }
    
    [self.tableView registerClass:[BuyAccountCell class] forCellReuseIdentifier:@"BuyAccountCell"];    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.acFooter settitle:@"立即付款"];
    
    if (self.type == 0) {
        self.navigationItem.title = @"购买开店帐号";
    }else{
        self.navigationItem.title = @"续费";
    }
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    [self getAccountPrice];
    [self getPayChanle];
    
    self.tableView.sectionFooterHeight = 0;
}


- (void)getAccountPrice{
    //采购帐号
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"Order/GetRenewGoods" parame:nil isHud:NO isHaseCache:NO success:^(id json) {
        BuyAccountModel * model = [BuyAccountModel mj_objectWithKeyValues:json[@"data"]];
        LWLog(@"%@",json);
        [self.cell1 configure:model];
        self.accountInfo = model;
        [self.cell1 addObserver:self forKeyPath:@"num" options:NSKeyValueObservingOptionNew context:nil];
        [self.bottom configure:0 andAccountInfo:0];
    } failure:^(NSError *error) {
        
    }];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
 
    //NSLog(@"keyPath=%@,object=%@,change=%@,context=%@",keyPath,object,change,context);
    int num = [[change objectForKey:@"new"] intValue];
    self.num = num;
    [self.bottom configure:num andAccountInfo:[self.accountInfo.GoodsPrice intValue]];
}


- (void)getPayChanle{
    // 获取支付方式
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"order/paytypelist" parame:nil isHud:YES isHaseCache:NO success:^(id json) {
//        BuyAccountModel * model = [BuyAccountModel mj_objectWithKeyValues:json[@"data"]];
        LWLog(@"%@",json);
        
        NSArray * Paylist =  [BuyAccountPayChanel mj_objectArrayWithKeyValuesArray:[json objectForKey:@"data"]];
        self.Paylist = Paylist;
        [self.cell12 configure:Paylist];
//        [self.cell1 configure:model];
    } failure:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return section == 0 ? 1 : (self.type == 0 ? 2 : 3);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        BuyAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BuyAccountTableViewCell" forIndexPath:indexPath];
        self.cell1 = cell;
        return cell;
    }else{
        
        if (indexPath.row == 0) {
            ACBuildTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ACBuildTableViewCell" forIndexPath:indexPath];
            self.cell12 = cell;
            return cell;
        }else{
            
            if (self.type == 0) {
                BuyAccountCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BuyAccountCell" forIndexPath:indexPath];
                cell.backgroundColor = [UIColor clearColor];
                self.bottom = cell;
                return cell;
            }else{
                
                if(indexPath.row == 1){
                    BuyAccountCenTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BuyAccountCenTableViewCell" forIndexPath:indexPath];
                    cell.height = 0;
                    return cell;
                    
                }else{
                    BuyAccountCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BuyAccountCell" forIndexPath:indexPath];
                    cell.backgroundColor = [UIColor clearColor];
                    return cell;
                }
            }
        }
    }
}

- (void)dealloc
{
    [self.cell1 removeObserver:self forKeyPath:@"num"];
}

@end
