//
//  RegisterViewController.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/1.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "RegisterViewController.h"
#import "SetInforViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self setNavigationBar];
}
-(void)setNavigationBar{
    UIButton * backBtn = [CommUtls createButtonWithTitle:nil image:@"backBtn" fontSize:nil textColor:nil target:self sel:@selector(backLastPage)];
    [self.view addSubview:backBtn];
    
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(30));
        make.height.mas_equalTo(AutoHeight(20));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(12));
    }];
    
    UILabel * titleLabel = [CommUtls createLabelWithTitle:@"注册账号" fontSize:Font_Eighteen_S textColor:COLOR_WhiteColor];
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

- (void)createUI{
    //1
    UIImageView * loginBack = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loginBack"]];
    loginBack.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:loginBack];
    //2
    UIImageView * loginIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"LoginIcon"]];
    [self.view addSubview:loginIcon];
    
    [loginIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(95));
        make.left.mas_equalTo(self.view).offset(AutoWidth(50));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-50));
        make.height.mas_equalTo(AutoHeight(35));
    }];
    //3
    UILabel * noticeLabel = [CommUtls createLabelWithTitle:@"注：仅限XX大楼内员工使用" fontSize:Font_Twelve_S textColor:COLOR_RedColor];
    [self.view addSubview:noticeLabel];
    
    [noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loginIcon.mas_bottom).offset(AutoHeight(98));
        make.left.mas_equalTo(self.view).offset(AutoWidth(20));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-20));
        make.height.mas_equalTo(AutoHeight(20));
    }];
    //4
    UITextField * companyCode = [CommUtls creatTextFieldWithPlaceHolder:@"公司编码" fontSize:Font_Fifteen_S textColor:COLOR_WhiteColor delegate:nil];
    [companyCode setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [companyCode setValue:Font_Fifteen_S forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:companyCode];
    
    [companyCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loginIcon.mas_bottom).offset(AutoHeight(158));
        make.left.mas_equalTo(self.view).offset(AutoWidth(50));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-50));
        make.height.mas_equalTo(AutoHeight(30));
    }];
    //5
    UIImageView * companyCodeLeft = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"companyCodeLeft"]];
    [self.view addSubview:companyCodeLeft];
    
    [companyCodeLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(companyCode.mas_top).offset(AutoHeight(7));
        make.bottom.mas_equalTo(companyCode.mas_bottom).offset(AutoHeight(-7));
        make.left.mas_equalTo(self.view).offset(AutoWidth(28));
        make.right.mas_equalTo(companyCode.mas_left).offset(AutoWidth(-5));
        }];
    //6
    UIImageView * companyCodeLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"line"]];
    [self.view addSubview:companyCodeLine];
    [companyCodeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(companyCode.mas_bottom).offset(AutoHeight(5));
        make.height.mas_equalTo(AutoHeight(1));
        make.left.mas_equalTo(self.view).offset(AutoWidth(20));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-20));
    }];
    //7
    UITextField * phoneText = [CommUtls creatTextFieldWithPlaceHolder:@"输入您的手机号码" fontSize:Font_Fifteen_S textColor:COLOR_WhiteColor delegate:nil];
    [phoneText setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [phoneText setValue:Font_Fifteen_S forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:phoneText];
    
    [phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(companyCode.mas_bottom).offset(AutoHeight(25));
        make.left.mas_equalTo(self.view).offset(AutoWidth(50));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-50));
        make.height.mas_equalTo(AutoHeight(30));
    }];
    //8
    UIImageView * phoneLeft = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"phoneLeft"]];
    [self.view addSubview:phoneLeft];
    
    [phoneLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneText.mas_top).offset(AutoHeight(5));
        make.bottom.mas_equalTo(phoneText.mas_bottom).offset(AutoHeight(-5));
        make.left.mas_equalTo(self.view).offset(AutoWidth(28));
        make.right.mas_equalTo(phoneText.mas_left).offset(AutoWidth(-5));
    }];
    //9
    UIImageView * phoneLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"line"]];
    [self.view addSubview:phoneLine];
    [phoneLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneText.mas_bottom).offset(AutoHeight(5));
        make.height.mas_equalTo(AutoHeight(1));
        make.left.mas_equalTo(self.view).offset(AutoWidth(20));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-20));
    }];
    //10
    UITextField * securityCode = [CommUtls creatTextFieldWithPlaceHolder:@"输入验证码" fontSize:Font_Fifteen_S textColor:COLOR_WhiteColor delegate:nil];
    [securityCode setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [securityCode setValue:Font_Fifteen_S forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:securityCode];
    
    [securityCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneText.mas_bottom).offset(AutoHeight(25));
        make.left.mas_equalTo(self.view).offset(AutoWidth(50));
        make.width.mas_equalTo(SCREENWIDTH/2-AutoWidth(20));
        make.height.mas_equalTo(AutoHeight(30));
    }];
    //11
    UIImageView * securityCodeLeft = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"securityCodeLeft"]];
    [self.view addSubview:securityCodeLeft];
    
    [securityCodeLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(securityCode.mas_top).offset(AutoHeight(5));
        make.bottom.mas_equalTo(securityCode.mas_bottom).offset(AutoHeight(-5));
        make.left.mas_equalTo(self.view).offset(AutoWidth(28));
        make.right.mas_equalTo(securityCode.mas_left).offset(AutoWidth(-5));
    }];
    //12
    UIImageView * securityCodeRight = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"securityCodeRight"]];
    [self.view addSubview:securityCodeRight];
    
    [securityCodeRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(securityCode.mas_top).offset(AutoHeight(7));
        make.bottom.mas_equalTo(securityCode.mas_bottom).offset(AutoHeight(-7));
        make.left.mas_equalTo(securityCode.mas_right).offset(AutoWidth(5));
        make.width.mas_equalTo(AutoWidth(1));
    }];
    //13
    UIButton * sendCodeBtn = [CommUtls createButtonWithTitle:@"发送验证码" image:nil fontSize:Font_Fifteen_S textColor:[UIColor colorWithRed:0.78 green:0.55 blue:0.43 alpha:1.00] target:self sel:@selector(sendCode)];
    [self.view addSubview:sendCodeBtn];
    
    [sendCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(securityCode.mas_top).offset(AutoHeight(2));
        make.bottom.mas_equalTo(securityCode.mas_bottom).offset(AutoHeight(-2));
        make.left.mas_equalTo(securityCode.mas_right).offset(AutoWidth(15));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-15));
    }];
    //14
    UIImageView * securityCodeLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"line"]];
    [self.view addSubview:securityCodeLine];
    
    [securityCodeLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(securityCode.mas_bottom).offset(AutoHeight(5));
            make.height.mas_equalTo(AutoHeight(1));
            make.left.mas_equalTo(self.view).offset(AutoWidth(20));
            make.right.mas_equalTo(self.view).offset(AutoWidth(-20));
    }];
    //15
    UIImageView * nextStepBack = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loginBtnBack"]];
    nextStepBack.userInteractionEnabled = YES;
    [self.view addSubview:nextStepBack];
    
    [nextStepBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(securityCode.mas_bottom).offset(AutoHeight(40));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
        make.height.mas_equalTo(AutoHeight(70));
    }];
    //16
    UIButton * nextStepBtn = [CommUtls createButtonWithTitle:@"下一步" image:nil fontSize:Font_Fifteen_S textColor:COLOR_WhiteColor target:self sel:@selector(setPersonalInfo)];
    
    [nextStepBack addSubview:nextStepBtn];
    
    [nextStepBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nextStepBack.mas_top);
        make.bottom.mas_equalTo(nextStepBack.mas_bottom);
        make.left.mas_equalTo(nextStepBack.mas_left);
        make.right.mas_equalTo(nextStepBack.mas_right);
    }];
}

-(void)sendCode{
    

}

-(void)setPersonalInfo{
    SetInforViewController * setInfoVC = [[SetInforViewController alloc]init];
    [self.navigationController pushViewController:setInfoVC animated:YES];
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
