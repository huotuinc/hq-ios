//
//  DayInComeTableViewController.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/22.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "DayInComeTableViewController.h"
#import "ShouYiTableViewCell.h"
#import "DayInModel.h"
#import <PGDatePicker.h>
#import <PGDatePickManager.h>

@interface DayInComeTableViewController ()<PGDatePickerDelegate>


@property (nonatomic,strong) UIButton  * btn;

@property (nonatomic,strong) PGDatePicker *datePicker;
    
    
@property (nonatomic,assign) int year;
  
@property (nonatomic,assign) int month;
    
@end

@implementation DayInComeTableViewController


- (UIButton *)btn{
    if (_btn == nil) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        NSDate * date = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"YYYY年MM"];
        
        NSCalendar * ca = [NSCalendar currentCalendar];
        NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth;
        NSDateComponents *dateComponent = [ca components:unitFlags fromDate:date];
        
        _year = (int)[dateComponent year];
        _month= (int)[dateComponent month];

        
        
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        NSString * time =  [formatter stringFromDate:date];
        [_btn setTitle:time forState:UIControlStateNormal];
        _btn.titleLabel.font = kAdaptedFontSize(15);
        _btn.titleLabel.textAlignment = NSTextAlignmentRight;
//        [_btn sizeToFit];
    }
    return _btn;
}

- (void)datePicker:(PGDatePicker *)datePicker didSelectDate:(NSDateComponents *)dateComponents{
    
    LWLog(@"%ld---%ld",(long)dateComponents.year,(long)dateComponents.year);
   
    _month = (int)dateComponents.month;
    _year = (int)dateComponents.year;
     [self.btn setTitle:[NSString stringWithFormat:@"%d年%02d",(int)dateComponents.year,(int)dateComponents.month] forState:UIControlStateNormal];
    
}
// 点击时间选择
- (void)timePick{
    
    PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
    PGDatePicker *datePicker = datePickManager.datePicker;
    datePicker.datePickerMode = PGDatePickerModeYearAndMonth;
    datePicker.datePickerType =  PGDatePickerType1;
    datePicker.delegate = self;
    [self presentViewController:datePickManager animated:false completion:nil];
    
    
//#pragma PGDatePickerDelegate
//    - (void)datePicker:(PGDatePicker *)datePicker didSelectDate:(NSDateComponents *)dateComponents {
//        NSLog(@"dateComponents = %@", dateComponents);
//    }
    
    
//    HSDatePickerVC * vc = [[HSDatePickerVC alloc] init];
//    [self presentViewController:vc animated:YES completion:^{
//        
//    }];
//    [BRDatePickerView showDatePickerWithTitle:@"时间" dateType:UIDatePickerModeDate defaultSelValue:nil minDateStr:nil maxDateStr:nil isAutoSelect:YES resultBlock:^(NSString *selectValue) {
//
//    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[ShouYiTableViewCell class] forCellReuseIdentifier:@"ShouYiTableViewCell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ssg"] style:UIBarButtonItemStylePlain target:self action:@selector(timePick)];
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc] initWithCustomView:self.btn];
    
    self.navigationItem.rightBarButtonItems = @[item,item1];
    
    if (self.type == 0) {
        self.navigationItem.title = @"每日收益";
    }else if(self.type == 1){
        self.navigationItem.title = @"每周收益";
    }else{
        self.navigationItem.title = @"每月收益";
    }
    
    [self getInitData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)getInitData{
    
//    CountType    是    int    查询类型（0-日,1-周,2-月）
//    SearchYear    是    int    查询年份
//    SearchMonth    是    int    查询月份
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"type"] = @(self.type);
    dict[@"SearchYear"] = @(self.year);
    dict[@"SearchMonth"] = @(self.month);
    [[HTNetworkingTool HTNetworkingManager] HTNetworkingToolGet:@"Profit/GetProfitItems" parame:nil isHud:YES isHaseCache:NO success:^(id json) {
        
        NSArray * array =  [DayInModel mj_objectArrayWithKeyValuesArray:json[@"data"]];
        [self.dataArray addObjectsFromArray:array];
        [self.tableView reloadData];
        LWLog(@"%@",json);
    } failure:^(NSError *error) {
        LWLog(@"%@",[error description]);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShouYiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShouYiTableViewCell" forIndexPath:indexPath];
    cell.dayInModel = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
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
