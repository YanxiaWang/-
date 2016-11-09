//
//  TomorrowDinnerViewController.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/6.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "TomorrowDinnerViewController.h"
#import "ResturantCommitTableViewCell.h"
#import "StarView.h"
@interface TomorrowDinnerViewController ()<UITableViewDelegate , UITableViewDataSource>

@end

@implementation TomorrowDinnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self createNavWithOneButtonwithTitle:@"明日菜品" inView:self.view withrightImgName:@"shexiangtou" isRight:NO];
    [self createUI];
}
- (UIView *)createHeaderView
{
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, APP_FRAME_W, AutoHeight(405))];
    
    UIImageView * picImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, APP_FRAME_W, AutoHeight(198))];
    picImgView.image = [UIImage imageNamed:@"niuroupisa"];
    [headerView addSubview:picImgView];
    
    UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), picImgView.bottom, APP_FRAME_W-AutoWidth(20), AutoHeight(44))];
    nameLabel.text = @"黑椒牛肉披萨";
    nameLabel.textColor = UB_RGBAS(51);
    nameLabel.font = UB_S_FONT(15);
    [headerView addSubview:nameLabel];
    
    //横线
    //第一个线
    UILabel * lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), nameLabel.bottom, APP_FRAME_W-AutoWidth(20), AutoWidth(1))];
    lineLabel.backgroundColor = UB_RGBAS(229);
    [headerView addSubview:lineLabel];
    
    //赠送提示
    UILabel * giveLabel = [[UILabel alloc]init];
    giveLabel.text = @"打分:";
    CGFloat labelwidth = [CMManager kWidthWithStr:@"打分:" withFont:12];
    giveLabel.frame = CGRectMake(AutoWidth(10), lineLabel.bottom, labelwidth, AutoHeight(44));
    giveLabel.textColor = UB_RGBAS(51);
    giveLabel.font = UB_S_FONT(12);
    [headerView addSubview:giveLabel];

    StarView *starView = [[StarView alloc] initWithFrame:CGRectMake(giveLabel.right+AutoWidth(10), giveLabel.top, AutoWidth(150), AutoHeight(20)) EmptyImage:@"emptystar" StarImage:@"Star"];
    starView.center = CGPointMake(giveLabel.right+AutoWidth(85), giveLabel.center.y+AutoHeight(3));
    [headerView addSubview:starView];
    //第二个线
    UILabel * lineLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), giveLabel.bottom, APP_FRAME_W-AutoWidth(20), AutoWidth(1))];
    lineLabel2.backgroundColor = UB_RGBAS(229);
    [headerView addSubview:lineLabel2];
    
    //文字描述
    UITextView * showTextView = [[UITextView alloc]initWithFrame:CGRectMake(AutoWidth(10), lineLabel2.bottom+AutoHeight(5), APP_FRAME_W-AutoWidth(20), AutoHeight(60))];
    showTextView.placeholder = @"文字描述";
    [headerView addSubview:showTextView];
    
    //提交
    //评价
    UIButton * commenbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commenbtn.frame = CGRectMake(APP_FRAME_W-AutoWidth(70),lineLabel2.bottom+ AutoHeight(70), AutoWidth(60), AutoHeight(27));
    [commenbtn setBackgroundImage:[UIImage imageNamed:@"commentbtn"] forState:UIControlStateNormal];
    [commenbtn setTitle:@"提交" forState:UIControlStateNormal];
    [commenbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    commenbtn.titleLabel.font = UB_S_FONT(13);
    [headerView addSubview:commenbtn];
    
    UIView * bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, AutoHeight(395), APP_FRAME_W, AutoHeight(10))];
    bottomView.backgroundColor = UB_RGBAS(246);
    [headerView addSubview:bottomView];
    return headerView;
}
- (void)createUI
{
    UITableView * listTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, AutoHeight(58), APP_FRAME_W, APP_FRAME_H-AutoHeight(90)) style:UITableViewStylePlain];
    listTableview.delegate = self;
    listTableview.dataSource = self;
    listTableview.tableHeaderView = [self createHeaderView];
    [self.view addSubview:listTableview];
}
#pragma mark  tableview delegate && datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return AutoWidth(0.01);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    return AutoHeight(106);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

        ResturantCommitTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[ResturantCommitTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
    cell.lineLabel.hidden = 1 == YES;
        return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.section == 1) {
//        LoveBabySpaceViewController * babyVC = [[LoveBabySpaceViewController alloc]init];
//        [self.navigationController pushViewController:babyVC animated:YES];
//    }
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
