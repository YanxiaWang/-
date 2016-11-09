//
//  BabyDetailViewController.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/6.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "BabyDetailViewController.h"
#import "BabyDetailTableViewCell.h"
@interface BabyDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation BabyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    [self CreateSearchBar];
    [self createNavWithOneButtonwithTitle:@"爱婴空间" inView:self.view withrightImgName:@"shexiangtou" isRight:NO];
    [self createUI];
    
}
- (void)createUI
{
    UITableView * listTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, APP_FRAME_W, APP_FRAME_H-64-AutoHeight(40)) style:UITableViewStyleGrouped];
    listTableview.delegate = self;
    listTableview.dataSource = self;
    listTableview.backgroundColor = UB_RGB(243, 243, 243);
    listTableview.separatorColor = [UIColor clearColor];
    listTableview.tableHeaderView = [self createHeadView];
    [self.view addSubview:listTableview];
}
- (UIView *)createHeadView
{
    UIView * headview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, APP_FRAME_W, AutoHeight(210))];
    headview.backgroundColor = [UIColor whiteColor];
    UIImageView * headImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, APP_FRAME_W, AutoHeight(190))];
    headImgView.image = [UIImage imageNamed:@"babytu"];
    [headview addSubview:headImgView];
    return headview;
}
#pragma mark  tableview delegate && datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return AutoHeight(90);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BabyDetailTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[BabyDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSArray * imgArray = @[@"babytu1",@"babytu2",@"babytu3"];
    NSArray * titleArray = @[@"空间描述",@"配套服务介绍",@"使用说明"];
    cell.topimgView.image = [UIImage imageNamed:imgArray[indexPath.row]];
    cell.titleLabel.text = titleArray[indexPath.row];
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
