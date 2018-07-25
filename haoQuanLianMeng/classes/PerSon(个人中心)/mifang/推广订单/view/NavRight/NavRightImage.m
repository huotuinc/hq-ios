//
//  NavRightImage.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/24.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "NavRightImage.h"

@interface NavRightImage ()


@property (nonatomic,strong) UIImageView  * rightImage;

@property (nonatomic,strong) UILabel  * timeLable;

@property (nonatomic,strong) UIButton  * bkButton;
@end


@implementation NavRightImage

- (UIButton *)bkButton{
    if (_bkButton == nil) {
        _bkButton = [[UIButton alloc] init];
        [_bkButton addTarget:self action:@selector(btnccddd) forControlEvents:UIControlEventTouchUpInside];
//        _rightImage.image = [UIImage imageNamed:@"select_Down"];
    }
    return _bkButton;
}


- (void)btnccddd{
    [self.delegate btnRightClick];
}


- (UIImageView *)rightImage{
    if (_rightImage == nil) {
        _rightImage = [[UIImageView alloc] init];
        _rightImage.image = [UIImage imageNamed:@"select_Down"];
    }
    return _rightImage;
}

- (UILabel *)timeLable{
    if (_timeLable == nil) {
        _timeLable = [[UILabel alloc] init];
        _timeLable.font = kAdaptedFontSize(12);
    }
    return _timeLable;
}



- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
//
        self.bkButton.frame = frame;
        [self addSubview:self.bkButton];
        [self.bkButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(self);
        }];
        
        
        
        NSDate * date = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"YYYY年MM"];
        self.timeLable.text =  [formatter stringFromDate:date];
        
        [self addSubview:self.rightImage];
        [self.rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(15);
            make.right.mas_equalTo(self.mas_right).mas_offset(-1);
            make.centerY.mas_equalTo(self.mas_centerY).mas_offset(-3);
        }];
        
        [self addSubview:self.timeLable];
        [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.height.width.mas_equalTo(20);
            make.right.mas_equalTo(self.rightImage.mas_left).mas_offset(-2);
            make.centerY.mas_equalTo(self.mas_centerY).mas_offset(-2);
        }];
        
//        self.userInteractionEnabled = YES;
//        [self bk_whenTapped:^{
//            LWLog(@"cccccc");
//        }];

    }
    return self;
}

- (void)setTimeString:(NSString *)tt{
    _timeLable.text = tt;
}
@end
