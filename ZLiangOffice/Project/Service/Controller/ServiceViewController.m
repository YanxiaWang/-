//
//  ServiceViewController.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/2.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "ServiceViewController.h"
//第一列
#import "ServiceChooseTableViewCell.h"
#import "DiscountLifeViewController.h"
//第二列
#import "BabyImgTableViewCell.h"
#import "DinnerPlaceViewController.h"
//第三列
#import "HotShopTableViewCell.h"
#import "RestaurantViewController.h"
//店家详情
#import "ShopDetailViewController.h"
//第四列
#import "GoodTableViewCell.h"


#import "LoveBabySpaceViewController.h"
#define  CELLONE   @"CELL1"
#define  CELLTWO   @"CELL2"
#define  CELLTHREE   @"CELL3"
#define  CELLFOUR   @"CELL4"
@interface ServiceViewController ()<UITableViewDataSource,UITableViewDelegate>
{
     UIView   *_menuView;//选择菜单视图
}
@end

@implementation ServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self initnavigationBar];
    [self createUI];
}
- (void)createUI
{
    UITableView * listTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, AutoHeight(58), APP_FRAME_W, APP_FRAME_H-AutoHeight(90)) style:UITableViewStylePlain];
    listTableview.delegate = self;
    listTableview.dataSource = self;
//    listTableview.backgroundColor = [UIColor clearColor];
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
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{

    return AutoWidth(10);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return AutoHeight(75);
    }else if (indexPath.section == 1)
    {
        return AutoHeight(204);
    }else if (indexPath.section == 2)
    {
        return AutoHeight(177);
    }
    return AutoHeight(234);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        ServiceChooseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CELLONE];
        if (!cell) {
            cell = [[ServiceChooseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLONE];
        }
        cell.chooseBlock = ^(NSInteger choosetag){
            switch (choosetag) {
                case 10:
                {NSLog(@"第一个");
                    DiscountLifeViewController * lifeVC = [[DiscountLifeViewController alloc]init];
                    [self.navigationController pushViewController:lifeVC animated:YES];
                }
                    break;
                case 11:
                { NSLog(@"第2个");
                    DinnerPlaceViewController * dinnerVC = [[DinnerPlaceViewController alloc]init];
                    [self.navigationController pushViewController:dinnerVC animated:YES];
                }
                    break;
                case 12:
                {
                    NSLog(@"第3个");
                    RestaurantViewController * restVC = [[RestaurantViewController alloc]init];
                    [self.navigationController pushViewController:restVC animated:YES];
                }
                    break;
                case 13:
                    NSLog(@"第4个");
                    break;
                default:
                    break;
            }
        };

        return cell;
    }else if(indexPath.section == 1)
    {
    BabyImgTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CELLTWO];
    if (!cell) {
        cell = [[BabyImgTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLTWO];
    }
        return cell;
    }else if(indexPath.section == 2)
    {
        __weak typeof(self) weakSelf  = self;
        HotShopTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CELLTHREE];
        if (!cell) {
            cell = [[HotShopTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLTHREE];
        }
        //更多按钮
        cell.moreClick = ^(){
            RestaurantViewController * restVC = [[RestaurantViewController alloc]init];
            [weakSelf.navigationController pushViewController:restVC animated:YES];
        };
        //到店铺详情
        cell.shopClick = ^(NSInteger shoptag){
            ShopDetailViewController * detailVC = [[ShopDetailViewController alloc]init];
            [weakSelf.navigationController pushViewController:detailVC animated:YES];
        };
        return cell;
    }
    else
    {
        GoodTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CELLFOUR];
        if (!cell) {
            cell = [[GoodTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLFOUR];
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        LoveBabySpaceViewController * babyVC = [[LoveBabySpaceViewController alloc]init];
        [self.navigationController pushViewController:babyVC animated:YES];
    }
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
