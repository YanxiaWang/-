//
//  LoginViewController.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/1.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "LoginViewController.h"
#import "ResetCodeViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = COLOR_WhiteColor;
    
    self.navigationController.navigationBar.hidden = YES;
    
    [self createUI];

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

    UITextField * phoneText = [CommUtls creatTextFieldWithPlaceHolder:@"输入注册时填写的手机号" fontSize:Font_Fifteen_S textColor:COLOR_WhiteColor delegate:nil];
    
    [phoneText setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [phoneText setValue:Font_Fifteen_S forKeyPath:@"_placeholderLabel.font"];
    
    [self.view addSubview:phoneText];

    [phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loginIcon.mas_bottom).offset(AutoHeight(130));
        make.left.mas_equalTo(self.view).offset(AutoWidth(50));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-50));
        make.height.mas_equalTo(AutoHeight(30));
    
        }];
    //4
    UIImageView * phoneLeft = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"phoneLeft"]];
    [self.view addSubview:phoneLeft];
    
    [phoneLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneText.mas_top).offset(AutoHeight(5));
        make.bottom.mas_equalTo(phoneText.mas_bottom).offset(AutoHeight(-5));
        make.left.mas_equalTo(self.view).offset(AutoWidth(28));
        make.right.mas_equalTo(phoneText.mas_left).offset(AutoWidth(-5));
        
    }];
    
    //5
    UITextField * codeText = [CommUtls creatTextFieldWithPlaceHolder:@"输入登录密码" fontSize:Font_Fifteen_S textColor:COLOR_WhiteColor delegate:nil];
    
    [codeText setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [codeText setValue:Font_Fifteen_S forKeyPath:@"_placeholderLabel.font"];
    
    [self.view addSubview:codeText];
    
    [codeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneText.mas_bottom).offset(AutoHeight(25));
        make.left.mas_equalTo(self.view).offset(AutoWidth(50));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-50));
        make.height.mas_equalTo(AutoHeight(30));
    }];
    
    //6
    UIImageView * codeLeft = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"codeLeft"]];
    [self.view addSubview:codeLeft];
    [codeLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(codeText.mas_top).offset(AutoHeight(5));
        make.bottom.mas_equalTo(codeText.mas_bottom).offset(AutoHeight(-5));
        make.left.mas_equalTo(self.view).offset(AutoWidth(28));
        make.right.mas_equalTo(codeText.mas_left).offset(AutoWidth(-5));
    }];
    
    //7
    
    UIButton * codeRight = [CommUtls createButtonWithTitle:nil image:@"codeHidden" fontSize:nil textColor:nil target:self sel:@selector(codeState:)];
    [self.view addSubview:codeRight];
    
    [codeRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(codeText.mas_top).offset(AutoHeight(10));
        make.bottom.mas_equalTo(codeText.mas_bottom).offset(AutoHeight(-10));
        make.left.mas_equalTo(codeText.mas_right).offset(AutoWidth(5));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-25));
    }];
    
    //8
    
    UIButton * registerB = [CommUtls createButtonWithTitle:@"注册" image:nil fontSize:Font_Thirteen_S textColor:COLOR_WhiteColor target:self sel:@selector(gotoRigiseter)];
    
    [self.view addSubview:registerB];
    
    [registerB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(codeText.mas_bottom).offset(AutoWidth(10));
        make.left.mas_equalTo(self.view).offset(AutoWidth(20));
        make.width.mas_equalTo(AutoWidth(45));
        make.height.mas_equalTo(AutoWidth(20));
    }];
    
    //9
    UIButton * forgetCB = [CommUtls createButtonWithTitle:@"忘记密码?" image:nil fontSize:Font_Thirteen_S textColor:COLOR_WhiteColor target:self sel:@selector(resetCode)];
    
    [self.view addSubview:forgetCB];
    
    [forgetCB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(codeText.mas_bottom).offset(AutoHeight(10));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-20));
        make.width.mas_equalTo(AutoWidth(70));
        make.height.mas_equalTo(AutoHeight(20));
        
    }];
    
    //10
    UIImageView * loginBtnBack = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loginBtnBack"]];
    loginBtnBack.userInteractionEnabled = YES;
    [self.view addSubview:loginBtnBack];
    
    [loginBtnBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(registerB.mas_bottom).offset(AutoHeight(40));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
        make.height.mas_equalTo(AutoHeight(70));
    }];
    //11
    UIButton * loginBtn = [CommUtls createButtonWithTitle:@"登录" image:nil fontSize:Font_Fifteen_S textColor:COLOR_WhiteColor target:self sel:@selector(login:)];
    
    [loginBtnBack addSubview:loginBtn];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loginBtnBack.mas_top);
        make.bottom.mas_equalTo(loginBtnBack.mas_bottom);
        make.left.mas_equalTo(loginBtnBack.mas_left);
        make.right.mas_equalTo(loginBtnBack.mas_right);
    }];
    
    //12
    UIImageView * phoneLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"line"]];
    [self.view addSubview:phoneLine];
    [phoneLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneText.mas_bottom).offset(AutoHeight(5));
        make.height.mas_equalTo(AutoHeight(1));
        make.left.mas_equalTo(self.view).offset(AutoWidth(20));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-20));
    }];
    
    //13
    UIImageView * codeLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"line"]];
    [self.view addSubview:codeLine];
    
    [codeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(codeText.mas_bottom).offset(AutoHeight(5));
        make.height.mas_equalTo(AutoHeight(1));
        make.left.mas_equalTo(self.view).offset(AutoWidth(20));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-20));
    }];
    
}

- (void) login:(id)sender{
    
    MainPageViewController *mainVC = [[MainPageViewController alloc] init];
    MineViewController * mineVc = [[MineViewController alloc]init];
    
    self.slider = [[LeftSlideViewController alloc] initWithLeftView:mineVc andMainView:mainVC];
    
    [self.navigationController pushViewController:self.slider animated:YES];
}

- (void)gotoRigiseter
{
    RegisterViewController * registerVC = [[RegisterViewController alloc]init];
    
    [self.navigationController pushViewController:registerVC animated:YES];
}

-(void)resetCode{

    ResetCodeViewController * resetVC = [[ResetCodeViewController alloc]init];
    [self.navigationController pushViewController:resetVC animated:YES];
}




#pragma mark - 密码显示状态

- (void)codeState:(id)sender{
    
    UIButton * codeS  = (UIButton *)sender;
    [codeS setBackgroundImage:[UIImage imageNamed:@"codeVisible"] forState:UIControlStateNormal];
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
