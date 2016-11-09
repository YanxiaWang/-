//
//  RestaurantEnvViewController.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/7.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "RestaurantEnvViewController.h"
#import "EnvironmentDetailViewController.h"
@interface RestaurantEnvViewController ()

@end

@implementation RestaurantEnvViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavWithOneButtonwithTitle:@"员工餐厅情况" inView:self.view withrightImgName:@"shexiang" isRight:NO];
    [self createUI];
}
- (void)createUI
{
    //标题
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(64), AutoWidth(100), AutoHeight(40))];
    titleLabel.text = @"九宫格图像";
    titleLabel.font = UB_S_FONT(15);
    titleLabel.textColor = UB_RGBAS(89);
    [self.view addSubview:titleLabel];
    
    //时间
    UILabel * timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(APP_FRAME_W-AutoWidth(102), AutoHeight(64), AutoWidth(92), AutoHeight(40))];
    timeLabel.text = @"2016-08-26";
    timeLabel.font = UB_S_FONT(14);
    timeLabel.textColor = UB_RGBAS(153);
    titleLabel.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:timeLabel];
    
    [self createImgView];
}
- (void)createImgView
{
    float  width = (APP_FRAME_W-AutoWidth(1)*4)/3;
    
    for (int i = 0; i < 9; i++) {
        float  leftpoint = AutoWidth(1)+i%3*(AutoWidth(1)+width);
        float  hightpoint =i/3*(AutoWidth(25)+width)+AutoHeight(64+40);
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(leftpoint, hightpoint, width, width)];
        imgView.image = [UIImage imageNamed:@"qingkuang"];
        imgView.userInteractionEnabled = YES;
        [self.view addSubview:imgView];
        
        UILabel * showLabel = [[UILabel alloc]initWithFrame:CGRectMake(imgView.left, imgView.bottom, imgView.width, AutoHeight(25))];
        showLabel.text = @"12:30";
        showLabel.font = UB_S_FONT(13);
        showLabel.textColor = UB_RGBAS(153);
        showLabel.textAlignment = NSTextAlignmentCenter;
        showLabel.userInteractionEnabled = YES;
        [self.view addSubview:showLabel];
        
        UIButton * imgbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        imgbtn.frame = CGRectMake(imgView.left, imgView.top, imgView.width, imgView.height+showLabel.height);
        [imgbtn addTarget:self action:@selector(detailClick:) forControlEvents:UIControlEventTouchUpInside];
        imgbtn.tag = i +10;
        [self.view addSubview:imgbtn];
    }
    
    UILabel * beiLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), APP_FRAME_H-AutoHeight(40), APP_FRAME_W-AutoWidth(20), AutoHeight(40))];
    beiLabel.text = @"备注: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aemea euismod bibendum laoreet.";
    beiLabel.font = UB_S_FONT(13);
    beiLabel.textColor = UB_RGBAS(160);
    beiLabel.numberOfLines = 0;
    [self.view addSubview:beiLabel];
}
- (void)detailClick:(UIButton *)sender
{
    EnvironmentDetailViewController * envVC = [[EnvironmentDetailViewController alloc]init];
    [self.navigationController pushViewController:envVC animated:YES];
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
