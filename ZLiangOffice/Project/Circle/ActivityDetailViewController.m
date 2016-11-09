//
//  ActivityDetailViewController.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/8.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "ActivityDetailViewController.h"
#import "ActivityReportViewController.h"
#import "ActivityCommendTableViewCell.h"
@interface ActivityDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ActivityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavWithOneButtonwithTitle:@"活动详情" inView:self.view withrightImgName:@"fenxiangtu" isRight:YES];
    [self createUI];
}
- (UIView *)createHeadView
{
    UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, AutoHeight(0), APP_FRAME_W, AutoHeight(560))];
    headView.backgroundColor = UB_RGBAS(246);
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, AutoHeight(10), APP_FRAME_W, AutoHeight(560))];
    bgView.backgroundColor = [UIColor whiteColor];
    [headView addSubview:bgView];
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(10), APP_FRAME_W-AutoWidth(20), AutoHeight(30))];
    titleLabel.text = @"中粮集团2016企业服务创新会";
    titleLabel.font = UB_S_FONT(16);
    [bgView addSubview:titleLabel];
    
    UILabel * leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), titleLabel.bottom+AutoHeight(0), AutoWidth(150), AutoHeight(20))];
    leftLabel.text = @"发布人:张美丽";
    leftLabel.textColor = UB_RGBAS(153);
    leftLabel.font = UB_S_FONT(12);
    [bgView addSubview:leftLabel];
    
    UILabel * timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(APP_FRAME_W-AutoWidth(160), leftLabel.top, AutoWidth(150), leftLabel.height)];
    timeLabel.text = @"发布时间:07-02";
    timeLabel.textColor = UB_RGBAS(153);
    timeLabel.textAlignment = NSTextAlignmentRight;
    timeLabel.font = UB_S_FONT(12);
    [bgView addSubview:timeLabel];
    
    UILabel * contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), timeLabel.bottom, APP_FRAME_W-AutoWidth(20), AutoHeight(116))];
    contentLabel.text = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
    contentLabel.textColor = UB_RGBAS(109);
    contentLabel.numberOfLines = 0;
    contentLabel.font = UB_S_FONT(13);
    [bgView addSubview:contentLabel];
    
    UIImageView * firstImg = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), contentLabel.bottom, APP_FRAME_W-AutoWidth(20), AutoHeight(151))];
    firstImg.image = [UIImage imageNamed:@"xiangqingtu"];
    [bgView addSubview:firstImg];
    
    UIImageView * secondImg = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), firstImg.bottom+AutoHeight(10), APP_FRAME_W-AutoWidth(20), AutoHeight(151))];
    secondImg.image = [UIImage imageNamed:@"xiangqingtu"];
    [bgView addSubview:secondImg];
    
    UIImageView * leftImg = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), secondImg.bottom+AutoHeight(15), AutoWidth(14), AutoHeight(17))];
    leftImg.image = [UIImage imageNamed:@"tishitu"];
    [bgView addSubview:leftImg];
    
    UILabel * renLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftImg.right+AutoWidth(10), secondImg.bottom+AutoHeight(3), AutoWidth(200), AutoHeight(45))];
    renLabel.text = @"当前已有44人报名参加";
    renLabel.font = UB_S_FONT(12);
    renLabel.textColor = UB_RGBAS(51);
    [bgView addSubview:renLabel];
    
    UIButton * joinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    joinBtn.frame = CGRectMake(APP_FRAME_W- AutoWidth(71), secondImg.bottom+AutoHeight(11), AutoWidth(61), AutoHeight(27));
    [joinBtn setTitle:@"我要参加" forState:UIControlStateNormal];
    [joinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    joinBtn.titleLabel.font = UB_S_FONT(12);
    [joinBtn setBackgroundImage:[UIImage imageNamed:@"commentbtn"] forState:UIControlStateNormal];
    [joinBtn addTarget:secondImg action:@selector(joinBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:joinBtn];
    return headView;
}

- (void)createUI
{
    UITableView * listTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, APP_FRAME_W, APP_FRAME_H-64) style:UITableViewStyleGrouped];
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
    return AutoHeight( 45.0f);
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return AutoHeight(106);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityCommendTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[ActivityCommendTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    ShopDetailViewController * shopVC = [[ShopDetailViewController alloc]init];
//    [self.navigationController pushViewController:shopVC animated:YES];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
        UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, APP_FRAME_W, AutoHeight(45))];
        headView.backgroundColor = [UIColor whiteColor];
        UILabel * line = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(0), APP_FRAME_W-AutoWidth(20), AutoHeight(44))];
        line.textColor = UB_RGBAS(229);
        line.text = @"热门评论";
        line.font = UB_S_FONT(14);
        [headView addSubview:line];
        return headView;

}

- (void)joinBtnClick
{
    ActivityReportViewController * vc = [[ActivityReportViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)rightAction:(UIButton *)sender
{
   
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
