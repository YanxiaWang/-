//
//  ADViewController.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/4.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "ADViewController.h"
#import "CustomSheetView.h"

@interface ADViewController ()

@end

@implementation ADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_WhiteColor;
    self.titleLabel.text = @"咨询详情";
    [self adShareBtn];
    //这里是一个h5
    [self adContent];
}

-(void)adShareBtn{
    UIButton * shareBtn = [CommUtls createButtonWithTitle:nil image:@"shareBtn" fontSize:nil textColor:nil target:self sel:@selector(shareAD)];
    [self.naviView addSubview:shareBtn];
    
    [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(30));
        make.height.mas_equalTo(AutoHeight(20));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
        make.width.mas_equalTo(AutoWidth(18));
    }];
}


- (void)adContent{
    //这里是一个h5
    UIImageView * imageWeb = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"adWeb"]];
    imageWeb.frame = CGRectMake(0, 100, SCREENWIDTH, 200);
    [self.view addSubview:imageWeb];

}

-(void)shareAD{

    
    [CustomSheetView showCustomSheetView];



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
