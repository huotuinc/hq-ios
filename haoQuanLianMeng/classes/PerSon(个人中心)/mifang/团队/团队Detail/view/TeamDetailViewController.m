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
#import "JudgeView.h"


@interface TeamDetailViewController ()<UITableViewDataSource,UITableViewDelegate,TeamHeadViewDelegate,JudgeViewDelegate>

@property (nonatomic,strong) TeamHeadView * head;


@property (nonatomic,strong) UITableView  * content;


@property (nonatomic,strong) JudgeView * judgeView;



@property (nonatomic,strong) NSMutableDictionary * parmae;


@property (nonatomic,strong) NSMutableArray  * dataArray;

@property (nonatomic,assign) TeamSortStatus currentStatus;


//是否头部刷新
@property (nonatomic,assign) int headerFresh;

@end

@implementation TeamDetailViewController

- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSMutableDictionary *)parmae{
    if (_parmae == nil) {
        _parmae = [NSMutableDictionary dictionary];
        [_parmae setObject:@(-1) forKey:@"Relation"];
        [_parmae setObject:@(-1) forKey:@"BuyNum"];
        [_parmae setObject:@(-1) forKey:@"BindMobile"];
        [_parmae setObject:@(-1) forKey:@"LevelId"];
        [_parmae setObject:@(-1) forKey:@"Activate"];
    }
    return _parmae;
}

- (JudgeView *)judgeView{
    if (_judgeView == nil) {
        _judgeView = [[JudgeView alloc] initWithFrame:CGRectMake(KScreenWidth, 0, KScreenWidth, KScreenHeight)];
        _judgeView.delegate = self;
        _judgeView.parmae = self.parmae;
    }
    return _judgeView;
}


- (void)select:(NSMutableDictionary *)dict{
    [self getData:0];
    LWLog(@"%@",dict);
}


- (void)TeamHeadViewClick:(TeamSortStatus)type{
    
    
    switch (type) {
        case TeamSortByShaiXuanStatus:{
            
            [self.view.window addSubview:self.judgeView];
            [UIView animateWithDuration:1.0f animations:^{
                self.judgeView.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
            }];
            LWLog(@"xxxx");
        }
        default:{
            self.currentStatus = type;
            [self getData:0];
        }
        break;
    }
}


- (void)getData:(bool)hf{ //0 头 1 表示尾巴
//
//    SearchDayType    是    int    查询时间类型,默认-1全部,0-今日,1-本月
//    BuyNum    是    int    购买次数 默认全部-1,无订单0,以上为传入个数
//  *  LevelId    是    int    用户身份等级 默认全部-1,其他传入用户等级Id
//  *  Relation    是    int    直接、间接团队，默认全部-1，直接0，间接1
//    BindMobile    是    int    绑定手机号 默认-1 1绑定 0不绑定
//    Activate    是    int    是否活跃,默认全部-1,活跃1,不活跃0
//    ActivateHour    是    int    多少时间内活跃
//    OrderByType    是    int    排序：0注册时间顺序 1注册时间倒序 2积分倒序 3积分顺序 4粉丝数倒序 5粉丝数顺序 6 最后登录时间倒序 7 最后登录时间顺序
//    PageIndex    是    int    页码，默认1
//    PageSize    是    int    每页显示数量，默认10
    
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    if (self.type == 0) {
        [dict setObject:@(-1) forKey:@"SearchDayType"];
    }else{
        [dict setObject:@(0) forKey:@"SearchDayType"];
    }
    [dict addEntriesFromDictionary:[self.parmae copy]];
    if ([[self.parmae objectForKey:@"Activate"] intValue] == 1) {
        [dict setObject:@(24) forKey:@"ActivateHour"];
    }else{
        [dict setObject:@(0) forKey:@"ActivateHour"];
    }
    [dict setObject:@(self.currentStatus) forKey:@"OrderByType"];
    if (hf == 0) {
        self.headerFresh = 1;
        [dict setObject:@(self.headerFresh) forKey:@"PageIndex"];
    }else{
        self.headerFresh += 1;
        [dict setObject:@(self.headerFresh) forKey:@"PageIndex"];
    }
    
    [dict setObject:@(20) forKey:@"PageSize"];
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"User/GetMemberList" parame:dict isHud:YES isHaseCache:NO success:^(id json) {
    
        NSArray * dataArray =  [TeamPListModel
                                mj_objectArrayWithKeyValuesArray:json[@"data"][@"TeamItem"]];
        if (hf == 0) {
           [self.dataArray removeAllObjects];
            if (dataArray.count) {
                [self.content dissmissEmptyView];
            }else{
                KWeakSelf(self);
                [self.content showEmptyViewClickImageViewBlock:^(id sender) {
                    [weakself getData:1];
                }];
            }
        }
        [self.dataArray addObjectsFromArray:dataArray];
        [self.content reloadData];
        
        [self.content.mj_header endRefreshing];
        [self.content.mj_footer endRefreshing];
        LWLog(@"%@",json);
    } failure:^(NSError *error) {
        [self.content.mj_header endRefreshing];
        [self.content.mj_footer endRefreshing];
    }];
}

- (UITableView *)content{
    if (_content == nil) {
        _content = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _content.delegate = self;
        _content.dataSource = self;
        [_content registerClass:[TeanTableViewCell class] forCellReuseIdentifier:@"TeanTableViewCell"];
        _content.rowHeight = UITableViewAutomaticDimension;
        _content.estimatedRowHeight = 500;
        _content.backgroundColor = LWColor(240, 239, 244);
        _content.separatorStyle = UITableViewCellSeparatorStyleNone;
        _content.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
        _content.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
    }
    return _content;
}


- (void)refreshHeader{
    
    [self getData:0];
    
}

- (void)refreshFooter{
    
    [self getData:1];
    
}



- (TeamHeadView *)head{
    if (_head == nil) {
        _head = [TeamHeadView TeamHeadViewCreate];
        _head.delegate = self;
    }
    return _head;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.currentStatus = TeamSortByTimeFlashBackStatus;
    self.headerFresh = 1;
    
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
    
    LWLog(@"%d",self.type);
    [self getData:0];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TeanTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TeanTableViewCell" forIndexPath:indexPath];
    cell.model = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

@end
