//
//  YKHViewController.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/2.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "YKHViewController.h"
#import "AppDelegate.h"

@interface YKHViewController ()

@end

@implementation YKHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    self.view.backgroundColor = UB_RGBA(0.96, 0.96, 0.96, 1.00);
    [self initNavi];
    [self createUI];
}
-(void)initNavi{

    UIView * naviView = [[UIView alloc]init];
    naviView.userInteractionEnabled = YES;
    naviView.backgroundColor = COLOR_WhiteColor;
    [self.view addSubview:naviView];
    
    
    [naviView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view);
        make.height.mas_equalTo(AutoHeight(64));
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
    }];
    
    UIButton * backBtn = [CommUtls createButtonWithTitle:nil image:@"navi-Back" fontSize:nil textColor:nil target:self sel:@selector(backLastPage)];
    [naviView addSubview:backBtn];
    
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(25));
        make.height.mas_equalTo(AutoHeight(30));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(12));
    }];
    
    UILabel * titleLabel = [CommUtls createLabelWithTitle:@"悦客会员" fontSize:Font_Eighteen_S textColor:COLOR_BlackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [naviView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(30));
        make.height.mas_equalTo(AutoHeight(20));
        make.left.mas_equalTo(self.view).offset(AutoWidth(100));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-100));
    }];
}
-(void)createUI{
    UIColor * titleC = UB_RGBA(0.87, 0.76, 0.71, 1.00);
    UIColor * contentC = UB_RGBA(0.75, 0.75, 0.75, 1.00);
    UILabel * title1 = [CommUtls createLabelWithTitle:@"普通会员" fontSize:Font_Fifteen_S textColor:titleC];
    title1.textAlignment = NSTextAlignmentCenter;
    title1.backgroundColor = COLOR_WhiteColor;
    [self.view addSubview:title1];
    [title1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(72));
        make.height.mas_equalTo(AutoHeight(35));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
    }];
    
    UILabel * content1 = [CommUtls createLabelWithTitle:@"goodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgame" fontSize:Font_Twelve_S textColor:contentC];
    content1.textAlignment = NSTextAlignmentLeft;
    content1.backgroundColor = COLOR_WhiteColor;
    [self.view addSubview:content1];
    [content1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title1.mas_bottom).offset(AutoHeight(1));
        make.height.mas_equalTo(AutoHeight(115));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
    }];
    
    UILabel * title2 = [CommUtls createLabelWithTitle:@"普通会员" fontSize:Font_Fifteen_S textColor:titleC];
    title2.textAlignment = NSTextAlignmentCenter;
    title2.backgroundColor = COLOR_WhiteColor;
    [self.view addSubview:title2];
    [title2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(content1.mas_bottom).offset(AutoHeight(10));
        make.height.mas_equalTo(AutoHeight(35));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
    }];

    UILabel * content2 = [CommUtls createLabelWithTitle:@"goodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgame" fontSize:Font_Twelve_S textColor:contentC];
    content2.textAlignment = NSTextAlignmentLeft;
    content2.backgroundColor = COLOR_WhiteColor;
    [self.view addSubview:content2];
    [content2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title2.mas_bottom).offset(AutoHeight(1));
        make.height.mas_equalTo(AutoHeight(115));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
    }];
    UILabel * title3 = [CommUtls createLabelWithTitle:@"黄金会员" fontSize:Font_Fifteen_S textColor:titleC];
    title3.textAlignment = NSTextAlignmentCenter;
    title3.backgroundColor = COLOR_WhiteColor;
    [self.view addSubview:title3];
    [title3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(content2.mas_bottom).offset(AutoHeight(10));
        make.height.mas_equalTo(AutoHeight(35));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
    }];
    
    UILabel * content3 = [CommUtls createLabelWithTitle:@"goodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgamegoodgame" fontSize:Font_Twelve_S textColor:contentC];
    content3.textAlignment = NSTextAlignmentLeft;
    content3.backgroundColor = COLOR_WhiteColor;
    [self.view addSubview:content3];
    [content3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title3.mas_bottom).offset(AutoHeight(1));
        make.height.mas_equalTo(AutoHeight(115));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
    }];
}

-(void)backLastPage{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate initLeftSlideVC];
    [self.navigationController presentViewController:tempAppDelegate.LeftSlideVC animated:YES completion:nil];

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
