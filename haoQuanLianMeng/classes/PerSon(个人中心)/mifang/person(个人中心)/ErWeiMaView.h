//
//  ErWeiMaView.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/29.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ErWeiMaViewDelegate <NSObject>


- (void)shareBtnClick:(UIImage * )im;


@end


@interface ErWeiMaView : UIView



@property (nonatomic,copy) NSString  * url;


@property (nonatomic,weak) id  <ErWeiMaViewDelegate> delegate;

- (void)dis;
@end
