//
//  ACBuilTableViewCell.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/21.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ACBuilTableViewCell.h"
@interface ACBuilTableViewCell ()


@property (nonatomic,strong) UILabel  * name;

@property (nonatomic,strong) UITextField * ac;
@end


@implementation ACBuilTableViewCell


- (UILabel *)name{
    if (_name == nil) {
        _name = [[UILabel alloc] init];
        _name.text = @"小米";
    }
    return _name;
}


- (UITextField *)ac{
    if (_ac == nil) {
        _ac= [[UITextField alloc] init];
        _ac.textAlignment = NSTextAlignmentRight;
    }
    return _ac;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpInit];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)setUpInit{
    
    [self.contentView addSubview:self.ac];
    [self.ac mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.width.mas_equalTo(KScreenWidth * 0.6);
        //make.left.mas_equalTo(self.name.mas_right);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
    }];
    
    
    [self.contentView addSubview:self.name];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(20);
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(self.ac.mas_left);
        make.bottom.mas_equalTo(-20);
    }];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self selector:@selector(onToIphone:) name:@"accountSwich" object:nil];
    

//    [[NSNotificationCenter defaultCenter] postNotificationName:@"accountSwich" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys: @(self.currentSelect) , @"accountType",nil]];
    
}

- (NSString * )getText{
    return self.ac.text;
}


- (void)configure:(AccountList *) model{
    
    if (self.indexPath.row) {
        self.ac.text = model.AccountInfo;
    }else{
        self.ac.text = model.RealName;
    }
    
    
}


- (void)onToIphone:(NSNotification *)note{
    
    LWLog(@"%@",note.userInfo);
    if (note.userInfo && self.indexPath.row == 1) {
        self.name.text =   [[note.userInfo objectForKey:@"accountType"] intValue] ? @"微信帐号" : @"支付宝帐号";
        if([[note.userInfo objectForKey:@"accountType"] intValue]){
            self.ac.placeholder = @"请填入微信帐号可选填";
        }else{
            self.ac.placeholder = @"请填入支付宝帐号";
        }
        
    }
}

- (void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
    
    if (indexPath.row == 0) {
        self.ac.placeholder = @"请填姓名";
    }else{
        self.ac.placeholder = @"请填入提现帐号";
    }
    indexPath.row == 0 ? (self.name.text = @"姓名"):(self.name.text = @"支付宝账号");
}
@end
