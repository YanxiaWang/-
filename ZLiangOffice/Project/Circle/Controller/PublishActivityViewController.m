//
//  PublishActivityViewController.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/8.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "PublishActivityViewController.h"
#import "KindSportTableViewCell.h"
@interface PublishActivityViewController ()

@end

@implementation PublishActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = UB_RGBAS(246);
    [self createNavWithOneButtonwithTitle:@"发布活动" inView:self.view withrightImgName:@"" isRight:NO];
    [self createUI];
//    [self createOrderBtn];
}
- (void)createUI
{
    UIView * firstView = [[UIView alloc]initWithFrame:CGRectMake(0, AutoHeight(64+10), APP_FRAME_W, AutoHeight(90))];
    firstView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:firstView];
    
    CGFloat  labelWidth = [CMManager kWidthWithStr:@"标题" withFont:15];
    UILabel * leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), 0, labelWidth+5, AutoHeight(44))];
    leftLabel.textColor = UB_RGBAS(102);
    leftLabel.text = @"标题";
    leftLabel.font = UB_S_FONT(14);
    [firstView addSubview:leftLabel];
    
    UITextField * titleTF = [[UITextField alloc]initWithFrame:CGRectMake(leftLabel.right+AutoWidth(10), 0,APP_FRAME_W-leftLabel.right, leftLabel.height)];
    titleTF.textColor = UB_RGBAS(53);
    titleTF.font = UB_S_FONT(14);
    [firstView addSubview:titleTF];
    
    //线
    UILabel * line = [[UILabel alloc]initWithFrame:CGRectMake(0, leftLabel.bottom, APP_FRAME_W, 1)];
    line.backgroundColor = UB_RGBAS(229);
    [firstView addSubview:line];

    UILabel * kindLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), line.bottom, labelWidth+5, AutoHeight(45))];
    kindLabel.textColor = UB_RGBAS(102);
    kindLabel.text = @"类型";
    kindLabel.font = UB_S_FONT(14);
    [firstView addSubview:kindLabel];
    
    UITextField * kindTF = [[UITextField alloc]initWithFrame:CGRectMake(leftLabel.right+AutoWidth(10), 0,APP_FRAME_W-kindLabel.right-AutoWidth(50), kindLabel.height)];
    kindTF.textColor = UB_RGBAS(53);
    kindTF.font = UB_S_FONT(14);
    kindTF.text = @"篮球";
    kindTF.userInteractionEnabled = NO;
    [firstView addSubview:kindTF];
    
    UIImageView * arrowImg = [[UIImageView alloc]initWithFrame:CGRectMake(APP_FRAME_W-AutoWidth(22), AutoHeight(19)+line.bottom, AutoWidth(13), AutoHeight(6))];
    arrowImg.image = [UIImage imageNamed:@"down"];
    arrowImg.userInteractionEnabled = YES;
    [firstView addSubview:arrowImg];
    
    UIButton * downBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    downBtn.frame = CGRectMake(APP_FRAME_W-AutoWidth(40), line.bottom, AutoWidth(40), AutoHeight(45));
    [firstView addSubview:downBtn];
    [self createSecondViewWithfirstView:firstView];
}
- (void)createSecondViewWithfirstView:(UIView *)firstView
{
    UIView * secondView = [[UIView alloc]initWithFrame:CGRectMake(0, AutoHeight(10)+firstView.bottom, APP_FRAME_W, AutoHeight(45))];
    secondView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:secondView];
    
    CGFloat  labelWidth = [CMManager kWidthWithStr:@"标题" withFont:15];
    UILabel * leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), 0, labelWidth+5, AutoHeight(44))];
    leftLabel.textColor = UB_RGBAS(102);
    leftLabel.text = @"人数";
    leftLabel.font = UB_S_FONT(14);
    [secondView addSubview:leftLabel];
    
    UITextField * titleTF = [[UITextField alloc]initWithFrame:CGRectMake(leftLabel.right+AutoWidth(10), 0,APP_FRAME_W-leftLabel.right, leftLabel.height)];
    titleTF.textColor = UB_RGBAS(53);
    titleTF.font = UB_S_FONT(14);
    titleTF.placeholder = @"设置参与人数限制";
    [secondView addSubview:titleTF];
    [self createThirdViewWithsecondView:secondView];

}

- (void)createThirdViewWithsecondView:(UIView *)secondView
{
    UIView * thirdView = [[UIView alloc]initWithFrame:CGRectMake(0, AutoHeight(0)+secondView.bottom, APP_FRAME_W, AutoHeight(45))];
    thirdView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:thirdView];
    
    CGFloat  labelWidth = [CMManager kWidthWithStr:@"是否需要报名" withFont:15];
    UILabel * leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), 0, labelWidth+5, AutoHeight(44))];
    leftLabel.textColor = UB_RGBAS(102);
    leftLabel.text = @"是否需要报名";
    leftLabel.font = UB_S_FONT(13);
    [thirdView addSubview:leftLabel];
    
    //男按钮
    UIButton * manBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    manBtn.frame = CGRectMake(AutoWidth(105), AutoHeight(12), AutoHeight(21), AutoHeight(21));
    manBtn.imageEdgeInsets = UIEdgeInsetsMake(-2, -2, -2, -2);
    [manBtn setImage:[UIImage imageNamed:@"choose"] forState:UIControlStateSelected];
    [manBtn setImage:[UIImage imageNamed:@"nochoose"] forState:UIControlStateNormal];
    manBtn.selected = YES;
    [thirdView addSubview:manBtn];
    
    UILabel * manLabel = [[UILabel alloc]initWithFrame:CGRectMake(manBtn.right+AutoWidth(10), AutoHeight(0), AutoWidth(60), AutoHeight(44))];
    manLabel.text = @"需要";
    manLabel.font = UB_S_FONT(13);
    manLabel.textColor = UB_RGBAS(51);
    [thirdView addSubview:manLabel];
    
    //女按钮
    UIButton * womanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    womanBtn.frame = CGRectMake(manBtn.right+AutoWidth(80), AutoHeight(12), AutoHeight(21), AutoHeight(21));
    womanBtn.imageEdgeInsets = UIEdgeInsetsMake(-2, -2, -2, -2);
    [womanBtn setImage:[UIImage imageNamed:@"choose"] forState:UIControlStateSelected];
    [womanBtn setImage:[UIImage imageNamed:@"nochoose"] forState:UIControlStateNormal];
    [thirdView addSubview:womanBtn];
    
    UILabel * womanLabel = [[UILabel alloc]initWithFrame:CGRectMake(womanBtn.right+AutoWidth(10), AutoHeight(0), AutoWidth(60), AutoHeight(44))];
    womanLabel.text = @"不需要";
    womanLabel.font = UB_S_FONT(13);
    womanLabel.textColor = UB_RGBAS(51);
    [thirdView addSubview:womanLabel];
    [self createFourViewWithThirdView:thirdView];
}
- (void)createFourViewWithThirdView:(UIView *)thirdView
{
    UIView * fouthView = [[UIView alloc]initWithFrame:CGRectMake(0, AutoHeight(0)+thirdView.bottom, APP_FRAME_W, AutoHeight(190))];
    fouthView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:fouthView];
    
    UITextView * textView = [[UITextView alloc]initWithFrame:CGRectMake(AutoWidth(10), 0, APP_FRAME_W-AutoWidth(20), AutoHeight(130))];
    textView.placeholder = @"详情";
    textView.font = UB_S_FONT(14);
    [fouthView addSubview:textView];
    
    
    
    
    //以后修改
    UIButton * imgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    imgBtn.frame = CGRectMake(AutoWidth(10), textView.bottom, AutoHeight(51), AutoHeight(51));
    [imgBtn setImage:[UIImage imageNamed:@"paishetu"] forState:UIControlStateNormal];
    [fouthView addSubview:imgBtn];
    
    //男按钮
    UIButton * addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.frame = CGRectMake(AutoWidth(10)+imgBtn.right, textView.bottom, AutoHeight(51), AutoHeight(51));
    [addBtn setBackgroundImage:[UIImage imageNamed:@"addtupian"] forState:UIControlStateNormal];
    [addBtn setTitle:@"拍摄照片" forState:UIControlStateNormal];
    [addBtn setTitleColor:UB_RGBAS(158) forState:UIControlStateNormal];
    addBtn.titleLabel.font = UB_S_FONT(10);
    addBtn.titleEdgeInsets = UIEdgeInsetsMake(25, 0, 0, 0);
    [fouthView addSubview:addBtn];
    
}






- (void)createOrderBtn
{
    UIView * bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, APP_FRAME_H-AutoHeight(118), APP_FRAME_W, AutoHeight(118))];
    bottomView.backgroundColor = UB_RGBAS(246);
    [self.view addSubview:bottomView];
    UIButton * orderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    orderBtn.frame = CGRectMake(AutoWidth(10), AutoHeight(30), APP_FRAME_W-AutoWidth(20), AutoHeight(40));
    [orderBtn setBackgroundImage:[UIImage imageNamed:@"bottombtn"] forState:UIControlStateNormal];
    [orderBtn setTitle:@"发布" forState:UIControlStateNormal];
    [orderBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    orderBtn.titleLabel.font = UB_S_FONT(14);
    [orderBtn addTarget:self action:@selector(orderbtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:orderBtn];
   
}

- (void)orderbtnClick:(UIButton *)sender
{
    NSLog(@"发布");
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
