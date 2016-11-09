//
//  SetNaviViewController.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/4.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "SetNaviViewController.h"

@interface SetNaviViewController ()

@end

@implementation SetNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_WhiteColor;
    [self initNavi];
}

-(void)initNavi{
    _naviView = [[UIView alloc]init];
    _naviView.userInteractionEnabled = YES;
    _naviView.backgroundColor = COLOR_WhiteColor;
    [self.view addSubview:_naviView];
    
    
    [_naviView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view);
        make.height.mas_equalTo(AutoHeight(64));
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
    }];
    
    UIButton * backBtn = [CommUtls createButtonWithTitle:nil image:@"navi-Back" fontSize:nil textColor:nil target:self sel:@selector(backLastPage)];
    [_naviView addSubview:backBtn];
    
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(25));
        make.height.mas_equalTo(AutoHeight(30));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(12));
    }];
    
    _titleLabel = [CommUtls createLabelWithTitle:@"nil" fontSize:Font_Eighteen_S textColor:COLOR_BlackColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [_naviView addSubview:_titleLabel];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.tabBarController.tabBar.hidden = NO;
    
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
