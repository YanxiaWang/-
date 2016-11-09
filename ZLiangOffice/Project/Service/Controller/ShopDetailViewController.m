//
//  ShopDetailViewController.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/7.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "ShopDetailViewController.h"
#import "MenuListTableViewCell.h"
#import "BaseInfoTableViewCell.h"
#import "CommitContentTableViewCell.h"
@interface ShopDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * listTableview;
}

@end

@implementation ShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    [self CreateSearchBar];
//    [self createNavWithOneButtonwithTitle:@"商家详情" inView:self.view withrightImgName:@"" isRight:NO];
//    self.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationController.navigationBar.hidden = YES;
    [self createUI];
    [self createNavView];
    flag[3] = YES;
    
}
- (void)createNavView
{
    // 背景
    UIView *navBarView          = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_FRAME_W, AutoHeight(64))];
    navBarView.backgroundColor  = [UIColor clearColor];
    [self.view addSubview:navBarView];
    
    // 文字
    UILabel *navLabel       = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, APP_FRAME_W, navBarView.height-20)];
    navLabel.textAlignment  = NSTextAlignmentCenter;
    navLabel.font           = UB_S_FONT(17);
    navLabel.textColor      = [UIColor whiteColor];
    navLabel.text           = @"商家详情";
    [navBarView addSubview:navLabel];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(AutoWidth(10), AutoWidth(20), AutoWidth(10), AutoHeight(18));
    backBtn.center = CGPointMake(AutoWidth(15), navLabel.center.y);
    [backBtn setImage:[UIImage imageNamed:@"backBtn"] forState:UIControlStateNormal];
    backBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [backBtn addTarget:self action:@selector(popVCAction:) forControlEvents:UIControlEventTouchUpInside];
    [navBarView addSubview:backBtn];

}
- (UIView *)createHeaderView
{
    UIView * headview = [[UIView alloc]initWithFrame:CGRectMake(0, 64, APP_FRAME_W, AutoHeight(175))];
    headview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgview"]];
    UIImageView * topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(76), AutoWidth(90), AutoHeight(90))];
    topImgView.image = [UIImage imageNamed:@"food"];
    [headview addSubview:topImgView];
    
    //名称
    UILabel * titleLabel = [CommUtls createLabelWithTitle:@"梅菜扣肉" fontSize:Font_Thirteen_S textColor:COLOR_WhiteColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.frame = CGRectMake(AutoWidth(10)+topImgView.right, AutoHeight(17+64), AutoWidth(140), AutoHeight(14));
    [headview addSubview:titleLabel];
    
    //评价
    UIButton * commenbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commenbtn.frame = CGRectMake(titleLabel.right, topImgView.top, AutoWidth(61), AutoHeight(27));
    [commenbtn setBackgroundImage:[UIImage imageNamed:@"commentbtn"] forState:UIControlStateNormal];
    [commenbtn setTitle:@"预约" forState:UIControlStateNormal];
    [commenbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    commenbtn.titleLabel.font = UB_S_FONT(14);
    [headview addSubview:commenbtn];
    
    float starspace = AutoWidth(4);
    UIImageView * lastStarView;
    for (int j = 0; j <5; j ++) {
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(titleLabel.left+(starspace +AutoWidth(7))*j, titleLabel.bottom+AutoWidth(10), AutoWidth(7), AutoWidth(7))];
        imgView.image = [UIImage imageNamed:@"star"];
        [headview addSubview:imgView];
        if (j == 4) {
            lastStarView = imgView;
        }
    }
    //得分
    UILabel * scoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(lastStarView.right+AutoWidth(5), lastStarView.top, AutoWidth(50), AutoHeight(10))];
    scoreLabel.center = CGPointMake(lastStarView.right+AutoWidth(30), lastStarView.center.y);
    scoreLabel.text = @"5.0";
    scoreLabel.textColor = [UIColor whiteColor];
    scoreLabel.font = UB_S_FONT(10);
    [headview addSubview:scoreLabel];
    
    
    //点赞条数
    UIButton * zanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    zanBtn.frame = CGRectMake(titleLabel.left, AutoHeight(80+64), AutoWidth(40),AutoHeight(15) );
    [zanBtn setImage:[UIImage imageNamed:@"zan1"] forState:UIControlStateNormal];
    [zanBtn setTitle:@"500" forState:UIControlStateNormal];
    [zanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//UB_RGB(102, 102, 102)
    zanBtn.titleEdgeInsets  =UIEdgeInsetsMake(0, 2, 0, -5);
//    zanBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 2, 2, 2);
    zanBtn.titleLabel.font = UB_S_FONT(10);
    [headview addSubview:zanBtn];
    //评论条数
    UIButton * commentDetailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commentDetailBtn.frame = CGRectMake(zanBtn.right+AutoWidth(10), AutoHeight(80+64), AutoWidth(40),AutoHeight(15) );
    [commentDetailBtn setImage:[UIImage imageNamed:@"comment1"] forState:UIControlStateNormal];
    [commentDetailBtn setTitle:@"500" forState:UIControlStateNormal];
    [commentDetailBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//UB_RGB(102, 102, 102)
    commentDetailBtn.titleEdgeInsets  =UIEdgeInsetsMake(0, 2, 0, -5);
//     commentDetailBtn.imageEdgeInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    commentDetailBtn.titleLabel.font = UB_S_FONT(10);
    [headview addSubview:commentDetailBtn];

    return headview;
}
- (void)createUI
{
    listTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, APP_FRAME_W, APP_FRAME_H) style:UITableViewStyleGrouped];
    listTableview.delegate = self;
    listTableview.dataSource = self;
    listTableview.backgroundColor = UB_RGB(243, 243, 243);
    listTableview.separatorColor = [UIColor clearColor];
    listTableview.tableHeaderView = [self createHeaderView];
    listTableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:listTableview];
}

#pragma mark  tableview delegate && datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //判断，根据这个区的状态值
    if (flag[section] == YES)
    {
//        NSArray * array = _rowTitleArray[section];
//        return array.count;
        if (section == 0) {
            return 2;
        }else if(section == 1)
        {
            return 3;
        }else
        {
            return 2;
        }
       
    }else
    {
        return 0 ;
   
    }
   
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return AutoHeight(112);
    }else if (indexPath.section == 1)
    {
        return AutoHeight(44);
    }
    return AutoHeight(105);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MenuListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[MenuListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        
        return cell;
    }else if (indexPath.section == 1)
    {
        BaseInfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (!cell) {
            cell = [[BaseInfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        }
        NSArray * leftImageArray = @[@"shijian",@"ditu",@"dianhua"];
        NSArray * rightArray = @[@"00:00-24:00",@"北京市朝阳区八里庄50号",@"010-12345678"];
        cell.picImgVIew.image = [UIImage imageNamed:leftImageArray[indexPath.row]];
        if (indexPath.row != 0) {
            cell.picImgVIew.frame = CGRectMake(AutoWidth(10), AutoHeight(13), AutoWidth(16), AutoHeight(18));
        }
        cell.contentLabel.text = rightArray[indexPath.row];
        return cell;
    }else
    {
        CommitContentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (!cell) {
            cell = [[CommitContentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
        }
        return cell;
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, APP_FRAME_W, AutoHeight(44))];
    bgView.backgroundColor = [UIColor whiteColor];
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), 0, APP_FRAME_W-AutoWidth(100), AutoHeight(44))];
    NSArray * titleArray = @[@"菜单列表",@"基本信息",@"评论内容"];
    titleLabel.text = titleArray[section];
    titleLabel.textColor = UB_RGBAS(102);
    titleLabel.font = UB_S_FONT(15);
    [bgView addSubview:titleLabel];
    
    UIButton* downBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    downBtn.frame = CGRectMake(APP_FRAME_W-AutoWidth(27), AutoHeight(19), AutoWidth(17), AutoHeight(11));
    [downBtn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    downBtn.imageEdgeInsets = UIEdgeInsetsMake(-2, -2, -2, -2);
    [downBtn addTarget:self action:@selector(openOrNotClick:) forControlEvents:UIControlEventTouchUpInside];
    downBtn.tag = section;
    [bgView addSubview:downBtn];
    return bgView;
}
- (void)popVCAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)openOrNotClick:(UIButton *)sender
{
     flag[sender.tag] = ! flag[sender.tag];
    NSIndexSet * set = [NSIndexSet indexSetWithIndex:sender.tag];
    [listTableview reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
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
