//
//  JudgeView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "JudgeView.h"
#import "PriceJudgeCollectionViewCell.h"


@interface JudgeView ()<UICollectionViewDelegate
,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView * contentView;

@end


@implementation JudgeView


- (UICollectionView *)contentView{
    if (_contentView == nil) {
        
        UICollectionViewFlowLayout * lay = [[UICollectionViewFlowLayout alloc] init];
        lay.scrollDirection = UICollectionViewScrollDirectionVertical;
        //lay.itemSize = CGSizeMake(KScreenWidth - 80 , 500 );
        //        lay.estimatedItemSize = CGSizeMake(KScreenWidth-40, 200);
        //        lay.minimumLineSpacing = 10;
        //        lay.minimumInteritemSpacing = 10;
        _contentView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:lay];
        //        _goodView.collectionViewLayout = lay;
        _contentView.delegate = self;
        _contentView.dataSource = self;
        
        _contentView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0);
        //        _judgeView.pagingEnabled = YES;
        _contentView.backgroundColor = [UIColor whiteColor];
        [_contentView registerClass:[PriceJudgeCollectionViewCell class] forCellWithReuseIdentifier:@"PriceJudgeCollectionViewCell"];
        [_contentView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    }
    return _contentView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
