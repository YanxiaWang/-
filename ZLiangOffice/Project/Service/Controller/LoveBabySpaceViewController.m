//
//  LoveBabySpaceViewController.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/6.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "LoveBabySpaceViewController.h"
#import "BabySpaceTableViewCell.h"
#import "BabyDetailViewController.h"
@interface LoveBabySpaceViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LoveBabySpaceViewController

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
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return AutoHeight(288);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BabySpaceTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[BabySpaceTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BabyDetailViewController * babyVC = [[BabyDetailViewController alloc]init];
    [self.navigationController pushViewController:babyVC animated:YES];
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
