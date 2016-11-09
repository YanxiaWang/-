//
//  BaseViewController.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/3.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_WhiteColor;
    //[self initnavigationBar];

}

-(void)initnavigationBar{
    UIButton * mineBtn = [CommUtls createButtonWithTitle:nil image:@"navi-Mine" fontSize:nil textColor:nil target:self sel:@selector(gotoPersonalCenter)];
    [self.view addSubview:mineBtn];
    UIButton* messageBtn = [CommUtls createButtonWithTitle:nil image:@"navi-Message" fontSize:nil textColor:nil target:self sel:@selector(gotoPersonalCenter)];
    [self.view addSubview:messageBtn];\
    [mineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(20));
        make.height.mas_equalTo(AutoHeight(35));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(35));
    }];
    [messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(20));
        make.height.mas_equalTo(AutoHeight(35));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
        make.width.mas_equalTo(AutoWidth(35));
    }];
    
    _titleL = [CommUtls createLabelWithTitle:nil fontSize:Font_Fifteen_S textColor:COLOR_WhiteColor];
    _titleL.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_titleL];
    [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(20));
        make.height.mas_equalTo(AutoHeight(30));
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
    }];

}
-(void)gotoPersonalCenter{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (tempAppDelegate.LeftSlideVC.closed)
    {
        [tempAppDelegate.LeftSlideVC openLeftView];
    }
    else
    {
        [tempAppDelegate.LeftSlideVC closeLeftView];
    }

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:YES];
}

//服务和圈子的导航条
- (void)createNavBarWithCenterImg:(NSString *)imgName
{
    //背景图
    UIView * navView = [[UIView alloc]init];
    navView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navView];
    
    [navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view);
        make.height.mas_equalTo(AutoHeight(64));
        make.width.mas_equalTo(self.view);
    }];
    
    //个人中心
    UIButton * mineBtn = [CommUtls createButtonWithTitle:nil image:@"navi-Mine" fontSize:nil textColor:nil target:self sel:@selector(gotoPersonalCenter)];
    [self.view addSubview:mineBtn];
    [mineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(20));
        make.height.mas_equalTo(AutoHeight(35));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(35));
    }];
    
    //中间标题
    
    UIImageView * backImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"homeBack"]];
    [self.view addSubview:backImage];
    [self.view sendSubviewToBack:backImage];
    
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view);
        make.height.mas_equalTo(AutoHeight(210));
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
    }];
    
    //右侧搜索按钮
    UIButton * searchBtn = [CommUtls createButtonWithTitle:nil image:@"navi-Mine" fontSize:nil textColor:nil target:self sel:@selector(gotoPersonalCenter)];
    [self.view addSubview:searchBtn];
    [searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(20));
        make.height.mas_equalTo(AutoHeight(35));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(35));
    }];
    
    
    
    //右侧信息接收按钮
    UIButton * messageBtn = [CommUtls createButtonWithTitle:nil image:@"navi-Mine" fontSize:nil textColor:nil target:self sel:@selector(gotoPersonalCenter)];
    [self.view addSubview:messageBtn];
    [messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(20));
        make.height.mas_equalTo(AutoHeight(35));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(35));
    }];
    
    
}
/**
 *  显示默认的NavBar(导航栏是透明的)
 */
- (void)createNavWithOneButtonwithTitle:(NSString *)navTitle
                                 inView:(UIView *)view
                       withrightImgName:(NSString *)rightImgName
                                isRight: (BOOL)isRight
{
    // 背景
    UIView *navBarView          = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_FRAME_W, AutoHeight(64))];
    navBarView.backgroundColor  = [UIColor whiteColor];
    [view addSubview:navBarView];
    
    // 文字
    UILabel *navLabel       = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, APP_FRAME_W, navBarView.height-20)];
    navLabel.textAlignment  = NSTextAlignmentCenter;
    navLabel.font           = UB_S_FONT(17);
    navLabel.textColor      = [UIColor blackColor];
    navLabel.text           = navTitle;
    [navBarView addSubview:navLabel];
    if (isRight == YES)
    {
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame = CGRectMake(0, 32, 20, 20);
        rightBtn.center = CGPointMake(APP_FRAME_W-AutoWidth(20), navLabel.center.y);
        [rightBtn setImage:[UIImage imageNamed:rightImgName] forState:UIControlStateNormal];
        rightBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [rightBtn addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
        [navBarView addSubview:rightBtn];
    }
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(AutoWidth(10), AutoWidth(20), AutoWidth(10), AutoHeight(18));
    backBtn.center = CGPointMake(AutoWidth(15), navLabel.center.y);
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    backBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [backBtn addTarget:self action:@selector(popVCAction:) forControlEvents:UIControlEventTouchUpInside];
    [navBarView addSubview:backBtn];
    
}

-(void)crateTwoBtnNavwithTitle:(NSString *)titleImg
                        inView:(UIView *)view
                   firstBtnImg:(NSString *)firstBtnName
                  secondBtnImg:(NSString *)secondBtnName
{
    //背景图
    UIView * navView = [[UIView alloc]init];
    [view addSubview:navView];
    navView.frame = CGRectMake(0, 0, APP_FRAME_W, AutoHeight(64));

    
    //个人中心
    UIButton * mineBtn = [CommUtls createButtonWithTitle:nil image:@"navi-Mine" fontSize:nil textColor:nil target:self sel:@selector(gotoPersonalCenter)];
    mineBtn.frame = CGRectMake(AutoWidth(10), AutoHeight(25), AutoWidth(32), AutoHeight(35));
    [navView addSubview:mineBtn];
    
    //中间标题
    
    UIImageView * backImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:titleImg]];
    [self.view addSubview:backImage];
    [navView sendSubviewToBack:backImage];
    backImage.frame = CGRectMake(0, 0, AutoWidth(55), AutoHeight(30));
    backImage.center = CGPointMake(navView.center.x, navView.center.y+AutoHeight(10));
   
    //右侧搜索按钮//@"navi-Mine"
//    UIButton * searchBtn = [CommUtls createButtonWithTitle:nil image:firstBtnName fontSize:nil textColor:nil target:self sel:@selector(searchBtnClick:)];
    UIButton * searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(APP_FRAME_W-AutoWidth(65), AutoHeight(32), AutoHeight(20), AutoHeight(20));
    [searchBtn setBackgroundImage:[UIImage imageNamed:firstBtnName] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:searchBtn];
    
    
    
    //右侧信息接收按钮//@"navi-Mine"
    UIButton * messageBtn = [CommUtls createButtonWithTitle:nil image:secondBtnName fontSize:nil textColor:nil target:self sel:@selector(gotoPersonalCenter)];
    [navView addSubview:messageBtn];
    messageBtn.frame = CGRectMake(APP_FRAME_W-AutoWidth(30), AutoHeight(32), AutoHeight(20), AutoHeight(20));

}
- (void)searchBtnClick:(UIButton *)sender
{
    
}
- (void)rightAction:(UIButton *)sender
{
    
}
- (void)popVCAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
