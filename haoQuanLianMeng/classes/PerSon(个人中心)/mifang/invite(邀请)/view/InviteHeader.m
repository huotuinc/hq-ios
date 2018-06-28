//
//  InviteHeader.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "InviteHeader.h"
#import "InviteCollectionViewCell.h"
#import "MyFlow.h"
@interface InviteHeader ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView * collection;

@end


@implementation InviteHeader

- (UICollectionView *)collection{
    
    if (_collection == nil) {
        
        MyFlow * flow = [[MyFlow alloc] init];
        _collection = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flow];
        _collection.delegate = self;
        _collection.dataSource = self;
       
        _collection.backgroundColor = [UIColor whiteColor];
//        flow.minimumLineSpacing = 30;
//        flow.minimumInteritemSpacing = 20;
        
//        flow.itemSize = CGSizeMake(self.frame.size.width - 50, self.frame.size.height-20);
//        _collection.pagingEnabled = YES;
//        _collection.contentInset = UIEdgeInsetsMake(0, 30, 0, 30);
        [_collection registerClass:[InviteCollectionViewCell class] forCellWithReuseIdentifier:@"InviteCollectionViewCell"];
        
    }
    
    return _collection;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpInit];
    }
    return self;
}

- (void)setUpInit{
    
    [self addSubview:self.collection];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 5;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InviteCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 将collectionView在控制器view的中心点转化成collectionView上的坐标
    CGPoint pInView = [self convertPoint:self.collection.center toView:self.collection];
    // 获取这一点的indexPath
    NSIndexPath *indexPathNow = [self.collection indexPathForItemAtPoint:pInView];
    // 赋值给记录当前坐标的变量
    //self.currentIndexPath = indexPathNow;
    // 更新底部的数据
    // ...
}


@end
