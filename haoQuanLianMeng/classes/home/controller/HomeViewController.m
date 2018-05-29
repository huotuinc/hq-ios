//
//  HomeViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/29.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeBannerView.h"
#import "HomeFourItem.h"


@interface HomeViewController ()<SDCycleScrollViewDelegate>

@property (nonatomic,strong) HomeBannerView  * homeBannerView;

@property (nonatomic,strong) HomeFourItem * homeFourItem;

@property (nonatomic,strong) UIView * headContainer;

@end

@implementation HomeViewController

- (UIView *)headContainer{
    if (_headContainer == nil) {
        _headContainer = [[UIView alloc] init];
        [_headContainer addSubview:self.homeBannerView];
        [_headContainer addSubview:self.homeFourItem];
    }
    return _headContainer;
}



- (HomeFourItem *)homeFourItem{
    if (_homeFourItem == nil) {
        _homeFourItem = [[HomeFourItem alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.homeBannerView.frame) + 10, KScreenWidth, 200)];
        _headContainer.frame = CGRectMake(0, 0, KScreenWidth, CGRectGetMaxY(self.homeFourItem.frame));
    }
    return _homeFourItem;
}


- (HomeBannerView *)homeBannerView{
    if (_homeBannerView == nil) {
        _homeBannerView = [HomeBannerView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreenWidth, 150) delegate:self placeholderImage:nil];
        _homeBannerView.autoScrollTimeInterval = 3.0f;
    }
    return _homeBannerView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.tableHeaderView = self.headContainer;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
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
