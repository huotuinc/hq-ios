//
//  JudgeView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "JudgeView.h"
#import "PriceJudgeCollectionViewCell.h"
#import "TeamSelectList.h"
#import "PriceJudgeCollectionViewCell.h"
#import "TeamSelectList.h"
#import "ReusableView.h"



@interface JudgeView ()<UICollectionViewDelegate
,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView * contentView;


@property (nonatomic,strong) UIView * container;


@property (nonatomic,strong) UIButton * leftBtn;


@property (nonatomic,strong) UIButton * rightBtn;


@property (nonatomic,strong) NSMutableArray * dataArray;

@property (nonatomic,strong) NSMutableArray * defaultArray;

@property (nonatomic,strong) NSMutableArray * selectArray;


@property (nonatomic,strong) NSMutableArray * vipArray;

@end


@implementation JudgeView


- (NSMutableArray *)vipArray{
    if (_vipArray == nil) {
        _vipArray = [NSMutableArray array];
    }
    return _vipArray;
}

- (NSMutableArray *)selectArray{
    if (_selectArray == nil) {
        _selectArray = [NSMutableArray array];
    }
    return _selectArray;
}


- (NSMutableArray *)defaultArray{
    if (_defaultArray == nil) {
        
        TeamSelectList * model = [[TeamSelectList alloc] init];
        model.title = @"所属团队";
        model.itemArray = @[@{@"一级团队":@0},@{@"二级团队":@1}];
        
        TeamSelectList * model1 = [[TeamSelectList alloc] init];
        model1.title = @"下单次数";
        model1.select = -1;
        model1.itemArray = @[@{@"无订单":@0},@{@"1次及以上":@1},@{@"3次及以上":@3},@{@"5次及以上":@5}];
        TeamSelectList * model3 = [[TeamSelectList alloc] init];
        model3.title = @"手机";
        model3.itemArray = @[@{@"已绑定":@0},@{@"未绑定":@1}];
        
        TeamSelectList * model4 = [[TeamSelectList alloc] init];
        model4.title = @"登录";
        model4.itemArray = @[@{@"24小时登录":@0},@{@"24小时未登录":@1}];
        _defaultArray = [NSMutableArray array];
        [_defaultArray addObject:model];
        [_defaultArray addObject:model1];
        [_defaultArray addObject:model3];
        [_defaultArray addObject:model4];
    }
    return _defaultArray;
}


- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (UIButton *)leftBtn{
    if (_leftBtn == nil) {
        _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, KScreenHeight - 44, KScreenWidth * 0.25, 44)];
        [_leftBtn setTitle:@"重置" forState:UIControlStateNormal];
        
//        [_leftBtn setTitleColor:<#(nullable UIColor *)#> forState:<#(UIControlState)#>]
        [_leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(clearSelect) forControlEvents:UIControlEventTouchUpInside];
        _leftBtn.backgroundColor = LWColor(245, 245, 245);
    }
    return _leftBtn;
}

- (void)quedingSelect{
    
    
//    NSMutableDictionary * d = [NSMutableDictionary dictionary];
    for (int i = 0; i < self.dataArray.count; i++) {
        TeamSelectList * model = self.dataArray[i];
        LWLog(@"%d",model.select);
        
        if (i == 0) {
            [self.parmae setObject:@(model.select) forKey:@"Relation"];
        }else if(i == 1){
            if (model.select == -1 || model.select == 0) {
               [self.parmae setObject:@(0) forKey:@"BuyNum"];
            }else if(model.select == 1){
                [self.parmae setObject:@(1) forKey:@"BuyNum"];
            }else if(model.select == 2){
                [self.parmae setObject:@(3) forKey:@"BuyNum"];
            }else{
              [self.parmae setObject:@(5) forKey:@"BuyNum"];
            }
            
        }else if(i == 2){
            if (model.select > -1) {
                NSDictionary * dict =  [model.itemArray objectAtIndex:model.select];
                [self.parmae setObject:@([dict[self.vipArray[model.select]] intValue]) forKey:@"LevelId"];
            }else{
                [self.parmae setObject:@(-1) forKey:@"LevelId"];
            }
        }else if(i == 3){
            [self.parmae setObject:@(model.select) forKey:@"BindMobile"];
        }else {
            [self.parmae setObject:@(model.select) forKey:@"Activate"];
        }
    }
    LWLog(@"xxxxx");
    if ([self.delegate respondsToSelector:@selector(select:)]) {
        [self.delegate select:self.parmae];
        [self hidden];
    }
    
}


- (void)clearSelect{
    
    for (int i = 0; i < self.dataArray.count; i++) {
        TeamSelectList * model = self.dataArray[i];
        model.select = -1;
    }
    [self.contentView reloadData];
    
}
- (UIButton *)rightBtn{
    if (_rightBtn == nil) {
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth * 0.25, KScreenHeight - 44, KScreenWidth * 0.25, 44)];
        [_rightBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(quedingSelect) forControlEvents:UIControlEventTouchUpInside];
        _rightBtn.backgroundColor = [UIColor redColor];
    }
    return _rightBtn;
}


- (UIView *)container{
    if (_container == nil) {
        _container = [[UIView alloc] initWithFrame:CGRectMake(KScreenWidth * 0.5, 0, KScreenWidth * 0.5, KScreenHeight)];
        _container.userInteractionEnabled = YES;
//        [_container bk_whenTapped:^{
//
//        }];
        _container.backgroundColor = [UIColor whiteColor];
    }
    return _container;
}


- (UICollectionView *)contentView{
    if (_contentView == nil) {
        
        UICollectionViewFlowLayout * lay = [[UICollectionViewFlowLayout alloc] init];
        lay.scrollDirection = UICollectionViewScrollDirectionVertical;
        lay.itemSize = CGSizeMake((KScreenWidth * 0.5 - 25) * 0.5 , 30 );
        //        lay.estimatedItemSize = CGSizeMake(KScreenWidth-40, 200);
        //        lay.minimumLineSpacing = 10;
        //        lay.minimumInteritemSpacing = 10;
        _contentView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:lay];
        _contentView.userInteractionEnabled = YES;
        //        _goodView.collectionViewLayout = lay;
        _contentView.delegate = self;
        _contentView.dataSource = self;
//        _contentView.backgroundColor = [UIColor yellowColor];
        _contentView.contentInset = UIEdgeInsetsMake(20, 5, 0, 5);
        //        _judgeView.pagingEnabled = YES;
//        _contentView.userInteractionEnabled = YES;
//        [_contentView bk_whenTapped:^{
//
//        }];
        _contentView.backgroundColor = [UIColor whiteColor];
        [_contentView registerClass:[PriceJudgeCollectionViewCell class] forCellWithReuseIdentifier:@"PriceJudgeCollectionViewCell"];
        [_contentView registerClass:[ReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    }
    return _contentView;
}


- (void)getUserLevel{
//    User/GetLevelList
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolGet:@"User/GetLevelList" parame:nil isHud:NO isHaseCache:NO success:^(id json) {
        LWLog(@"%@",json);
        NSArray * data =  [json objectForKey:@"data"];
        if (data.count) {
            TeamSelectList * model2 = [[TeamSelectList alloc] init];
            model2.title = @"身份";
            NSMutableArray * dataArry = [NSMutableArray array];
            for (int i = 0; i < data.count; i++) {
                NSDictionary * dict = data[i];
                [self.vipArray addObject:dict[@"levelName"]];
                NSDictionary * d = [NSDictionary dictionaryWithObject:dict[@"levelId"] forKey:dict[@"levelName"]];
                [dataArry addObject:d];
            }
            model2.itemArray = [dataArry copy];
            [self.dataArray addObjectsFromArray:self.defaultArray];
            [self.dataArray insertObject:model2 atIndex:2];
            [self.contentView reloadData];
        }
        
        
        
    } failure:^(NSError *error) {
        
    }];
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidden)];
//        [self addGestureRecognizer:ges];
        
        [self getUserLevel];
        
        [self addSubview:self.container];
        self.container.userInteractionEnabled = YES;
        [self.container addSubview:self.leftBtn];
        [self.container addSubview:self.rightBtn];
        
        self.contentView.frame = CGRectMake(0, 0, KScreenWidth * 0.5, KScreenHeight - 44);
        [self.container addSubview:self.contentView];
        
    }
    return self;
}

- (void)show{
    
    [UIView animateWithDuration:1.0f animations:^{
        self.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
        [self.contentView reloadData];
    }];
    
}

- (void)hidden{
    [UIView animateWithDuration:1.0f animations:^{
        self.frame = CGRectMake(KScreenWidth, 0, KScreenWidth, KScreenHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    LWLog(@"%lu",(unsigned long)self.dataArray.count);
    return self.dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    TeamSelectList * model2 = [self.dataArray objectAtIndex:section];
    return model2.itemArray.count;
}

//// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    PriceJudgeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PriceJudgeCollectionViewCell" forIndexPath:indexPath];
    TeamSelectList * model2 = [self.dataArray objectAtIndex:indexPath.section];
    NSDictionary * dict =  [model2.itemArray objectAtIndex:indexPath.row];
    NSArray * a =  [dict allKeys];
    
    LWLog(@"%@",a);
    cell.titleOption.text  = [a firstObject];
    if (model2.select == indexPath.row) {
        cell.layer.borderWidth = 1.0f;
        cell.layer.borderColor = [UIColor redColor].CGColor;
    }else{
        
        cell.layer.borderWidth = 1.0f;
        cell.layer.borderColor = LWColor(240, 241, 242).CGColor;
    }
    cell.layer.cornerRadius = 5;
    return cell;

}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(KScreenWidth, 44);
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    ReusableView *header = [collectionView  dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    header.backgroundColor = [UIColor whiteColor];
    TeamSelectList * model2 = [self.dataArray objectAtIndex:indexPath.section];
    header.label.text = model2.title;
//    if (model2.title.length) {
//        header.text = model2.title;
//    }
    return header;

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    PriceJudgeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PriceJudgeCollectionViewCell" forIndexPath:indexPath];
    TeamSelectList * model2 = [self.dataArray objectAtIndex:indexPath.section];
    model2.select = (int)indexPath.row;
    LWLog(@"%ld",(long)indexPath.row);
    [self.contentView reloadData];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
