//
//  SegmentControl.m
//  GT
//
//  Created by tage on 14-2-26.
//  Copyright (c) 2014年 cn.kaakoo. All rights reserved.
//

#import "XTSegmentControl.h"

#define iOS6 (([[[UIDevice currentDevice] systemVersion] floatValue]< 7 ) ? YES : NO )
#define iOS8 (([[[UIDevice currentDevice] systemVersion] floatValue]>= 8 ) ? YES : NO )

#define XTSegmentControlItemFont (15)

#define XTSegmentControlHspace (15)

#define XTSegmentControlLineHeight (3.5)
#define XTSegmentControlVspaceBottom (0)

#define XTSegmentControlAnimationTime (0.3)
#define kAnimationTime 0.2

@interface XTSegmentControlItem : UIView

@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic, assign) BOOL isSelected;


@property (nonatomic, strong) UIColor * selectColor;
@property (nonatomic, strong) UIColor * defaultColor;

@end

@implementation XTSegmentControlItem

- (id)initWithFrame:(CGRect)frame title:(NSString *)title
{
    if (self = [super initWithFrame:frame]) {
        _titleLabel = ({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(XTSegmentControlHspace, 0, CGRectGetWidth(self.bounds) - 2 * XTSegmentControlHspace, CGRectGetHeight(self.bounds))];
            label.font = [UIFont systemFontOfSize:XTSegmentControlItemFont];
            label.text = title;
            label.minimumScaleFactor = 0.1;
            label.textAlignment = NSTextAlignmentCenter;
            label.backgroundColor = [UIColor clearColor];
            label;
        });
        [self addSubview:_titleLabel];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)setDefaultColor:(UIColor *)defaultColor{
    _defaultColor = defaultColor;
    self.titleLabel.textColor = self.defaultColor;
}



-(void)setIsSelected:(BOOL)isSelected
{
//    _isSelected = isSelected;
    if (isSelected) {
        self.titleLabel.textColor = self.selectColor;
    }else
        self.titleLabel.textColor = self.defaultColor;
}
@end

@interface XTSegmentControl ()<UIScrollViewDelegate>

@property (nonatomic , strong) UIScrollView *contentView;

@property (nonatomic , strong) UIImageView *leftShadowView;

@property (nonatomic , strong) UIImageView *rightShadowView;

@property (nonatomic , strong) UIView *lineView;

@property (nonatomic , strong) NSMutableArray *itemFrames;

@property (nonatomic , strong) NSMutableArray *items;
@property (nonatomic, strong)NSMutableArray *itemsArray;

@property (nonatomic) NSInteger currentIndex;

@property (nonatomic , assign) id <XTSegmentControlDelegate> delegate;

@property (nonatomic , copy) XTSegmentControlBlock block;



//显示右侧
@property (nonatomic , assign) bool showRight;

@end

@implementation XTSegmentControl



- (void)setDefaultColor:(UIColor *)defaultColor {
    _defaultColor = defaultColor;
}


- (void)setSelectColor:(UIColor *)selectColor {
    _selectColor = selectColor;
}



- (id)initWithFrame:(CGRect)frame Items:(NSArray *)titleItem andSelectColor:(UIColor *)selectColor andDefaultColor:(UIColor *)defaultColor isShowRight:(BOOL)showRight;
{
    if (self = [super initWithFrame:frame]) {
        
        
        self.selectColor = selectColor;
        self.defaultColor = defaultColor;
        _itemsArray = [NSMutableArray new];
        _contentView = ({
            
            CGRect frame = self.bounds;
//            if (showRight) {
//                frame.size.width -= 30;
//            }
            UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
            scrollView.backgroundColor = [UIColor whiteColor];
            scrollView.delegate = self;
            scrollView.showsHorizontalScrollIndicator = NO;
            [self addSubview:scrollView];
            
            UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doTap:)];
            [scrollView addGestureRecognizer:tapGes];
            [tapGes requireGestureRecognizerToFail:scrollView.panGestureRecognizer];
            scrollView;
        });
        [self initItemsWithTitleArray:titleItem];
        //        _leftShadowView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 38, CGRectGetHeight(self.bounds)-2)];
        //        _leftShadowView.image = loadImage(@"bar_left");
        //        _leftShadowView.userInteractionEnabled = YES;
        //        UITapGestureRecognizer *loadPreViewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(loadPreView)];
        //        [_leftShadowView addGestureRecognizer:loadPreViewTap];
        //        //_leftShadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        //        [self addSubview:_leftShadowView];
        
        if (showRight) {
            _rightShadowView = [[UIImageView alloc] initWithFrame:CGRectMake(KScreenWidth - 30, (frame.size.height - 30 ) * 0.5, 30, 30)];
            _rightShadowView.image = [UIImage imageNamed:@"homeRight"];
            _rightShadowView.backgroundColor = [UIColor whiteColor];
            //        _rightShadowView.backgroundColor = [UIColor blackColor];
            //_rightShadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
            _rightShadowView.userInteractionEnabled = YES;
            UITapGestureRecognizer *loadNextViewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(loadNextView)];
            [_rightShadowView addGestureRecognizer:loadNextViewTap];
            [self addSubview:_rightShadowView];
        }
        
        
        
        //        UIImageView *bottomView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)-2, CGRectGetWidth(self.frame), 2)];
        //        bottomView.image = loadImage(@"shadow");
        //        if (titleItem.count > 5) {
        //            [UIView animateWithDuration:kAnimationTime animations:^{
        //                _leftShadowView.alpha = 0.0f;
        //                _rightShadowView.alpha = 1.0f;
        ////                _leftShadowView.hidden = YES;
        ////                _rightShadowView.hidden = NO;
        //            }];
        //        }else
        //        {
        //            [UIView animateWithDuration:kAnimationTime animations:^{
        //                _leftShadowView.alpha = 0.0f;
        //                _rightShadowView.alpha = 0.0f;
        ////                _leftShadowView.hidden = YES;
        ////                _rightShadowView.hidden = YES;
        //            }];
        //        }
        //        [self addSubview:bottomView];
    }
    //    [self ModelTypeChanged];
    //    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ModelTypeChanged) name:kModelChanged object:nil];
    return self;
}



- (id)initWithFrame:(CGRect)frame Items:(NSArray *)titleItem
{
    if (self = [super initWithFrame:frame]) {
        _itemsArray = [NSMutableArray new];
        _contentView = ({
            UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
            scrollView.backgroundColor = [UIColor whiteColor];
            scrollView.delegate = self;
            scrollView.showsHorizontalScrollIndicator = NO;
            [self addSubview:scrollView];
            
            UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doTap:)];
            [scrollView addGestureRecognizer:tapGes];
            [tapGes requireGestureRecognizerToFail:scrollView.panGestureRecognizer];
            scrollView;
        });
        [self initItemsWithTitleArray:titleItem];
//        _leftShadowView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 38, CGRectGetHeight(self.bounds)-2)];
//        _leftShadowView.image = loadImage(@"bar_left");
//        _leftShadowView.userInteractionEnabled = YES;
//        UITapGestureRecognizer *loadPreViewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(loadPreView)];
//        [_leftShadowView addGestureRecognizer:loadPreViewTap];
//        //_leftShadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
//        [self addSubview:_leftShadowView];
        
        _rightShadowView = [[UIImageView alloc] initWithFrame:CGRectMake(KScreenWidth - 38, 0, 38, CGRectGetHeight(self.bounds)-2)];
//        _rightShadowView.image = loadImage(@"bar_right");
        _rightShadowView.backgroundColor = [UIColor blackColor];
        //_rightShadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _rightShadowView.userInteractionEnabled = YES;
        UITapGestureRecognizer *loadNextViewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(loadNextView)];
        [_rightShadowView addGestureRecognizer:loadNextViewTap];
        [self addSubview:_rightShadowView];
        
        
//        UIImageView *bottomView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)-2, CGRectGetWidth(self.frame), 2)];
//        bottomView.image = loadImage(@"shadow");
//        if (titleItem.count > 5) {
//            [UIView animateWithDuration:kAnimationTime animations:^{
//                _leftShadowView.alpha = 0.0f;
//                _rightShadowView.alpha = 1.0f;
////                _leftShadowView.hidden = YES;
////                _rightShadowView.hidden = NO;
//            }];
//        }else
//        {
//            [UIView animateWithDuration:kAnimationTime animations:^{
//                _leftShadowView.alpha = 0.0f;
//                _rightShadowView.alpha = 0.0f;
////                _leftShadowView.hidden = YES;
////                _rightShadowView.hidden = YES;
//            }];
//        }
//        [self addSubview:bottomView];
    }
//    [self ModelTypeChanged];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ModelTypeChanged) name:kModelChanged object:nil];
    return self;
}
//-(void)loadPreView
//{
//    if (self.currentIndex > 0) {
//        //        [self endMoveIndex:self.currentIndex - 1];
//        [self selectIndex:self.currentIndex - 1];
//        [self transformAction:self.currentIndex];
//    }
//    
//}
//-(void)loadNextView
//{
//    if (self.currentIndex < 9) {
//        [self selectIndex:self.currentIndex + 1];
//        //        [self endMoveIndex:self.currentIndex + 1];
//        [self transformAction:self.currentIndex];
//    }
//}
//-(void)ModelTypeChanged
//{
//    if ([[ThemeManager sharedInstance]currentModelType] == ModelTypeNormal) {
//        _leftShadowView.image = loadImage(@"bar_left");
//        _rightShadowView.image = loadImage(@"bar_right");
//        for (UIView *view in _contentView.subviews) {
//            if ([view isKindOfClass:[XTSegmentControlItem class]]) {
//                XTSegmentControlItem *item = (XTSegmentControlItem*)view;
//                item.titleLabel.textColor = [UIColor blackColor];
//            }
//        }
//    }else
//    {
//        _leftShadowView.image = loadImage(@"bar_n_left");
//        _rightShadowView.image = loadImage(@"bar_n_right");
//        for (UIView *view in _contentView.subviews) {
//            if ([view isKindOfClass:[XTSegmentControlItem class]]) {
//                XTSegmentControlItem *item = (XTSegmentControlItem*)view;
//                item.titleLabel.textColor = [UIColor whiteColor];
//            }
//        }
//    }
//}
- (instancetype)initWithFrame:(CGRect)frame Items:(NSArray *)titleItem delegate:(id<XTSegmentControlDelegate>)delegate
{
    if (self = [self initWithFrame:frame Items:titleItem]) {
        self.delegate = delegate;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame Items:(NSArray *)titleItem andSelectColor:(UIColor *)selectColor andDefault:(UIColor *)defaultColor selectedBlock:(XTSegmentControlBlock)selectedHandle isShowRight:(BOOL)show{
    if (self = [self initWithFrame:frame Items:titleItem andSelectColor:selectColor andDefaultColor:defaultColor isShowRight:show]) {
        self.block = selectedHandle;
        self.showRight = show;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame Items:(NSArray *)titleItem andSelectColor:(UIColor *)selectColor andDefault:(UIColor *)defaultColor selectedBlock:(XTSegmentControlBlock)selectedHandle
{
    if (self = [self initWithFrame:frame Items:titleItem andSelectColor:selectColor andDefaultColor:defaultColor isShowRight:NO]) {
        self.block = selectedHandle;
        
    }
    return self;
}

- (void)doTap:(UITapGestureRecognizer *)sender
{
    CGPoint point = [sender locationInView:sender.view];
    
    __weak typeof(self) weakSelf = self;
    
    [_itemFrames enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        CGRect rect = [obj CGRectValue];
        
        if (CGRectContainsPoint(rect, point)) {
            
            [weakSelf selectIndex:idx];
            
            [weakSelf transformAction:idx];
            
            *stop = YES;
        }
    }];
}

- (void)transformAction:(NSInteger)index
{
    if (self.delegate && [self.delegate conformsToProtocol:@protocol(XTSegmentControlDelegate)] && [self.delegate respondsToSelector:@selector(segmentControl:selectedIndex:)]) {
        
        [self.delegate segmentControl:self selectedIndex:index];
        
    }else if (self.block) {
        
        self.block(index);
    }
}





- (void)initItemsWithTitleArray:(NSArray *)titleArray
{
    _itemFrames = @[].mutableCopy;
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:XTSegmentControlItemFont]};
    CGFloat titleTotalWidth = 0;
    for (int i = 0; i < titleArray.count; i++) {
        NSString *title = titleArray[i];
        CGSize size = iOS6 ? [title sizeWithFont:[UIFont systemFontOfSize:XTSegmentControlItemFont]] : [title sizeWithAttributes:attributes];
        float x = i > 0 ? CGRectGetMaxX([_itemFrames[i-1] CGRectValue]) : 0;
        float y = 0;
        float titleWidth = size.width;
//        if (titleWidth < 55) {
//            titleWidth = 55;
//        }
        float width = 2 * XTSegmentControlHspace + titleWidth;
//        if (titleArray.count <= 4) {
//            width = (float)320 / titleArray.count;
//        }
        titleTotalWidth += width;
        float height = CGRectGetHeight(self.bounds)-1;
        CGRect rect = CGRectMake(x, y, width, height);
        [_itemFrames addObject:[NSValue valueWithCGRect:rect]];
    }
    if (CGRectGetMaxX([[_itemFrames lastObject] CGRectValue]) < CGRectGetWidth(_contentView.frame)) {
        CGFloat newSpace = (CGRectGetWidth(_contentView.frame) - titleTotalWidth)/_itemFrames.count/2.0;
        //DLog(@"newSpace ====%f titleTotalWidth ===%f",newSpace,titleTotalWidth);
        for (int i = 0;i < _itemFrames.count;i++) {
            CGRect rect = [_itemFrames[i] CGRectValue];
            if (i == 0) {
                rect.origin.x = newSpace;
            }else
            {
                CGRect preRect = [_itemFrames[i-1]CGRectValue];
                rect.origin.x = CGRectGetMaxX(preRect) + 2 * newSpace;
            }
            //DLog(@"rect ===%@",NSStringFromCGRect(rect));
            [_itemFrames replaceObjectAtIndex:i withObject:[NSValue valueWithCGRect:rect]];
        }
    }
    
    for (int i = 0; i < titleArray.count; i++) {
        CGRect rect = [_itemFrames[i] CGRectValue];
        NSString *title = titleArray[i];
        XTSegmentControlItem *item = [[XTSegmentControlItem alloc] initWithFrame:rect title:title];
        item.selectColor = self.selectColor;
        item.defaultColor = self.defaultColor;
        [self.itemsArray addObject:item];
        if (i == 0) {
            item.isSelected = YES;
        }
        [_contentView addSubview:item];
    }
    CGFloat width = CGRectGetMaxX([[_itemFrames lastObject] CGRectValue]);
    if (width < CGRectGetWidth(_contentView.frame)) {
        width = CGRectGetWidth(_contentView.frame);
    }
    [_contentView setContentSize:CGSizeMake(width, CGRectGetHeight(self.bounds))];
    self.currentIndex = 0;
    [self selectIndex:0];
    
//    [self resetShadowView:_contentView];
}

- (void)addRedLine
{
    if (!_lineView) {
        CGRect rect = [_itemFrames[0] CGRectValue];
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(XTSegmentControlHspace, CGRectGetHeight(rect) - XTSegmentControlLineHeight - XTSegmentControlVspaceBottom, CGRectGetWidth(rect) - 2 * XTSegmentControlHspace, XTSegmentControlLineHeight)];
        //ALog(@"list frame ===%@  self frame ===%@",NSStringFromCGRect(_lineView.frame),NSStringFromCGRect(self.frame));
        _lineView.backgroundColor = self.selectColor;
        [_contentView addSubview:_lineView];
    }
}

- (void)selectIndex:(NSInteger)index
{
    [self addRedLine];
    
    //if (index != _currentIndex) {
        
        CGRect rect = [_itemFrames[index] CGRectValue];
        CGRect lineRect = CGRectMake(CGRectGetMinX(rect) + XTSegmentControlHspace, CGRectGetHeight(rect) - XTSegmentControlLineHeight - XTSegmentControlVspaceBottom, CGRectGetWidth(rect) - 2 * XTSegmentControlHspace, XTSegmentControlLineHeight);
        [UIView animateWithDuration:XTSegmentControlAnimationTime animations:^{
            _lineView.frame = lineRect;
        }];
        XTSegmentControlItem *item = self.itemsArray[_currentIndex];
        item.isSelected = NO;
//        [item setItemColor:self.selectColor andDefault:self.defaultColor];
        XTSegmentControlItem *newItem = self.itemsArray[index];
        newItem.isSelected = YES;
//        [newItem setItemColor:self.selectColor andDefault:self.defaultColor];
        _currentIndex = index;
        
        
        
   // }
    [self setScrollOffset:index];
}

- (void)moveIndexWithProgress:(float)progress
{
    float delta = progress - _currentIndex;
    
    CGRect origionRect = [_itemFrames[_currentIndex] CGRectValue];;
    
    CGRect origionLineRect = CGRectMake(CGRectGetMinX(origionRect) + XTSegmentControlHspace, CGRectGetHeight(origionRect) - XTSegmentControlLineHeight, CGRectGetWidth(origionRect) - 2 * XTSegmentControlHspace, XTSegmentControlLineHeight);
    
    CGRect rect;
    
    if (delta > 0) {
        
        if (_currentIndex == _itemFrames.count - 1) {
            return;
        }
        
        rect = [_itemFrames[_currentIndex + 1] CGRectValue];
        
        CGRect lineRect = CGRectMake(CGRectGetMinX(rect) + XTSegmentControlHspace, CGRectGetHeight(rect) - XTSegmentControlLineHeight - XTSegmentControlVspaceBottom, CGRectGetWidth(rect) - 2 * XTSegmentControlHspace, XTSegmentControlLineHeight);
        
        CGRect moveRect = CGRectZero;
        
        moveRect.size = CGSizeMake(CGRectGetWidth(origionLineRect) + delta * (CGRectGetWidth(lineRect) - CGRectGetWidth(origionLineRect)), CGRectGetHeight(lineRect));
        
        _lineView.frame = moveRect;
        
        _lineView.center = CGPointMake(CGRectGetMidX(origionLineRect) + delta * (CGRectGetMidX(lineRect) - CGRectGetMidX(origionLineRect)), CGRectGetMidY(origionLineRect)- XTSegmentControlVspaceBottom);
        
        if (delta > 1) {
            
            _currentIndex ++;
        }
        
    }else if (delta < 0){
        
        if (_currentIndex == 0) {
            return;
        }
        
        rect = [_itemFrames[_currentIndex - 1] CGRectValue];
        
        CGRect lineRect = CGRectMake(CGRectGetMinX(rect) + XTSegmentControlHspace, CGRectGetHeight(rect) - XTSegmentControlLineHeight - XTSegmentControlVspaceBottom, CGRectGetWidth(rect) - 2 * XTSegmentControlHspace, XTSegmentControlLineHeight);
        
        CGRect moveRect = CGRectZero;
        
        moveRect.size = CGSizeMake(CGRectGetWidth(origionLineRect) - delta * (CGRectGetWidth(lineRect) - CGRectGetWidth(origionLineRect)), CGRectGetHeight(lineRect));
        
        _lineView.frame = moveRect;
        
        _lineView.center = CGPointMake(CGRectGetMidX(origionLineRect) - delta * (CGRectGetMidX(lineRect) - CGRectGetMidX(origionLineRect)), CGRectGetMidY(origionLineRect) - XTSegmentControlVspaceBottom);
        
        if (delta < -1) {
            
            _currentIndex --;
        }
    }
}

- (void)endMoveIndex:(NSInteger)index
{
    [self selectIndex:index];
}

- (void)setScrollOffset:(NSInteger)index
{
    CGRect rect = [_itemFrames[index] CGRectValue];
    
    float midX = CGRectGetMidX(rect);
    
    float offset = 0;
    
    float contentWidth = _contentView.contentSize.width;
    
    float halfWidth = CGRectGetWidth(self.bounds) / 2.0;
    
    if (midX < halfWidth) {
        offset = 0;
    }else if (midX > contentWidth - halfWidth){
        offset = contentWidth - 2 * halfWidth;
    }else{
        offset = midX - halfWidth;
    }
    //ALog(@"offset ===%f contentWidth ===%f",offset,contentWidth);
    [UIView animateWithDuration:XTSegmentControlAnimationTime animations:^{
        [_contentView setContentOffset:CGPointMake(offset, 0) animated:NO];
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    [self resetShadowView:scrollView];
}

//- (void)resetShadowView:(UIScrollView *)scrollView
//{
//    if (scrollView.contentOffset.x > 0) {
//        [UIView animateWithDuration:kAnimationTime animations:^{
//            _leftShadowView.alpha = 1.0f;
//        }];
//       // _leftShadowView.hidden = NO;
//        
//        if (scrollView.contentOffset.x == scrollView.contentSize.width - CGRectGetWidth(scrollView.bounds)) {
//            [UIView animateWithDuration:kAnimationTime animations:^{
//                _rightShadowView.alpha = 0.0f;
//            }];
////            _rightShadowView.hidden = YES;
//        }else{
//            [UIView animateWithDuration:kAnimationTime animations:^{
//                _rightShadowView.alpha = 1.0f;
//            }];
////            _rightShadowView.hidden = NO;
//        }
//        
//    }else if (scrollView.contentOffset.x == 0) {
//        [UIView animateWithDuration:kAnimationTime animations:^{
//            _leftShadowView.alpha = 0.0f;
//        }];
////        _leftShadowView.hidden = YES;
//        if (_contentView.contentSize.width < CGRectGetWidth(_contentView.frame)) {
//            [UIView animateWithDuration:kAnimationTime animations:^{
//                _rightShadowView.alpha = 0.0f;
//            }];
////            _rightShadowView.hidden = YES;
//        }else{
//            [UIView animateWithDuration:kAnimationTime animations:^{
//                _rightShadowView.alpha = 1.0f;
//            }];
////            _rightShadowView.hidden = NO;
//        }
//    }
//}


int ExceMinIndex(float f)
{
    int i = (int)f;
    if (f != i) {
        return i+1;
    }
    return i;
}

@end

