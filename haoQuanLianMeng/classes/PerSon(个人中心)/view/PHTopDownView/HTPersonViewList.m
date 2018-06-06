//
//  HTPersonViewList.m
//  HotTechLoan
//
//  Created by 罗海波 on 2017/12/6.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HTPersonViewList.h"


@interface HTPersonViewList()


@property(nonatomic,strong) UIImageView * iconView;

@property(nonatomic,strong) UILabel * titleLable;


@property(nonatomic,strong) UILabel * redCountLable;


@end



@implementation HTPersonViewList


- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        //_iconView.image = [UIImage imageNamed:@"dfk"];
        _iconView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconView;
}

- (UILabel *)titleLable{
    if (_titleLable == nil) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.textColor = [UIColor blackColor];
        _titleLable.font = kAdaptedFontSize(12);
        _titleLable.textColor = LWColor(75, 75, 75);
    }
    return _titleLable;
}

- (UILabel *)redCountLable{
    if (_redCountLable == nil) {
        _redCountLable = [[UILabel alloc] init];
        _redCountLable.textColor = [UIColor whiteColor];
        _redCountLable.backgroundColor = [UIColor redColor];
        _redCountLable.layer.cornerRadius = 8;
        _redCountLable.textAlignment = NSTextAlignmentCenter;
        _redCountLable.layer.masksToBounds = YES;
        _redCountLable.font = kAdaptedFontSize(12);
    }
    return _redCountLable;
}


//- (instancetype)init{
//    if (self = [super init]) {
//
//    }
//    return self;
//}
- (instancetype)init{
    
    if (self = [super init]) {
       
//        self.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.iconView];
        //self.iconView.ima
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).mas_offset(25);
            make.height.width.mas_equalTo(28);
            make.centerX.mas_equalTo(self.mas_centerX);
        }];
        
        [self addSubview:self.titleLable];
        self.titleLable.text = @"xxxxx";
        [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.iconView.mas_bottom).mas_offset(kAdaptedHeight(7));
            make.centerX.mas_equalTo(self.mas_centerX);
        }];
        
//        [self addSubview:self.redCountLable];
//        [self.redCountLable mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.iconView.mas_top).mas_offset(-3);
//            make.left.mas_equalTo(self.iconView.mas_right).mas_offset(-12);
//            make.width.height.mas_equalTo(16);
//        }];
        
    }
    
    return self;
}



- (void)setUnReadMess:(int)unReadMess{
    _unReadMess = unReadMess;
    if (unReadMess == 0) {
        self.redCountLable.hidden = YES;
    }else{
        self.redCountLable.hidden = NO;
        self.redCountLable.text = (unReadMess <= 9 ? [NSString stringWithFormat:@"%d",unReadMess] : [NSString stringWithFormat:@"%d+",unReadMess]);
    }
}


- (void)setName:(NSString *)name andIcon:(NSString *)icon{
    [self.iconView setImage:[UIImage imageNamed:icon]];
    self.titleLable.text = name;
}
@end
