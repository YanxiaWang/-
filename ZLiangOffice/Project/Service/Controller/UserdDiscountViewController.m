//
//  UserdDiscountViewController.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/7.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "UserdDiscountViewController.h"
#import "DiscountLifeTableViewCell.h"
@interface UserdDiscountViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation UserdDiscountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self createNavWithOneButtonwithTitle:@"可用优惠券" inView:self.view withrightImgName:@"shexiangtou" isRight:NO];
    [self initnavigationBar];
    [self createUI];
}
- (void)createUI
{
    UITableView * listTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, AutoHeight(64), APP_FRAME_W, APP_FRAME_H-AutoHeight(104)) style:UITableViewStylePlain];
    listTableview.delegate = self;
    listTableview.dataSource = self;
    listTableview.backgroundColor = UB_RGB(243, 243, 243);
    listTableview.separatorColor = [UIColor clearColor];
    [self.view addSubview:listTableview];
}

#pragma mark  tableview delegate && datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return AutoWidth(0);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return AutoHeight(139);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DiscountLifeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[DiscountLifeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;
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

@end
