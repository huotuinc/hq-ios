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


@property (nonatomic,assign) int type;

@end

@implementation YiJianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationItem.title = @"反馈与建议";
    self.type = 0;
    self.content.layer.borderWidth = 0.8f;
    self.content.layer.borderColor = LWColor(238, 238, 238).CGColor;
    self.content.delegate = self;
    
    self.phone.keyboardType = UIKeyboardTypePhonePad;
    [self setUpInit];
}

/**
 * 初始化设置
 */
- (void)setUpInit{
    
    
    
    
    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:@"若有其它需求了解,可以联系****联系" attributes:@{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
    self.sub.attributedText = str;
    
    
    self.btn.layer.cornerRadius = 5;
    self.btn.layer.masksToBounds = YES;
    
    KWeakSelf(self);
    self.fankui.userInteractionEnabled = YES;
    [self.fankui bk_whenTapped:^{
        if (!weakself.type) {
            return ;
        }else{
            weakself.jianyi.image = [UIImage imageNamed:@"gx_default"];
            weakself.fankui.image = [UIImage imageNamed:@"gx_select"];
            weakself.type = 0;
        }
    }];
    
    self.jianyi.userInteractionEnabled = YES;
    [self.jianyi bk_whenTapped:^{
        if (weakself.type) {
            return ;
        }else{
            weakself.jianyi.image = [UIImage imageNamed:@"gx_select"];
            weakself.fankui.image = [UIImage imageNamed:@"gx_default"];
            weakself.type = 1;
        }
    }];
    
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
    
    
    if (!self.content.text.length || [self.content.text isEqualToString:@"感谢您的使用及支持,您反馈的意见和问题将会帮助我们持续进步,谢谢。"]) {
        [MBProgressHUD showError:@"请填写的反馈与建议"];
        return;
    }
    
    if (![[HTTool HTToolShare] HTToolValidateMobile:self.phone.text]) {
        [MBProgressHUD showError:@"手机号不对"];
        return;
    }
    
    
    
    LWLog(@"sdsds");
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"SubmitType"] = @(self.type);
    dict[@"Memo"] = self.content.text;
    dict[@"UserMobile"] = self.phone.text;
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"User/FeedbackSuggestion" parame:dict isHud:YES isHaseCache:NO success:^(id json) {
        LWLog(@"%@",json);
        [MBProgressHUD showSuccess:@"提交成功"];
    } failure:^(NSError *error) {
        LWLog(@"%@",error.description);
    }];

}


@end
