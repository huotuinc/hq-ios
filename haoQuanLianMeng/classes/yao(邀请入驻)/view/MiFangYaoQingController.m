//
//  MiFangYaoQingController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/19.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MiFangYaoQingController.h"
#import "MiFangYaoHeader.h"
#import "MiFangAccountTableViewCell.h"
#import "MiFangFooter.h"
#import "MiFangYaoViewController.h"
#import "MiFangYaoQingModel.h"


typedef void(^downImageFinsh)(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished);

@interface MiFangYaoQingController ()<MiFangAccountTableViewDelegate,MiFangFooterDelegate>

@property (nonatomic,strong) MiFangYaoHeader * miFangYaoHeader;
@property (nonatomic,strong) MiFangFooter * miFangYaoFooter;
@property (nonatomic,strong) MiFangAccountTableViewCell *cell;

//邀请页面数据
@property (nonatomic,strong) MiFangYaoQingModel * model;
@end

@implementation MiFangYaoQingController

- (void)btnClcik{
    
    if (!self.model.BuddyPoster.length  || !self.model.ProgramBuddyURL.length) {
        [MBProgressHUD showError:@"图片地址为空"];
        return;
    }
    
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:self.model.BuddyPoster] options:SDWebImageDownloaderLowPriority progress:nil completed:^(UIImage * _Nullable imaget, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
        LWLog(@"%@",error);
        if (!error) {
            KWeakSelf(self);
//            NSString * cc =  @"http://res.mifangtest.com/resource/images/PageQRCode/4886/470537/fcb236cbc0c50375e9373d2a132e539f.png";
//            self.model.ProgramBuddyURL
            [self downErMar:[NSURL URLWithString:self.model.ProgramBuddyURL] finish:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
                if (!error) {
                    [weakself addImage:imaget withImage:image];
                }
            }];
        }
    }];
    
    //ProgramBuddyURL
}


- (void)downErMar:(NSURL *)url finish:(downImageFinsh)block{
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:url options:SDWebImageDownloaderLowPriority progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
        
        LWLog(@"%@",error);
        if (!error) {
            if (block) {
                block(image,data,error,finished);
            }
        }
    }];
}


- (void)addImage:(UIImage *)imageName1 withImage:(UIImage *)imageName2 {
    
    UIImage *image1 = imageName1;
    UIImage *image2 = imageName2;
    
    UIGraphicsBeginImageContext(image1.size);
    
    [image1 drawInRect:CGRectMake(0, 0, image1.size.width, image1.size.height)];
    
    [image2 drawInRect:CGRectMake((image1.size.width - image2.size.width)/2,(image1.size.height - image2.size.height)/2, image2.size.width, image2.size.height)];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NSMutableArray * cc = [NSMutableArray array];
    [cc addObject:resultingImage];
    [self shareClick:cc];
}



//- (void)composeImg:(UIImage *)bgImage andUpImage:(UIImage *)upImage {
//
//    UIImage *img = upImage;
//    CGImageRef imgRef = img.CGImage;
//    CGFloat w = CGImageGetWidth(imgRef);
//    CGFloat h = CGImageGetHeight(imgRef);
//
//    //以1.png的图大小为底图
//    UIImage *img1 = bgImage;
//    CGImageRef imgRef1 = img1.CGImage;
//    CGFloat w1 = CGImageGetWidth(imgRef1);
//    CGFloat h1 = CGImageGetHeight(imgRef1);
//
//    //以1.png的图大小为画布创建上下文
//    UIGraphicsBeginImageContext(CGSizeMake(w1, h1));
//    [img1 drawInRect:CGRectMake(0, 0, w1, h1)];//先把1.png 画到上下文中
//    [img drawInRect:CGRectMake(100, 100, w, h)];//再把小图放在上下文中
//    UIImage *resultImg = UIGraphicsGetImageFromCurrentImageContext();//从当前上下文中获得最终图片
//    UIGraphicsEndImageContext();//关闭上下文
//
//    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
//    NSString *filePath = [path stringByAppendingPathComponent:@"01.png"];
//    [UIImagePNGRepresentation(resultImg) writeToFile:filePath atomically:YES];//保存图片到沙盒
//
////    CGImageRelease(imgRef1);
////    CGImageRelease(imgRef);
//
//
//
//}

- (void)shareClick:(NSMutableArray * )imageArray {
    
    // 设置分享内容
//    NSString *text = @"分享内容";
//    UIImage *image = [UIImage imageNamed:@"play"];
//    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSArray *activityItems = [imageArray copy];
    LWLog(@"xxxxxxx");
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
//    activityViewController
    //    activityViewController.excludedActivityTypes = @[UIActivityTypePostToFacebook,UIActivityTypePostToTwitter, UIActivityTypePostToWeibo,UIActivityTypePrint,UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll,UIActivityTypeAddToReadingList,UIActivityTypePostToFlickr,UIActivityTypePostToVimeo,UIActivityTypePostToTencentWeibo,UIActivityTypeAirDrop,UIActivityTypeOpenInIBooks];
    [self presentViewController:activityViewController animated:YES completion:nil];
    
    // 选中活动列表类型
    [activityViewController setCompletionWithItemsHandler:^(NSString * __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError){
        NSLog(@"act type %@",activityType);
    }];
}


- (MiFangFooter *)miFangYaoFooter{
    if (_miFangYaoFooter == nil) {
        _miFangYaoFooter = [[MiFangFooter alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 60)];
        _miFangYaoFooter.delegate = self;
        
    }
    return _miFangYaoFooter;
}

- (MiFangYaoHeader *)miFangYaoHeader{
    if (_miFangYaoHeader == nil) {
        _miFangYaoHeader = [[MiFangYaoHeader alloc] init];
        _miFangYaoHeader.frame = CGRectMake(0, 0, KScreenWidth, [_miFangYaoHeader getHeight]);
    }
    return _miFangYaoHeader;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = self.miFangYaoHeader;
    self.tableView.tableFooterView = self.miFangYaoFooter;
    
    self.tableView.sectionHeaderHeight = 10;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    [self.tableView registerClass:[MiFangAccountTableViewCell class] forCellReuseIdentifier:@"MiFangAccountTableViewCell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self getData];
}


- (void)getData{
//
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolPost:@"Profit/Invitations" parame:nil isHud:YES isHaseCache:NO success:^(id json) {
        LWLog(@"%@",json);
        
        MiFangYaoQingModel * model = [MiFangYaoQingModel mj_objectWithKeyValues:[json objectForKey:@"data"]];
        [self.miFangYaoHeader configure:model];
        [self.cell configure:model];
        self.model = model;
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MiFangAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MiFangAccountTableViewCell" forIndexPath:indexPath];
    cell.delegate = self;
    self.cell = cell;
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    UIView * v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 10)];
    return v;
}



- (void)MiFangAccountClick:(NSUInteger)index andUrl:(NSString *)url{
    
    
    MiFangYaoViewController * vc = [[MiFangYaoViewController alloc] init];
    vc.type = (int)index;
    vc.funUrl = [url copy];
    [self.navigationController pushViewController:vc animated:YES];
    
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
