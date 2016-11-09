//
//  ActivityReportViewController.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/8.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "ActivityReportViewController.h"

@interface ActivityReportViewController ()

@end

@implementation ActivityReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self createNavWithOneButtonwithTitle:@"活动详情" inView:self.view withrightImgName:@"" isRight:NO];
    self.view.backgroundColor = UB_RGBAS(246);
//    [self createUI];
    [self createErrorUI];
    
}
- (void)createUI
{
    UIImageView * imgView = [[UIImageView alloc]init];
    imgView.frame = CGRectMake((APP_FRAME_W-AutoWidth(65))/2, AutoHeight(64+45), AutoHeight(65), AutoHeight(65));
    imgView.image = [UIImage imageNamed:@"duihao"];
    [self.view addSubview:imgView];
    
    UILabel * infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, imgView.bottom+AutoWidth(20), APP_FRAME_W, AutoHeight(16))];
    infoLabel.text = @"报名成功";
    infoLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:infoLabel];
    
    NSArray * leftArray = @[@"昵称 点点",@"联系方式 12345678901"];
    for (int i = 0; i < 2; i++) {
        UIView * hengView = [[UIView alloc]initWithFrame:CGRectMake(0, AutoHeight(189+64)+AutoHeight(55)*i, APP_FRAME_W, AutoHeight(45))];
        hengView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:hengView];
        UILabel * leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), 0, AutoWidth(250), hengView.height)];
        leftLabel.text = leftArray[i];
        leftLabel.font = UB_S_FONT(14);
        leftLabel.textColor = UB_RGBAS(51);
        [hengView addSubview:leftLabel];
        
        
        UIButton * editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        editBtn.frame = CGRectMake(APP_FRAME_W-AutoWidth(30), AutoHeight(14), AutoWidth(20), AutoHeight(22));
        [editBtn setBackgroundImage:[UIImage imageNamed:@"huodongbianji"] forState:UIControlStateNormal];
//        editBtn.imageEdgeInsets = UIEdgeInsetsMake(-5, -5, -5, -5);
        [hengView addSubview:editBtn];
    }
    
    
    
}
- (void)createErrorUI
{
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(AutoWidth(30), AutoHeight(51+64),APP_FRAME_W-AutoWidth(60),AutoHeight(221))];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    UIImageView * imgView = [[UIImageView alloc]init];
    imgView.frame = CGRectMake((bgView.width-AutoWidth(65))/2, AutoHeight(36), AutoHeight(65), AutoHeight(65));
    imgView.image = [UIImage imageNamed:@"cuowutu"];
    [bgView addSubview:imgView];
    
    UILabel * infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, imgView.bottom+AutoWidth(20), bgView.width, AutoHeight(16))];
    infoLabel.text = @"报名失败";
    infoLabel.textAlignment = NSTextAlignmentCenter;
    infoLabel.textColor = UB_RGBAS(52);
    
    [bgView addSubview:infoLabel];
    
    UILabel * infoLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(0, infoLabel.bottom+AutoWidth(10), bgView.width, AutoHeight(16))];
    infoLabel2.text = @"活动人数已够,下次再来参加哟";
    infoLabel2.textAlignment = NSTextAlignmentCenter;
    infoLabel2.textColor = UB_RGBAS(53);
    [bgView addSubview:infoLabel2];
    
  
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
