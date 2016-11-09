//
//  EnvironmentDetailViewController.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/7.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "EnvironmentDetailViewController.h"

@interface EnvironmentDetailViewController ()

@end

@implementation EnvironmentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    [self createNavWithOneButtonwithTitle:@"详情图片" inView:self.view withrightImgName:@"shexiang" isRight:NO];
    [self createUI];
}
- (void)createUI
{
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, AutoHeight(122), APP_FRAME_W, AutoHeight(14))];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"更新时间: 2016-08-7 12:12:21";
    titleLabel.font = UB_S_FONT(12);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
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
