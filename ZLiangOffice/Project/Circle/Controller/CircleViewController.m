//
//  CircleViewController.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/2.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "CircleViewController.h"
#import "BannerView.h"
#import "HotActivityTableViewCell.h"
#import "KindSportTableViewCell.h"
#import "SearchCircleViewController.h"
//发布活动
#import "PublishActivityViewController.h"
#import "ActivityDetailViewController.h"
@interface CircleViewController ()<BannerTouchDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) BannerView *bannerView;        // 自定义的轮播图
@property (nonatomic, strong) NSMutableArray *banImageArray; // 存放轮播图的数组
@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
//    [self initnavigationBar]; 
    [self crateTwoBtnNavwithTitle:@"circletitle" inView:self.view firstBtnImg:@"sousuohei" secondBtnImg:@"xiaoxihei"];
    [self createUI];
    [self createEditButton];
    
}
- (UIView *)createheadView
{
    UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, APP_FRAME_W, AutoHeight(270))];
    // 轮播图
    self.bannerView               = [[BannerView alloc] initWithFrame:CGRectMake(0, 0, APP_FRAME_W, AutoHeight(182))];
    self.bannerView.banImageArray = self.banImageArray;
    self.bannerView.delegate      = self;
    [headView addSubview:self.bannerView];
    
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.bannerView.bottom, APP_FRAME_W, AutoHeight(90))];
    scrollView.showsHorizontalScrollIndicator = NO;
    NSArray * titleArray = @[@"paobutu",@"paobutu",@"paobutu",@"paobutu",@"paobutu"];
    NSArray * leftArray = @[@"R",@"B",@"R",@"R",@"R"];
    NSArray * upArray = @[@"跑步",@"篮球",@"读书",@"读书",@"读书"];
    NSArray * downArray = @[@"un",@"asketball",@"ead",@"ead",@"ead"];
    for (int i = 0; i < 5; i ++) {
        float btnX = AutoWidth(10)+ (AutoWidth(80)+AutoWidth(10))*i;
        
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(btnX, AutoHeight(10), AutoWidth(80), AutoHeight(70))];
        imgView.image = [UIImage imageNamed:titleArray[i]];
       
        
        UILabel * bigLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(12), AutoHeight(20), AutoWidth(22), AutoHeight(30))];
        bigLabel.text = leftArray[i];
        bigLabel.textColor = [UIColor whiteColor];
        bigLabel.font = UB_S_FONT(40);
        [imgView addSubview:bigLabel];
        
        UILabel * upLabel = [[UILabel alloc]initWithFrame:CGRectMake(bigLabel.right, bigLabel.top, AutoWidth(50), bigLabel.height/2)];
        upLabel.text = upArray[i];
        upLabel.textColor = [UIColor whiteColor];
         upLabel.font = UB_S_FONT(13);
        [imgView addSubview:upLabel];
        
        UILabel * downLabel = [[UILabel alloc]initWithFrame:CGRectMake(bigLabel.right, upLabel.bottom, AutoWidth(50), bigLabel.height/2)];
        downLabel.text = downArray[i];
        downLabel.textColor = [UIColor whiteColor];
         upLabel.font = UB_S_FONT(11);
        [imgView addSubview:downLabel];

         [scrollView addSubview:imgView];
        
        
        UIButton * proBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        proBtn.frame = CGRectMake(btnX, AutoHeight(10), AutoWidth(80), AutoHeight(70));
        proBtn.backgroundColor = [UIColor orangeColor];
        [proBtn setBackgroundImage:[UIImage imageNamed:titleArray[i]] forState:UIControlStateNormal];
//        [scrollView addSubview:proBtn];
        scrollView.contentSize = CGSizeMake(AutoHeight(10)+AutoWidth(90)*(i+1), AutoHeight(90));

    }
        [headView addSubview:scrollView];
    return headView;
}

- (void)createUI
{
    UITableView * listTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, APP_FRAME_W, APP_FRAME_H-64) style:UITableViewStyleGrouped];
    listTableview.delegate = self;
    listTableview.dataSource = self;
    listTableview.backgroundColor = UB_RGB(243, 243, 243);
    listTableview.separatorColor = [UIColor clearColor];
    listTableview.tableHeaderView = [self createheadView];
    [self.view addSubview:listTableview];
}

#pragma mark  tableview delegate && datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 45;
    }
    return 35.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return AutoHeight(187);
    }
    return AutoHeight(170);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        KindSportTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (!cell) {
            cell = [[KindSportTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        }
        if (indexPath.row == 0) {
            cell.lineLabel.hidden = YES;
        }else
        {
            cell.lineLabel.hidden = NO;
        }
        return cell;
    }else
    {
        
        HotActivityTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[HotActivityTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        return cell;
    }
   }
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, APP_FRAME_W, AutoHeight(45))];
        headView.backgroundColor = [UIColor whiteColor];
        UIImageView * ImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, AutoWidth(195), AutoHeight(16))];
        ImgView.center = headView.center;
        ImgView.image = [UIImage imageNamed:@"officialactivities"];
        [headView addSubview:ImgView];
       
        UIButton * officeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        officeBtn.frame = CGRectMake(AutoWidth(95), AutoHeight(15), AutoWidth(65), AutoHeight(16));
        [officeBtn setTitle:@"官方活动" forState:UIControlStateNormal];
        [officeBtn setTitle:@"官方活动" forState:UIControlStateSelected];
        [officeBtn setTitleColor:UB_RGBAS(153) forState:UIControlStateNormal];
        [officeBtn setTitleColor:UB_RGBAS(86) forState:UIControlStateSelected];
        officeBtn.titleLabel.font = UB_S_FONT(14);
        officeBtn.selected = YES;
        [headView addSubview:officeBtn];
        
        UIButton * selfBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        selfBtn.frame = CGRectMake(AutoWidth(175), AutoHeight(15), AutoWidth(56), AutoHeight(16));
        [selfBtn setTitle:@"自建活动" forState:UIControlStateNormal];
        [selfBtn setTitle:@"自建活动" forState:UIControlStateSelected];
        [selfBtn setTitleColor:UB_RGBAS(153) forState:UIControlStateNormal];
        [selfBtn setTitleColor:UB_RGBAS(86) forState:UIControlStateSelected];
        selfBtn.titleLabel.font = UB_S_FONT(12);
        [headView addSubview:selfBtn];

        UILabel * line = [[UILabel alloc]initWithFrame:CGRectMake(0, AutoHeight(44), APP_FRAME_W, AutoHeight(1))];
        line.backgroundColor = UB_RGBAS(229);
        [headView addSubview:line];
        return headView;
    }else
    {
        UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, APP_FRAME_W, AutoHeight(15))];
        headView.backgroundColor = [UIColor whiteColor];
        UIImageView * headImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, AutoHeight(8), AutoWidth(170), AutoHeight(15))];
        headImgView.center = CGPointMake(headView.center.x, headView.center.y+AutoHeight(18));
        headImgView.image = [UIImage imageNamed:@"hotactivity"];
        [headView addSubview:headImgView];
        
        UILabel * titleLabel = [[UILabel alloc]initWithFrame:headImgView.frame];
        titleLabel.textColor = UB_RGBAS(51);
        titleLabel.text = @"热门活动";
        titleLabel.font = UB_S_FONT(14);
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [headView addSubview:titleLabel];
        return headView;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityDetailViewController * vc = [[ActivityDetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)createEditButton
{
    UIButton * orderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    orderBtn.frame = CGRectMake(APP_FRAME_W- AutoWidth(60),APP_FRAME_H- AutoHeight(118), AutoWidth(51), AutoHeight(51));
    [orderBtn setBackgroundImage:[UIImage imageNamed:@"huiyuan"] forState:UIControlStateNormal];
    [orderBtn addTarget:self action:@selector(editClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:orderBtn];
    
    UIButton * editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    editBtn.frame = CGRectMake(AutoWidth(14.5),AutoHeight(14.5), AutoWidth(22), AutoHeight(22));
//    editBtn.center = orderBtn.center;
    [editBtn setBackgroundImage:[UIImage imageNamed:@"quanziedit"] forState:UIControlStateNormal];
    [editBtn addTarget:self action:@selector(editClick:) forControlEvents:UIControlEventTouchUpInside];
    [orderBtn addSubview:editBtn];
    
}
- (void)initBannerData {
    self.banImageArray              = [[NSMutableArray alloc] initWithCapacity:0];
    NSString *imgPath               = nil;
    
    imgPath = @"http://a.hiphotos.baidu.com/image/w%3D2048/sign=bb5e1ca8f536afc30e0c38658721eac4/e824b899a9014c08d61779cd087b02087bf4f4ae.jpg";
    [self.banImageArray addObject:imgPath];
    imgPath = @"http://c.hiphotos.baidu.com/image/w%3D2048/sign=5b1df9ac80025aafd33279cbcfd5aa64/8601a18b87d6277f14218d542a381f30e924fcaf.jpg";
    [self.banImageArray addObject:imgPath];
    imgPath = @"http://c.hiphotos.baidu.com/image/w%3D2048/sign=0f153f1b00087bf47dec50e9c6eb562c/6a63f6246b600c3395c4de98184c510fd9f9a124.jpg";
    [self.banImageArray addObject:imgPath];
    imgPath = @"http://b.hiphotos.baidu.com/image/w%3D2048/sign=93a8955b938fa0ec7fc7630d12af58ee/d52a2834349b033baacdabb217ce36d3d539bd15.jpg";
    [self.banImageArray addObject:imgPath];
    imgPath = @"http://i3.sinaimg.cn/travel/2013/1115/U8159P704DT20131115154937.jpg";
    [self.banImageArray addObject:imgPath];
    
    
}
- (void)bannerImageTouch:(NSInteger)tag
{
    
}
- (void)searchBtnClick:(UIButton *)sender
{
    SearchCircleViewController * searchVC = [[SearchCircleViewController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];
}
- (void)editClick:(UIButton *)sender
{
    PublishActivityViewController * pubVC = [[PublishActivityViewController alloc]init];
    [self.navigationController pushViewController:pubVC animated:YES];
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
