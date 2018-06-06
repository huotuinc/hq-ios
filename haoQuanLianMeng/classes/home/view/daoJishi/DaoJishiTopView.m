//
//  DaoJishiTopView.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/4.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "DaoJishiTopView.h"

@interface DaoJishiTopView ()



@property  (nonatomic, strong) NSTimer * timer;


@property  (nonatomic, strong) UILabel * hour;
@property  (nonatomic, strong) UILabel * min;
@property  (nonatomic, strong) UILabel * second;

@property  (nonatomic, strong) UILabel * leftM;

@property  (nonatomic, strong) UILabel * rightM;


@property  (nonatomic, strong) UILabel * title;

@end




@implementation DaoJishiTopView

- (UILabel *)title {
    if (_title == nil){
        _title = [[UILabel alloc] init];
        _title.text = @"限时购";
    }
    return _title;
}


- (UILabel *)leftM {
    if (_leftM == nil){
        _leftM = [[UILabel alloc] init];
        _leftM.text = @":";
    }
    return _leftM;
}

- (UILabel *)rightM {
    if (_rightM == nil){
        _rightM = [[UILabel alloc] init];
        _rightM.text = @":";
    }
    return _rightM;
}


- (UILabel *)hour {
    if (_hour == nil){
        _hour = [[UILabel alloc] init];
        _hour.backgroundColor = LWColor(67, 67, 67);
        _hour.textColor = [UIColor whiteColor];
        _hour.textAlignment = NSTextAlignmentCenter;
    }
    return _hour;
}

- (UILabel *)min {
    if (_min == nil){
        _min = [[UILabel alloc] init];
        _min.backgroundColor = LWColor(67, 67, 67);
        _min.textColor = [UIColor whiteColor];
        _min.textAlignment = NSTextAlignmentCenter;
    }
    return _min;
}

- (UILabel *)second {
    if (_second == nil){
        _second = [[UILabel alloc] init];
        _second.backgroundColor = LWColor(67, 67, 67);
        _second.textColor = [UIColor whiteColor];
        _second.textAlignment = NSTextAlignmentCenter;
    }
    return _second;
}



- (NSTimer *)timer {
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}


- (void)timerAction{
    
    NSArray * time =  [self remainingTimeMethodAction:self.time];
    
  
    self.hour.text = time[0];
    self.min.text = time[1];
    self.second.text = time[2];
    
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setUPInit];
    }
    return self;
}



- (void)setUPInit {
    
    self.min.bounds = CGRectMake(0, 0, kAdaptedWidth(28), kAdaptedWidth(28));
    self.min.center = (CGPointMake(KScreenWidth * 0.5, self.frame.size.height * 0.5));
    [self addSubview:self.min];
    
    self.min.layer.cornerRadius = kAdaptedHeight(28) * 0.5;
    self.min.layer.masksToBounds = YES;
    
    
    [self addSubview:self.rightM];
    [self.rightM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.min.mas_centerY);
        make.left.mas_equalTo(self.min.mas_right);
    }];
    
    [self addSubview:self.second];
    [self.second mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(kAdaptedWidth(28));
        make.left.mas_equalTo(self.rightM.mas_right);
        make.centerY.mas_equalTo(self.min.mas_centerY);
    }];
    
    self.second.layer.cornerRadius = kAdaptedHeight(28) * 0.5;
    self.second.layer.masksToBounds = YES;
    
    [self addSubview:self.leftM];
    [self.leftM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.min.mas_centerY);
        make.right.mas_equalTo(self.min.mas_left);
    }];
    
    
    [self addSubview:self.hour];
    [self.hour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(kAdaptedWidth(28));
        make.right.mas_equalTo(self.leftM.mas_left);
        make.centerY.mas_equalTo(self.min.mas_centerY);
    }];
    self.hour.layer.cornerRadius = kAdaptedHeight(28) * 0.5;
    self.hour.layer.masksToBounds = YES;
    
    [self addSubview:self.title];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.min.mas_centerY);
        make.right.mas_equalTo(self.hour.mas_left).mas_offset(-4);
    }];
    
    
}


- (void)setTime:(NSString *)time {
    _time = [time copy];
    [self.timer fire];
}

- (NSArray *)remainingTimeMethodAction:(NSString *)sendTime
{
    //得到当前时间
    long long  endTime = [sendTime longLongValue] /1000;
    NSDate *nowData = [NSDate date];
    NSDate *endData=[NSDate dateWithTimeIntervalSince1970:endTime];
    NSCalendar* chineseClendar = [ [ NSCalendar alloc ] initWithCalendarIdentifier:NSCalendarIdentifierGregorian ];
    NSUInteger unitFlags =
        NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents *cps = [chineseClendar components:unitFlags fromDate:nowData toDate: endData options:0];
    NSInteger Hour = [cps hour];
    NSInteger Min = [cps minute];
    NSInteger Sec = [cps second];
    
    return @[[NSString stringWithFormat:@"%02ld",Hour],[NSString stringWithFormat:@"%02ld",Min],[NSString stringWithFormat:@"%02ld",Sec]];
}





@end
