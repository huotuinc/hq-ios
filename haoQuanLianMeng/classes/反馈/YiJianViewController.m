//
//  YiJianViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/19.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "YiJianViewController.h"

@interface YiJianViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *fankui;
@property (weak, nonatomic) IBOutlet UIImageView *jianyi;
@property (weak, nonatomic) IBOutlet UITextView *content;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (weak, nonatomic) IBOutlet UILabel *sub;

@end

@implementation YiJianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.content.layer.borderWidth = 0.8f;
    self.content.layer.borderColor = LWColor(238, 238, 238).CGColor;
    self.content.delegate = self;
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    textView.text = nil;
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnClick:(id)sender {
}


@end
