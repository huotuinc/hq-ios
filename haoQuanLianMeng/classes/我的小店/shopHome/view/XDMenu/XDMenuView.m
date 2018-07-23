//
//  XDMenuView.m
//  TestPresentationController
//
//  Created by 李信达 on 2018/3/28.
//  Copyright © 2018年 李信达. All rights reserved.
//

#import "XDMenuView.h"
#import "XDMenuPopoverBackgroundView.h"
#import <Masonry.h>

static CGFloat const itemHeight = 30;
static CGFloat const iconWidth = 50;
static CGFloat const borderInset = 10;
static NSString * const cellIdentifier = @"ItemCell";

@interface XDMenuView ()<UITableViewDelegate,UITableViewDataSource,UIPopoverPresentationControllerDelegate,UIPopoverControllerDelegate>

@property(nonatomic,weak)UITableView * mainTableView;
@property(nonatomic,strong)NSMutableArray * itemList;
@property(nonatomic,assign)CGFloat maxWidth;

@end

@implementation XDMenuView
+(instancetype)menuViewWithSender:(id)sender{
    XDMenuView * menuView = [[XDMenuView alloc]init];
    //设置弹出的样式为popover
    menuView.modalPresentationStyle = UIModalPresentationPopover;
    //设置弹出控制器的尺寸
    //    menu.preferredContentSize = CGSizeMake(200, 200);
    //设置popoverPresentationController的sourceRect和sourceView属性
    //    menu.popoverPresentationController.sourceRect = sender.bounds;
   
    menuView.popoverPresentationController.barButtonItem =  [[UIBarButtonItem alloc] initWithCustomView:sender];
    //设置箭头方向
    //    menu.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionDown;
    //UIEdgeInsets popoverLayoutMargins;
    
    menuView.popoverPresentationController.backgroundColor = [UIColor grayColor];
    menuView.popoverPresentationController.popoverBackgroundViewClass = [XDMenuPopoverBackgroundView class];
    menuView.popoverPresentationController.delegate = menuView;
    menuView.presentationController.delegate = menuView;
    return menuView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //去掉圆角
    self.view.backgroundColor = [UIColor clearColor];
    self.maxWidth = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidLayoutSubviews{
    [self.mainTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset(0);
        make.left.equalTo(self.view).mas_offset(borderInset);
        make.right.equalTo(self.view).mas_offset(-borderInset);
        make.bottom.equalTo(self.view).mas_offset(0);
        make.height.mas_equalTo(itemHeight*self.itemList.count);
    }];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
-(void)addItem:(XDMenuItem *)item{
    
    CGFloat itemWidth = borderInset * 2;
    if (item.iconTitleStr.length>0) {
        itemWidth = itemWidth + iconWidth + borderInset *2;
    }else{
        itemWidth = itemWidth + borderInset *4;
    }
    NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:13.f ]};
    CGRect rect = [item.titleStr boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, itemHeight) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dic context:nil];
    
    CGFloat titleWidth = CGRectGetWidth(rect);
    itemWidth = itemWidth + titleWidth;
    if (_maxWidth < itemWidth) {
        _maxWidth = itemWidth;
    }
    [self.itemList addObject:item];
    self.preferredContentSize = CGSizeMake(_maxWidth, itemHeight*self.itemList.count + 4 );
    [self.mainTableView reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return itemHeight;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont systemFontOfSize:13];
//        cell.separatorInset = [UIe]
        cell.textLabel.textColor = self.titleColor?self.titleColor:[UIColor whiteColor];
    }
    XDMenuItem * item = self.itemList[indexPath.row];
    if (item.iconTitleStr.length>0) {
        cell.imageView.image = [UIImage imageNamed:item.iconTitleStr];
    }
    
    cell.textLabel.text = item.titleStr;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XDMenuItem * item = self.itemList[indexPath.row];
    [self dismissViewControllerAnimated:YES completion:^{
        if (item.clickBlock) {
            item.clickBlock(item,self);
        }
    }];
    
}

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;
}
-(NSMutableArray *)itemList{
    if (!_itemList) {
        _itemList = [NSMutableArray array];
    }
    return _itemList;
}
-(UITableView *)mainTableView{
    if (!_mainTableView) {
        UITableView * mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainTableView = mainTableView;
        [self.view addSubview:mainTableView];
        mainTableView.delegate = self;
        mainTableView.dataSource = self;
        mainTableView.scrollEnabled = NO;
        mainTableView.backgroundColor = self.backColor?self.backColor:[UIColor grayColor];
        mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _mainTableView;
}

@end


@implementation XDMenuItem

+(instancetype) item:(NSString *)titleStr icon:(NSString *)iconTitleStr clickBlock:(XDmenuItemClickBlock) clickBlock{
    XDMenuItem * item = [[XDMenuItem alloc]init];
    item.titleStr = titleStr;
    item.iconTitleStr = iconTitleStr;
    item.clickBlock = clickBlock;
    return item;
}

@end

