//
//  MineViewController.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/2.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "MineViewController.h"
#import "MainInfoTableViewCell.h"
@interface MineViewController ()<UITableViewDataSource ,UITableViewDelegate>

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
}
- (UIView *)createHeadView
{
    UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, AutoHeight(0), APP_FRAME_W, AutoHeight(140))];
    headView.backgroundColor = [UIColor whiteColor];
    
    UIImageView * firstImg = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(73), AutoHeight(47), AutoWidth(78), AutoHeight(82))];
    firstImg.image = [UIImage imageNamed:@"touxiangtu"];
    [headView addSubview:firstImg];
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(10), AutoWidth(220), AutoHeight(14))];
    titleLabel.center = CGPointMake(firstImg.center.x, firstImg.bottom+AutoHeight(13));
    titleLabel.text = @"金不换";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = UB_S_FONT(14);
    titleLabel.textColor = UB_RGBAS(51);
    [headView addSubview:titleLabel];
    
    UILabel * leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), titleLabel.bottom+AutoHeight(0), AutoWidth(150), AutoHeight(14))];
    leftLabel.center = CGPointMake(titleLabel.center.x, leftLabel.bottom+AutoHeight(5));
    leftLabel.text = @"ID:113456";
    leftLabel.textColor = UB_RGBAS(153);
    leftLabel.font = UB_S_FONT(13);
    leftLabel.textAlignment = NSTextAlignmentCenter;
    [headView addSubview:leftLabel];
    
    return headView;
}

- (void)createUI
{
    UITableView * listTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, APP_FRAME_W, APP_FRAME_H) style:UITableViewStyleGrouped];
    listTableview.delegate = self;
    listTableview.dataSource = self;
    listTableview.backgroundColor = UB_RGB(243, 243, 243);
    listTableview.separatorColor = [UIColor clearColor];
    listTableview.tableHeaderView = [self createHeadView];
    [self.view addSubview:listTableview];
}

#pragma mark  tableview delegate && datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
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
    return AutoHeight( 45.0f);
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return AutoHeight(50);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainInfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MainInfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSArray * imgViewArray = @[@"wodedingdan",@"wodeyuyue",@"xiaoxitongzhi",@"zujiefuwu",@"fangkeguanli",@"wuyeguanli",@"yijianfankui"];
    NSArray * infoArray = @[@"我的订单",@"我的预约",@"消息通知",@"租借服务",@"访客管理",@"物业管理",@"意见反馈"];
    cell.leftImgView.image = [UIImage imageNamed:imgViewArray[indexPath.row]];
    cell.infoLabel.text = infoArray[indexPath.row];
    if (indexPath.row == 0) {
        cell.leftImgView.frame =CGRectMake(AutoWidth(60), AutoHeight(17.5), AutoWidth(14), AutoHeight(16.5));
    }else if (indexPath.row == 2)
    {
     cell.leftImgView.frame =CGRectMake(AutoWidth(58), AutoHeight(17.5), AutoWidth(14), AutoHeight(13));
    }else if (indexPath.row == 4)
    {
     cell.leftImgView.frame =CGRectMake(AutoWidth(58), AutoHeight(17.5), AutoWidth(17), AutoHeight(15));
    }
    else if (indexPath.row == 5)
    {
      cell.leftImgView.frame =CGRectMake(AutoWidth(58), AutoHeight(17.5), AutoWidth(20), AutoHeight(18));
    }
    else if (indexPath.row == 6)
    {
      cell.leftImgView.frame =CGRectMake(AutoWidth(58), AutoHeight(17.5), AutoWidth(17), AutoHeight(16.5));
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    ShopDetailViewController * shopVC = [[ShopDetailViewController alloc]init];
    //    [self.navigationController pushViewController:shopVC animated:YES];
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
