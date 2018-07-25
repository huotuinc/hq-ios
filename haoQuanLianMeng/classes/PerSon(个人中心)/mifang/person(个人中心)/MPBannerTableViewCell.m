//
//  MPBannerTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/28.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MPBannerTableViewCell.h"
#import <SDCycleScrollView.h>
#import "WKWebViewController.h"


@interface MPBannerTableViewCell()<SDCycleScrollViewDelegate>

@property (nonatomic,strong) SDCycleScrollView * banner;

@property (nonatomic,strong) MiFangUserCenterModel * model;
@end

@implementation MPBannerTableViewCell


- (SDCycleScrollView *)banner{
    if (_banner == nil) {
        _banner = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, 0, 0) delegate:self placeholderImage:nil];
        _banner.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        _banner.hidesForSinglePage = YES;
        _banner.autoScrollTimeInterval = 5;
    }
    return _banner;
}


- (void)configWithData:(MiFangUserCenterModel *)model{
    
    LWLog(@"%@",model);
    self.model = model;
   
    NSMutableArray * arr = [NSMutableArray array];
    for (NSDictionary * dict in model.ADLists) {
        [arr addObject:[dict objectForKey:@"ImgURL"]];
    }
    self.banner.imageURLStringsGroup = arr;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.banner];
        [self.banner mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left);
            make.right.mas_equalTo(self.contentView.mas_right);
            make.top.mas_equalTo(self.contentView.mas_top);
            make.height.mas_equalTo(KScreenWidth * 2.0 / 5);
            make.bottom.mas_equalTo(self.contentView.mas_bottom);
        }];
    }
    return self;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSDictionary * dict = [self.model.ADLists objectAtIndex:index];
    NSString * tt =  [dict objectForKey:@"LinkURL"];
    WKWebViewController * vc = [[WKWebViewController alloc] init];
    vc.funUrl = [tt copy];
    [self.viewContainingController.navigationController pushViewController:vc animated:YES];
    
}
@end
