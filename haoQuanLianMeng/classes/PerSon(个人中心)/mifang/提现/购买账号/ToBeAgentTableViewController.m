//
//  ToBeAgentTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/18.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ToBeAgentTableViewController.h"
#import "SelectLable.h"
#import "BuyAccountPayChanel.h"

@interface ToBeAgentTableViewController ()

@property (weak, nonatomic) IBOutlet UILabel *goodName;

@property (weak, nonatomic) IBOutlet UILabel *moneyLable;
@property (weak, nonatomic) IBOutlet SelectLable *firstLable;
@property (weak, nonatomic) IBOutlet SelectLable *secondLable;
@property (weak, nonatomic) IBOutlet SelectLable *thirdLable;
@property (weak, nonatomic) IBOutlet UILabel *shengshi;
@property (weak, nonatomic) IBOutlet UITextField *detailLable;
@property (weak, nonatomic) IBOutlet UITextField *nameLable;
@property (weak, nonatomic) IBOutlet UITextField *phoneLable;

@property (weak, nonatomic) IBOutlet UILabel *nextmoneyLable;

@property (weak, nonatomic) IBOutlet UIButton *tijiaoBtn;

@property (strong, nonatomic)  SelectLable *currentSlect;

@property (weak, nonatomic) IBOutlet UIImageView *goodImage;


//
@property (strong, nonatomic)  NSString * cityText;
@property (strong, nonatomic)  NSString * cityCodeText;
@property (strong, nonatomic)  NSArray * payList;
//tt
@property (strong, nonatomic)  NSArray * payTTLable;



@property (nonatomic,strong) NSString * price;
@property (nonatomic,assign) int NeedAddr;
@end

@implementation ToBeAgentTableViewController


- (NSArray *)payTTLable{
    if (_payTTLable == nil) {
        _payTTLable = @[self.firstLable,self.secondLable,self.thirdLable];
    }
    return _payTTLable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self getGood];
    [self getPayList];
    
    self.tijiaoBtn.layer.cornerRadius = 5;
    self.tijiaoBtn.layer.masksToBounds = YES;
    
    self.secondLable.hidden = YES;
    self.thirdLable.hidden = YES;
    
    self.firstLable.select = 1;
    self.currentSlect = self.firstLable;
    self.firstLable.tag = 1000;
    self.secondLable.select = 0;
    self.secondLable.tag = 1001;
    self.thirdLable.select = 0;
    self.thirdLable.tag = 1002;
    self.navigationItem.title = @"代理商升级";
    self.tableView.contentInset = UIEdgeInsetsMake(-28, 0, 0, 0);
    
    
    KWeakSelf(self);
    self.firstLable.userInteractionEnabled = YES;
    self.secondLable.userInteractionEnabled = YES;
    self.thirdLable.userInteractionEnabled = YES;
    
    [self.firstLable bk_whenTapped:^{
        weakself.currentSlect.select = 0;
        weakself.currentSlect = self.firstLable;
        weakself.currentSlect.select = 1;
    }];
    [self.secondLable bk_whenTapped:^{
        weakself.currentSlect.select = 0;
        weakself.currentSlect = self.secondLable;
        weakself.currentSlect.select = 1;
    }];
    [self.thirdLable bk_whenTapped:^{
        weakself.currentSlect.select = 0;
        weakself.currentSlect = self.thirdLable;
        weakself.currentSlect.select = 1;
    }];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)getPayList{
//
//    []
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"order/paytypelist" parame:nil isHud:NO isHaseCache:NO success:^(id json) {
        LWLog(@"%@",json);
        
        NSArray * pay =  [BuyAccountPayChanel mj_objectArrayWithKeyValuesArray:json[@"data"]];
        self.payList = pay;
        for (int i = 0; i < pay.count; i++) {
            BuyAccountPayChanel * t = [pay objectAtIndex:i];
            SelectLable * c = [self.payTTLable objectAtIndex:i];
            c.hidden = NO;
        }
    } failure:^(NSError *error) {
        LWLog(@"%@",error);
    }];
    
}


- (void)getGood{

    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolGet:@"Order/GetAgentUpgradeGoods" parame:nil isHud:YES isHaseCache:NO success:^(id json) {
        
        LWLog(@"%@",json);
        [self.goodImage sd_setImageWithURL:[NSURL URLWithString:json[@"data"][@"GoodsImgURL"]] placeholderImage:[UIImage imageNamed:@"caiGou"]];
        self.goodName.text = json[@"data"][@"GoodsName"];
        self.price = [NSString stringWithFormat:@"%@元",json[@"data"][@"GoodsPrice"]];
        self.NeedAddr = [json[@"data"][@"NeedAddr"] intValue];
        self.moneyLable.text = [NSString stringWithFormat:@"%@",json[@"data"][@"GoodsPrice"]];
        
        NSString * tt =  [NSString stringWithFormat:@"%@元",json[@"data"][@"GoodsPrice"]];
        NSString * cc = [NSString stringWithFormat:@"应付 %@",tt];
        
        NSRange t = NSMakeRange(3, tt.length - 1);
        NSMutableAttributedString * a = [[NSMutableAttributedString alloc] initWithString:cc];
        [a addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:t];
        
        self.nextmoneyLable.attributedText = a;
        [self.tableView reloadData];
//        "GoodsImgURL":"http://***.***.com/***.jpg",
//        "":"代理商升级",
//        "GoodsPrice":200,
//        "NeedAddr":1
        
        
    } failure:^(NSError *error) {
        
    }];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 1) {
        [BRAddressPickerView showAddressPickerWithDefaultSelected:nil resultBlock:^(BRProvinceModel *province, BRCityModel *city, BRAreaModel *area) {
            
            NSString * tt =  [NSString stringWithFormat:@"%@/%@/%@",province.name,city.name,area.name];
            NSString * cc =  [NSString stringWithFormat:@"%@/%@/%@",province.code,city.code,area.code];
            self.shengshi.text = tt;
            self.cityText = tt;
            self.cityCodeText = cc;
        }];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}



- (IBAction)btnClick:(id)sender {
    
    ///order/SubmitAgentUpgradeOrder
    
    
//    shipName    是    string    收货人姓名
//    shipMobile    是    string    收货人手机
//    shipAddress    是    string    收货人手机地址
//    shipArea    是    string    收货人地址名称，/隔开
//    shipAreaCode    是    string    收货人地址代码，/隔开
//    payType    是    int    支付方式类型
    
    int a =  (int)self.currentSlect.tag - 1000;
    BuyAccountPayChanel * model =  [self.payList objectAtIndex:a];
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"shipName"] = self.nameLable.text;
    dict[@"shipMobile"] = self.phoneLable.text;
    dict[@"shipAddress"] = self.cityText;
    dict[@"shipArea"] = self.cityCodeText;
    dict[@"shipAreaCode"] = self.cityCodeText;
    dict[@"payType"] = @(model.PaymentType);
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"order/SubmitAgentUpgradeOrder" parame:dict isHud:YES isHaseCache:NO success:^(id json) {
        
        LWLog(@"%@",json);
        
    } failure:^(NSError *error) {
        
    }];
    LWLog(@"ccccc");
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (!self.NeedAddr) {
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                 return [super tableView:tableView heightForRowAtIndexPath:indexPath];
            }
            return 0;
        }else{
             return [super tableView:tableView heightForRowAtIndexPath:indexPath];
        }
    }else{
         return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
