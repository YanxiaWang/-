//
//  ADImageViewController.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/4.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "ADImageViewController.h"

@interface ADImageViewController ()

@end

@implementation ADImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_WhiteColor;
    self.titleLabel.text = @"广告详情";
    
    UILabel * label = [CommUtls createLabelWithTitle:@"这是一个web页面" fontSize:Font_Fifteen_S textColor:COLOR_BlackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(0, 100, SCREENWIDTH, 100);
    [self.view addSubview:label];
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
