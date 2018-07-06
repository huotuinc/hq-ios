//
//  PriceJudgeCollectionViewCell.m
//  phoneRecycle
//
//  Created by 罗海波 on 2018/5/9.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "PriceJudgeCollectionViewCell.h"

@interface PriceJudgeCollectionViewCell()




@end


@implementation PriceJudgeCollectionViewCell


- (UILabel *)titleOption{
    if (_titleOption == nil) {
        _titleOption = [[UILabel alloc] init];
        _titleOption.textColor = LWColor(118, 118, 119);
        _titleOption.font = kAdaptedFontSize(12);
    }
    return _titleOption;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       
        self.contentView.layer.borderWidth = 1.0f;
        self.contentView.layer.borderColor = LWColor(240, 241, 242).CGColor;
        
        
        self.contentView.backgroundColor = LWColor(240, 241, 242);
        [self.contentView addSubview:self.titleOption];
        [self.titleOption mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView.mas_centerX);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
        }];
    }
    return self;
}


//- (void)setModel:(PriceListModel *)model{
//    _model = model;
//    
//    self.titleOption.text = model.value;
//    
//    if (model.checked) {
//        self.contentView.layer.borderWidth = 1.0f;
//        self.contentView.layer.borderColor = LWColor(252, 163, 0).CGColor;
//        
//    }else{
//        self.contentView.layer.borderWidth = 0.0f;
//        self.contentView.layer.borderColor = LWColor(240, 241, 242).CGColor;
//    }
//    
//}


- (void)setSelected:(BOOL)selected{
    
    [super setSelected:selected];
    
    
    LWLog(@"-----setSelected--------%d",selected);
    
}
@end
