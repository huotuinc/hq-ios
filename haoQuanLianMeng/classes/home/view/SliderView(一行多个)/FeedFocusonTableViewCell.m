//
//  FeedFocusonTableViewCell.m
//  HighCopyTodayNews
//
//  Created by hack on 2017/8/4.
//  Copyright © 2017年 hack. All rights reserved.
//

#import "FeedFocusonTableViewCell.h"
#import "FocusonViewCollectionViewCell.h"
//#import "TTHomeRequest.h"
//#import "NSString+YHAdd.h"
//#import <YYModel/YYModel.h>

@interface FeedFocusonTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource,FocusonViewCollectionViewCellDelegate>
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) UIView *recommendView;
@property(nonatomic,strong) NSMutableArray <FocusonModel*>*dataArrs;
@property(atomic,assign) NSInteger loadIndex;
@end

static NSString *const cellIdentf=@"showCellTop";
static NSString *const headeridentify=@"headeridentify";
@implementation FeedFocusonTableViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    
    NSLog(@"%@",NSStringFromCGRect(frame));
    if (self = [super initWithFrame:frame]) {
//        _dataArrs=[NSMutableArray new];
//        [self addSubview:self.collectionView];
//        self.collectionView.frame = CGRectMake(0, 0, KScreenWidth, frame.size.height);
//        self.collectionView.backgroundColor = [UIColor blackColor];
        
    }
    return self;
}


- (instancetype)init{
    if (self = [super init]) {
        _dataArrs=[NSMutableArray new];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left);
            make.right.mas_equalTo(self.contentView.mas_right);
            make.top.mas_equalTo(self.contentView.mas_top);
//            make.height.mas_equalTo(kAdaptedHeight(230));
            make.bottom.mas_equalTo(self.contentView.mas_bottom);
        }];
    }
    return self;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
         _dataArrs=[NSMutableArray new];
//         [self.contentView addSubview:self.recommendView];
        [self.contentView addSubview:self.collectionView];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left);
            make.right.mas_equalTo(self.contentView.mas_right);
            make.top.mas_equalTo(self.contentView.mas_top);
            make.height.mas_equalTo(kAdaptedHeight(230));
            make.bottom.mas_equalTo(self.contentView.mas_bottom);
        }];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setDataWithModel:(FocusonMainModel*)model{
//    _dataArrs=model.user_cards;
    [self.collectionView reloadData];
}




-(UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 35, KScreenWidth, 210) collectionViewLayout:flowLayout];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        _collectionView.backgroundColor=[UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator=NO;
        [_collectionView registerClass:[FocusonViewCollectionViewCell class] forCellWithReuseIdentifier:cellIdentf];
        _collectionView.backgroundColor = [UIColor blackColor];
    }
    return _collectionView;
}


#pragma mark - <UICollectionViewDelegate,UICollectionViewDataSource>




//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 14, 0, 14);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat itemWidth = kAdaptedWidth(145);
    CGFloat itemHeight = kAdaptedHeight(230);
    return CGSizeMake(itemWidth, itemHeight);
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    FocusonViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentf forIndexPath:indexPath];
    //cell.delegate=self;
//    FocusonModel* fmodel=_dataArrs[indexPath.row];
//    [cell setUserInfo: fmodel];
    
    return cell;
    
}

 


@end
