//
//  ResetCodeViewController.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/2.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "ResetCodeViewController.h"

@interface ResetCodeViewController ()

@end

@implementation ResetCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}
-(void)createUI{
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
    UILabel * noticeLabel = [CommUtls createLabelWithTitle:@"请填写注册时使用的手机号码" fontSize:Font_Twelve_S textColor:COLOR_RedColor];
    [self.view addSubview:noticeLabel];
    
    [noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loginIcon.mas_bottom).offset(AutoHeight(98));
        make.left.mas_equalTo(self.view).offset(AutoWidth(20));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-20));
        make.height.mas_equalTo(AutoHeight(20));
    }];
    //4
    UITextField * phoneText = [CommUtls creatTextFieldWithPlaceHolder:@"手机号码" fontSize:Font_Fifteen_S textColor:COLOR_WhiteColor delegate:nil];
    [phoneText setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [phoneText setValue:Font_Fifteen_S forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:phoneText];
    
    [phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loginIcon.mas_bottom).offset(AutoHeight(158));
        make.left.mas_equalTo(self.view).offset(AutoWidth(50));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-50));
        make.height.mas_equalTo(AutoHeight(30));
    }];
    //5
    UIImageView * phoneLeft = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"phoneLeft"]];
    [self.view addSubview:phoneLeft];
    
    [phoneLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneText.mas_top).offset(AutoHeight(7));
        make.bottom.mas_equalTo(phoneText.mas_bottom).offset(AutoHeight(-7));
        make.left.mas_equalTo(self.view).offset(AutoWidth(28));
        make.right.mas_equalTo(phoneText.mas_left).offset(AutoWidth(-5));
    }];
    //6
    UIImageView * phoneLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"line"]];
    [self.view addSubview:phoneLine];
    [phoneLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneText.mas_bottom).offset(AutoHeight(5));
        make.height.mas_equalTo(AutoHeight(1));
        make.left.mas_equalTo(self.view).offset(AutoWidth(20));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-20));
    }];
    //7
    UITextField * securityCode = [CommUtls creatTextFieldWithPlaceHolder:@"验证码" fontSize:Font_Fifteen_S textColor:COLOR_WhiteColor delegate:nil];
    [securityCode setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [securityCode setValue:Font_Fifteen_S forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:securityCode];
    
    [securityCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneText.mas_bottom).offset(AutoHeight(25));
        make.left.mas_equalTo(self.view).offset(AutoWidth(50));
        make.width.mas_equalTo(SCREENWIDTH/2-AutoWidth(20));
        make.height.mas_equalTo(AutoHeight(30));
    }];
    //8
    UIImageView * securityCodeLeft = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"securityCodeLeft"]];
    [self.view addSubview:securityCodeLeft];
    
    [securityCodeLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(securityCode.mas_top).offset(AutoHeight(5));
        make.bottom.mas_equalTo(securityCode.mas_bottom).offset(AutoHeight(-5));
        make.left.mas_equalTo(self.view).offset(AutoWidth(28));
        make.right.mas_equalTo(securityCode.mas_left).offset(AutoWidth(-5));
    }];
    //9
    UIImageView * securityCodeRight = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"securityCodeRight"]];
    [self.view addSubview:securityCodeRight];
    
    [securityCodeRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(securityCode.mas_top).offset(AutoHeight(7));
        make.bottom.mas_equalTo(securityCode.mas_bottom).offset(AutoHeight(-7));
        make.left.mas_equalTo(securityCode.mas_right).offset(AutoWidth(5));
        make.width.mas_equalTo(AutoWidth(1));
    }];

    //10
    UIButton * sendCodeBtn = [CommUtls createButtonWithTitle:@"获取验证码" image:nil fontSize:Font_Fifteen_S textColor:[UIColor colorWithRed:0.78 green:0.55 blue:0.43 alpha:1.00] target:self sel:@selector(sendCode)];
    [self.view addSubview:sendCodeBtn];
    
    [sendCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(securityCode.mas_top).offset(AutoHeight(2));
        make.bottom.mas_equalTo(securityCode.mas_bottom).offset(AutoHeight(-2));
        make.left.mas_equalTo(securityCode.mas_right).offset(AutoWidth(15));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-15));
    }];

    //11
    UIImageView * securityCodeLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"line"]];
    [self.view addSubview:securityCodeLine];
    [securityCodeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(securityCode.mas_bottom).offset(AutoHeight(5));
        make.height.mas_equalTo(AutoHeight(1));
        make.left.mas_equalTo(self.view).offset(AutoWidth(20));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-20));
    }];
    //10
    UITextField * newCode = [CommUtls creatTextFieldWithPlaceHolder:@"新密码" fontSize:Font_Fifteen_S textColor:COLOR_WhiteColor delegate:nil];
    [newCode setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [newCode setValue:Font_Fifteen_S forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:newCode];
    
    [newCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(securityCode.mas_bottom).offset(AutoHeight(25));
        make.left.mas_equalTo(self.view).offset(AutoWidth(50));
        make.width.mas_equalTo(SCREENWIDTH/2-AutoWidth(20));
        make.height.mas_equalTo(AutoHeight(30));
    }];
    //11
    UIImageView * newCodeLeft = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"codeLeft"]];
    [self.view addSubview:newCodeLeft];
    
    [newCodeLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(newCode.mas_top).offset(AutoHeight(5));
        make.bottom.mas_equalTo(newCode.mas_bottom).offset(AutoHeight(-5));
        make.left.mas_equalTo(self.view).offset(AutoWidth(28));
        make.right.mas_equalTo(newCode.mas_left).offset(AutoWidth(-5));
    }];

    //12
    UIImageView * newCodeLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"line"]];
    [self.view addSubview:newCodeLine];
    
    [newCodeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(newCode.mas_bottom).offset(AutoHeight(5));
        make.height.mas_equalTo(AutoHeight(1));
        make.left.mas_equalTo(self.view).offset(AutoWidth(20));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-20));
    }];
    //13
    UIImageView * submitBack = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loginBtnBack"]];
    submitBack.userInteractionEnabled = YES;
    [self.view addSubview:submitBack];
    
    [submitBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(newCode.mas_bottom).offset(AutoHeight(40));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
        make.height.mas_equalTo(AutoHeight(70));
    }];
    //14
    UIButton * submitBtn = [CommUtls createButtonWithTitle:@"下一步" image:nil fontSize:Font_Fifteen_S textColor:COLOR_WhiteColor target:self sel:@selector(submitPersonalInfo)];
    
    [submitBack addSubview:submitBtn];
    
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(submitBack.mas_top);
        make.bottom.mas_equalTo(submitBack.mas_bottom);
        make.left.mas_equalTo(submitBack.mas_left);
        make.right.mas_equalTo(submitBack.mas_right);
    }];
}

-(void)sendCode{


}

-(void)submitPersonalInfo{

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
