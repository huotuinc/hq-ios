//
//  ShopSettingTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/9.
//  Copyright © 2018年 HT. All rights reserved.
//
#import "ShopSettingInTableViewController.h"
#import "ShopSettingTableViewController.h"
#import "ShopSettModel.h"
#import <AVFoundation/AVFoundation.h>

@interface ShopSettingTableViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *shopHeadLable;
@property (weak, nonatomic) IBOutlet UIImageView *shopIcon;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLable;
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *shareLable;
@property (weak, nonatomic) IBOutlet UILabel *shareName;
@property (weak, nonatomic) IBOutlet UILabel *shareContentLable;
@property (weak, nonatomic) IBOutlet UILabel *shareContenName;
@property (weak, nonatomic) IBOutlet UIButton *yulan;


@property (strong, nonatomic) ShopSettModel * model;

@end

@implementation ShopSettingTableViewController

- (IBAction)yulanclick:(id)sender {
    
    [[WXLoginShare shareInstance] WXOpenXiaoChengXu];
    
}



- (void)getInitMessage{
//
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"store/info" parame:nil isHud:NO isHaseCache:NO success:^(id json) {
        LWLog(@"%@",json);
        
        [self.shopIcon sd_setImageWithURL:[NSURL URLWithString:json[@"data"][@"logo"]]];
        self.shopName.text = json[@"data"][@"name"];
        self.shareName.text = json[@"data"][@"shareTitle"];
        self.shareContenName.text = json[@"data"][@"shareContent"];
        self.model = [ShopSettModel mj_objectWithKeyValues:json[@"data"]];
//        logo = "http://images.liqucn.com/img/h21/h56/img_localize_a056fdf57f1d33f64be99175b0fbfa40_400x400.png";
//        name = "\U8428\U8fbe\U5927\U53a6";
//        shareContent = "\U6253\U6253\U6492\U5b9e\U6253\U5b9e\U7684";
//        shareTitle = "\U6253\U6253";
        
        
    } failure:^(NSError *error) {
        
    }];
}


- (void)setUpInit{
    
    self.yulan.layer.cornerRadius = 5;
    self.yulan.layer.masksToBounds = YES;
    
    [self.shopIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(60);
        make.top.mas_equalTo(self.shopIcon.superview.mas_top).mas_offset(20);
        make.bottom.mas_equalTo(self.shopIcon.superview.mas_bottom).mas_offset(-20);
        
        make.right.mas_equalTo(self.shopIcon.superview.mas_right).mas_equalTo(-10);
    }];
    self.shopIcon.backgroundColor = LWColor(201, 205, 201);
    
    
    [self.shopHeadLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(self.shopIcon.mas_centerY);
        make.left.mas_equalTo(self.shopHeadLable.superview.mas_left).mas_equalTo(10);
    }];
    
    
    [self.shopNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //make.centerY.mas_equalTo(self.shopIcon.centerY);
        make.top.mas_equalTo(self.shopNameLable.superview.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.shopNameLable.superview.mas_bottom).mas_offset(-10); make.left.mas_equalTo(self.shopNameLable.superview.mas_left).mas_equalTo(10);
    }];
    
    [self.shopName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.shopName.superview.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.shopName.superview.mas_bottom).mas_offset(-10); make.right.mas_equalTo(self.shopName.superview.mas_right).mas_equalTo(-10);
    }];
    
    
    [self.shareLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //make.centerY.mas_equalTo(self.shopIcon.centerY);
        make.top.mas_equalTo(self.shareLable.superview.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.shareLable.superview.mas_bottom).mas_offset(-10); make.left.mas_equalTo(self.shareLable.superview.mas_left).mas_equalTo(10);
    }];
    
    [self.shareName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.shareName.superview.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.shareName.superview.mas_bottom).mas_offset(-10); make.right.mas_equalTo(self.shareName.superview.mas_right).mas_equalTo(-10);
    }];
    
    [self.shareContentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //make.centerY.mas_equalTo(self.shopIcon.centerY);
        make.top.mas_equalTo(self.shareContentLable.superview.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.shareContentLable.superview.mas_bottom).mas_offset(-10); make.left.mas_equalTo(self.shareContentLable.superview.mas_left).mas_equalTo(10);
    }];
    
    [self.shareContenName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.shareContenName.superview.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.shareContenName.superview.mas_bottom).mas_offset(-10); make.right.mas_equalTo(self.shareContenName.superview.mas_right).mas_equalTo(-10);
    }];
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self getInitMessage];
}



- (void)pickImage{
    
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.editing = YES;
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];//读取设备授权状态
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        NSString *errorStr = @"应用相机权限受限,请在设置中启用";
        [MBProgressHUD showError:errorStr toView:self.view];
        return;
    }
    
    
    
    UIAlertController * vc = [UIAlertController alertControllerWithTitle:@"图片选择" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * ac = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
        imagePicker.modalPresentationStyle = UIModalPresentationFullScreen;
        imagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
        imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        //跳转到UIImagePickerController控制器弹出相机
        [self presentViewController:imagePicker animated:YES completion:nil];
    }];
    
    UIAlertAction * ac1 = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //选择相册时，设置UIImagePickerController对象相关属性
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //跳转到UIImagePickerController控制器弹出相册
        [self presentViewController:imagePicker animated:YES completion:nil];
    }];
    
    [vc addAction:ac];
    
    [vc addAction:ac1];
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
//    //获取到的图片
//    UIImage * image = [info valueForKey:UIImagePickerControllerEditedImage];
//    _imageView.image = image;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setUpInit];
    
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0; // 设置为一个接近“平均”行高的值
    self.navigationItem.title = @"店铺设置";
    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    
    
    [self getInitMessage];
    
    KWeakSelf(self);
    self.shopIcon.userInteractionEnabled = YES;
    [self.shopIcon bk_whenTapped:^{
        [weakself pickImage];
    }];
//    [self setUpInit];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 1) {
        
        ShopSettingInTableViewController * vc = [[UIStoryboard storyboardWithName:@"Shop" bundle:nil] instantiateViewControllerWithIdentifier:@"ShopSettingInTableViewController"];
        vc.navigationItem.title = @"店铺名称";
        vc.type = 1;
        vc.title = self.model.name;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 1 && indexPath.row == 0){
        ShopSettingInTableViewController * vc = [[UIStoryboard storyboardWithName:@"Shop" bundle:nil] instantiateViewControllerWithIdentifier:@"ShopSettingInTableViewController"];
        vc.navigationItem.title = @"分享标题";
        vc.type = 2;
        vc.title = self.model.shareTitle;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.section == 1 && indexPath.row == 1){
        ShopSettingInTableViewController * vc = [[UIStoryboard storyboardWithName:@"Shop" bundle:nil] instantiateViewControllerWithIdentifier:@"ShopSettingInTableViewController"];
        vc.navigationItem.title = @"分享内容";
        vc.type = 3;
        vc.title = self.model.shareContent;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    LWLog(@"xxxxx");
}
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
