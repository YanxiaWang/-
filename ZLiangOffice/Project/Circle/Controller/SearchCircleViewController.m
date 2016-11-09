//
//  SearchCircleViewController.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/8.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "SearchCircleViewController.h"
#import "KindSportTableViewCell.h"
@interface SearchCircleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong)UITextField * searchText;
@end

@implementation SearchCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self createNavWithOneButtonwithTitle:@"活动详情" inView:self.view withrightImgName:@"" isRight:NO];
//    [self initnavigationBar];
    [self createUI];
}
- (void)createUI
{
    UIView * searchView = [[UIView alloc]initWithFrame:CGRectMake(0, AutoHeight(64), APP_FRAME_W, AutoHeight(50))];
    searchView.backgroundColor = UB_RGBAS(247);
    [self.view addSubview:searchView];
    
    UIImageView * topView = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(10), APP_FRAME_W-AutoWidth(50), AutoHeight(30))];
    topView.image =[UIImage imageNamed:@"baidikuang"];
    [searchView addSubview:topView];
    
    UIImageView * searchImg = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10),AutoWidth(6), AutoWidth(18),AutoWidth(18))];
    searchImg.image = [UIImage imageNamed:@"sousuo"];
    [topView addSubview:searchImg];
    
    self.searchText = [[UITextField alloc]initWithFrame:CGRectMake(searchImg.right+AutoWidth(12), 0, AutoWidth(240),AutoHeight(30))];
    self.searchText.textColor = UB_RGBAS(53);
    self.searchText.placeholder = @"活动名称/活动时间";
    self.searchText.font = UB_S_FONT(12);
    [topView addSubview:self.searchText];
    
    
    UIButton * cancleBtn = [[UIButton alloc]initWithFrame:CGRectMake(APP_FRAME_W - AutoWidth(40), AutoHeight(10), AutoWidth(40), AutoHeight(30))];
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancleBtn setTitleColor:UB_RGBAS(153) forState:UIControlStateNormal];
    cancleBtn.titleLabel.font = UB_S_FONT(12);
    [cancleBtn addTarget:self action:@selector(cancleBrnClick) forControlEvents:UIControlEventTouchUpInside];
    [searchView addSubview:cancleBtn];
    
    
    UITableView * listTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, searchView.bottom, APP_FRAME_W, APP_FRAME_H-searchView.bottom) style:UITableViewStylePlain];
    listTableview.delegate = self;
    listTableview.dataSource = self;
    listTableview.backgroundColor = UB_RGB(243, 243, 243);
    listTableview.separatorColor = [UIColor clearColor];
    [self.view addSubview:listTableview];
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
    return AutoWidth(0);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return AutoHeight(187);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KindSportTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[KindSportTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.row == 0) {
        cell.lineLabel.hidden = YES;
    }else
    {
        cell.lineLabel.hidden = NO;
    }
    return cell;
}
- (void)createOrderBtn
{
    UIView * bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, APP_FRAME_H-AutoHeight(77), APP_FRAME_W, AutoHeight(77))];
    bottomView.backgroundColor = UB_RGBAS(246);
    [self.view addSubview:bottomView];
    UIButton * orderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    orderBtn.frame = CGRectMake(AutoWidth(10), AutoHeight(20), APP_FRAME_W-AutoWidth(40), AutoHeight(40));
    [orderBtn setBackgroundImage:[UIImage imageNamed:@"bottombtn"] forState:UIControlStateNormal];
    [orderBtn setTitle:@"确定" forState:UIControlStateNormal];
    [orderBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    orderBtn.titleLabel.font = UB_S_FONT(14);
    [orderBtn addTarget:self action:@selector(orderbtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:orderBtn];
}
- (void)orderbtnClick:(UIButton *)sender
{
    NSLog(@"确定");
}
- (void)cancleBrnClick
{
    NSLog(@"取消按钮");
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
