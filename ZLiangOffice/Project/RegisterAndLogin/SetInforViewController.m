//
//  SetInforViewController.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/2.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "SetInforViewController.h"

@interface SetInforViewController ()

@end

@implementation SetInforViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.95 green:0.96 blue:0.96 alpha:1.00];
    [self createUI];
    
    [self setNavigationBar];
}

-(void)createUI{
    
    UITextField * setNameText = [CommUtls creatTextFieldWithPlaceHolder:@"   填写真实姓名" fontSize:Font_Fifteen_S textColor:COLOR_BlackColor delegate:nil];
    setNameText.backgroundColor = COLOR_WhiteColor;
    UIColor * placeHolderC = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.00];
    [setNameText setValue:placeHolderC forKeyPath:@"_placeholderLabel.textColor"];
    [setNameText setValue:Font_Fourteen_S forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:setNameText];
    
    [setNameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(80));
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.height.mas_equalTo(AutoHeight(45));
    }];
    
    UITextField * setCodeText = [CommUtls creatTextFieldWithPlaceHolder:@"   设置6~12位登录密码" fontSize:Font_Fifteen_S textColor:COLOR_BlackColor delegate:nil];
    setCodeText.backgroundColor = COLOR_WhiteColor;
    [setCodeText setValue:placeHolderC forKeyPath:@"_placeholderLabel.textColor"];
    [setCodeText setValue:Font_Fourteen_S forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:setCodeText];
    
    [setCodeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(setNameText.mas_bottom).offset(AutoHeight(10));
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.height.mas_equalTo(AutoHeight(45));
    }];
    UITextField * resetCodeText = [CommUtls creatTextFieldWithPlaceHolder:@"   填写真实姓名" fontSize:Font_Fifteen_S textColor:COLOR_BlackColor delegate:nil];
    resetCodeText.backgroundColor = COLOR_WhiteColor;
    [resetCodeText setValue:placeHolderC forKeyPath:@"_placeholderLabel.textColor"];
    [resetCodeText setValue:Font_Fourteen_S forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:resetCodeText];
    
    [resetCodeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(setCodeText.mas_bottom).offset(AutoHeight(10));
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.height.mas_equalTo(AutoHeight(45));
    }];
    
    UIImageView * confirmBtnBack = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loginBtnBack"]];
    confirmBtnBack.userInteractionEnabled = YES;
    [self.view addSubview:confirmBtnBack];
    
    [confirmBtnBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(resetCodeText.mas_bottom).offset(AutoHeight(40));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
        make.height.mas_equalTo(AutoHeight(70));
    }];

    UIButton * confirmBtn = [CommUtls createButtonWithTitle:@"确定" image:nil fontSize:Font_Fifteen_S textColor:COLOR_WhiteColor target:self sel:@selector(registerConfirm)];
    
    [confirmBtnBack addSubview:confirmBtn];
    
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(confirmBtnBack);
        make.bottom.mas_equalTo(confirmBtnBack);
        make.left.mas_equalTo(confirmBtnBack);
        make.right.mas_equalTo(confirmBtnBack);
    }];
}

-(void)registerConfirm{

    [self.navigationController popToRootViewControllerAnimated:YES];

}



-(void)setNavigationBar{
    UIView * naviView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 64)];
    naviView.backgroundColor = COLOR_WhiteColor;
    [self.view addSubview:naviView];
    UIColor * color = [UIColor colorWithRed:0.45 green:0.45 blue:0.45 alpha:1.00];
    UIButton * backBtn = [CommUtls createButtonWithTitle:nil image:@"backBtn" fontSize:nil textColor:nil target:self sel:@selector(backLastPage)];
    [self.view addSubview:backBtn];
    
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(30));
        make.height.mas_equalTo(AutoHeight(20));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(12));
    }];
    UILabel * titleLabel = [CommUtls createLabelWithTitle:@"注册信息" fontSize:Font_Eighteen_S textColor:color];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(30));
        make.height.mas_equalTo(AutoHeight(20));
        make.left.mas_equalTo(self.view).offset(AutoWidth(100));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-100));
    }];
}

-(void)backLastPage{
    
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
