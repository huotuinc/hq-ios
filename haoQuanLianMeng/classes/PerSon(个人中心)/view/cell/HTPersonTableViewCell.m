//
//  HTPersonTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTPersonTableViewCell.h"
#import "MessageContainViewController.h"
#import "HTStoryViewController.h"

@interface HTPersonTableViewCell ()


@property (nonatomic, strong) UIImageView * headIconView;


@property (nonatomic, strong) UILabel * headNameLable;


@end


@implementation HTPersonTableViewCell


- (UIImageView *)headIconView {
    if (_headIconView == nil){
       _headIconView = [[UIImageView alloc] init];
    }
    return _headIconView;
}


- (UILabel *)headNameLable {
    if(_headNameLable == nil){
        _headNameLable = [[UILabel alloc] init];
        _headNameLable.textColor = LWColor(100, 100, 100);
        _headNameLable.font = kAdaptedFontSize(13);
    }
    return _headNameLable;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){

        [self setUpInit];
    }
    return self;
}

- (void)setUpInit {

    [self.contentView addSubview:self.headIconView];
    [self.headIconView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(kAdaptedWidth(18));
        make.height.width.mas_equalTo(20);
//        make.centerY.mas_equalTo(self.contentView.centerY);
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(30);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-kAdaptedWidth(18));
    }];

    [self.contentView addSubview:self.headNameLable];
    [self.headNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.headIconView.centerY);
        make.left.mas_equalTo(self.headIconView.mas_right).mas_offset(8);
    }];

    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.separatorInset = UIEdgeInsetsMake(0, 28, 0, 0);
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}


- (void)setHTPersonName:(NSString *)name andIconName:(NSString * )iconName{
    self.headIconView.image = [UIImage imageNamed:iconName];
    self.headNameLable.text = name;
}


- (void)cellClickAT:(NSIndexPath *) index andVC:(UIViewController *)vc{
    
    LWLog(@"%ld",(long)index.row);
    if(index.row == 1){
        HTStoryViewController * vcc = [[HTStoryViewController alloc] init];
        [vc.navigationController pushViewController:vcc animated:YES];
    }else if (index.row == 2) {
        MessageContainViewController * vcc = [[MessageContainViewController alloc] init];
        [vc.navigationController pushViewController:vcc animated:YES];
    }
}

@end
