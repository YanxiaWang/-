//
//  SignRulesViewController.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/7.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "SignRulesViewController.h"

@interface SignRulesViewController ()

@end

@implementation SignRulesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UB_RGBA(0.96, 0.96, 0.96, 1.00);
    self.titleLabel.text = @"签到规则";
    [self createUI];
}

-(void)createUI{
    
    UIView * view1 = [[UIView alloc]init];
    [self.view addSubview:view1];
    view1.backgroundColor = COLOR_WhiteColor;
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(74));
        make.height.mas_equalTo(AutoHeight(230));
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
    }];
    
    
    UILabel * signRuleT = [CommUtls createLabelWithTitle:@"签到规则" fontSize:Font_Fourteen_S textColor:COLOR_BlackColor];
    [view1 addSubview:signRuleT];

    [signRuleT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view1);
        make.height.mas_equalTo(AutoHeight(30));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
    }];
    
    UILabel * signRule = [CommUtls createLabelWithTitle:@"签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则签到规则" fontSize:Font_Twelve_S textColor:UB_RGBA(0.78, 0.78, 0.78, 1.00)];
    signRule.numberOfLines = 0;
    [view1 addSubview:signRule];

    [signRule mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(signRuleT.mas_bottom);
        make.height.mas_equalTo(AutoHeight(160));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
    }];
    UIView * view2 = [[UIView alloc]init];
    [self.view addSubview:view2];
    view2.backgroundColor = COLOR_WhiteColor;
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view1.mas_bottom).offset(AutoHeight(10));
        make.height.mas_equalTo(AutoHeight(230));
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
    }];

    
    UILabel * signIntegralT = [CommUtls createLabelWithTitle:@"积分规则" fontSize:Font_Fourteen_S textColor:COLOR_BlackColor];
    [view2 addSubview:signIntegralT];
    
    [signIntegralT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view2);
        make.height.mas_equalTo(AutoHeight(30));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
    }];
    
    UILabel * signIntegral = [CommUtls createLabelWithTitle:@"积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则积分规则" fontSize:Font_Twelve_S textColor:UB_RGBA(0.78, 0.78, 0.78, 1.00)];
    signRule.numberOfLines = 0;
    [view2 addSubview:signIntegral];
    
    [signIntegral mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(signIntegralT.mas_bottom);
        make.height.mas_equalTo(AutoHeight(140));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
    }];


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
