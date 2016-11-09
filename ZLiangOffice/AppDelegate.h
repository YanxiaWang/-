//
//  AppDelegate.h
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/1.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainPageViewController.h"
#import "LeftSlideViewController.h"
#import "MineViewController.h"
#import "RegisterViewController.h"



@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) LeftSlideViewController * LeftSlideVC;

@property (nonatomic, assign) BOOL loginState;

-(void)initLeftSlideVC;
@end

