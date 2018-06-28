//
//  MyFlow.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MyFlow.h"


static const CGFloat HMItemSize = 160;

@implementation MyFlow


- (instancetype)init{
    if (self = [super init]) {
        
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumLineSpacing = 20 ;
        
    }
    return self;
}

//只要显示的边界发生改变就重新布局 获得所有cell的布局属性
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}


/**
 * 准备布局 uicontoller 准备工作够完成了
 */
- (void)prepareLayout{
    
    self.itemSize = CGSizeMake(KScreenWidth - 60, HMItemSize);
    CGFloat inset = (self.collectionView.frame.size.width - KScreenWidth + 60) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    
    [super prepareLayout];
    
    //        UICollectionViewLayoutAttributes 布局属性 每个item都有UICollectionViewLayoutAttributes
    
   
    
    
   
    
    
    
}



//collection 内的item的尺寸
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    

    //计算可见据悉框
    CGRect visiablerect;

    visiablerect.size = CGSizeMake(self.collectionView.size.width, self.collectionView.size.height);


    visiablerect.origin = CGPointMake(self.collectionView.contentOffset.x, self.collectionView.contentOffset.y);

    //返回可见的
    NSArray * array = [super layoutAttributesForElementsInRect:rect];
    CGFloat centerx = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;

    //遍历所有布局属性
    for (UICollectionViewLayoutAttributes * attr in array) {
        LWLog(@"%f",attr.center.x);

        if(!CGRectIntersectsRect(visiablerect, attr.frame)){
            continue;
        }

        CGFloat itemCenterX = attr.center.x;

        CGFloat scale;
        if (ABS(centerx - itemCenterX) >= self.collectionView.frame.size.width * 0.5) {
            scale = 1;
        }else{
            scale =  1 + (1 - ABS(centerx - itemCenterX) / self.collectionView.frame.size.width * 0.5) * 0.01;
        }

        attr.transform3D = CATransform3DMakeScale(scale, scale, 1);
    }
    return array;
}

//用来设置手送开 停止滚动的时候 的位置
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    
    
//    CGFloat pointss =  [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    
    
    LWLog(@"%@",NSStringFromCGPoint(proposedContentOffset));
    //1. 获取UICollectionView停止的时候的可视范围
    CGRect lastReact;
    lastReact.size = self.collectionView.frame.size;
    lastReact.origin = proposedContentOffset;
    
    //这个可是范围你的item
    NSArray *array = [super  layoutAttributesForElementsInRect:lastReact];
    
    //2. 计算在可视范围的距离中心线最近的Item
    CGFloat minCenterX = CGFLOAT_MAX;
    
    //最中
    CGFloat collectionViewCenterX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    //UICollectionViewLayoutAttributes * outattrs;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        
        LWLog(@"---------%@",NSStringFromCGPoint(attrs.center));
        LWLog(@"xxxx");
        if(ABS(attrs.center.x - collectionViewCenterX) < ABS(minCenterX)){
            minCenterX = attrs.center.x - collectionViewCenterX;
            //outattrs = attrs;
        }
    }
    
    //3. 补回ContentOffset，则正好将Item居中显示
    proposedContentOffset.x += minCenterX;
    return proposedContentOffset;

   
}

@end
