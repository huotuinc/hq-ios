//
//  AdViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "AdViewController.h"

@interface AdViewController ()


@property (nonatomic,strong) UIImageView  * adV;

@property (nonatomic,strong) UIImageView  * closeV;
@end

@implementation AdViewController


- (UIImageView *)adV{
    if (_adV == nil) {
        _adV = [[UIImageView alloc] initWithFrame:CGRectMake(KScreenWidth * 0.3 * 0.5, (KScreenHeight - KScreenWidth * 0.7 * 1.51) * 0.5, KScreenWidth * 0.7, KScreenWidth * 0.7 * 1.51)];
        _adV.backgroundColor = [UIColor redColor];
    }
    return _adV;
}


- (UIImageView *)closeV{
    if (_closeV == nil) {
        _closeV = [[UIImageView alloc] init];
        _closeV.image = [UIImage imageNamed:@"关闭"];
        _closeV.frame = CGRectMake(((KScreenWidth - kAdaptedWidth(34)) * 0.5), ((KScreenHeight - KScreenWidth * 0.7 * 1.51) * 0.5 + KScreenWidth * 0.7 * 1.51 + 10), kAdaptedWidth(36), kAdaptedWidth(36));
//        _closeV.userInteractionEnabled = YES;
        
        
    }
    return _closeV;
}



- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5];
        self.adV.frame = CGRectMake(KScreenWidth * 0.3 * 0.5, (KScreenHeight - KScreenWidth * 0.7 * 1.51) * 0.5, KScreenWidth * 0.7, KScreenWidth * 0.7 * 1.51);
        [self addSubview:self.adV];
        [self addSubview:self.closeV];
        
        self.userInteractionEnabled = YES;
        self.closeV.userInteractionEnabled = YES;
        KWeakSelf(self);
        [self.closeV bk_whenTapped:^{
            [weakself close];
        }];
        
        
        [self.adV bk_whenTapped:^{
            if ([weakself.delegate respondsToSelector:@selector(btnClick:)]) {
                [weakself.delegate btnClick:nil];
            }
            
        }];
    }
    return self;
}



//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//
//
//
////    [UIView animateWithDuration:0.7f delay:0.5f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
////
//////        self.view.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5];
////    } completion:^(BOOL finished) {
////        self.closeV.frame = CGRectMake((KScreenWidth - kAdaptedWidth(34)) * 0.5 , ((KScreenHeight - KScreenWidth * 0.7 * 1.51) * 0.5 + KScreenWidth * 0.7 * 1.51 + 10), kAdaptedWidth(34), kAdaptedWidth(34));
////    }];
////
//
//}

- (void)show{
    
   
        [UIView animateWithDuration:0.5f delay:0.5f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
        } completion:^(BOOL finished) {
            
        }];
    
}

- (void)close{
    [UIView animateWithDuration:0.5f delay:0.5f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.frame = CGRectMake(0, KScreenHeight, KScreenWidth, KScreenHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

//- (void)didReceiveMemoryWarning {
////    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
