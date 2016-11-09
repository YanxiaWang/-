//
//  MainViewController.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/3.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "MainViewController.h"
#import "RDVTabBar.h"
#import "RDVTabBarItem.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupControllers];
}

-(void)setupControllers{
    
    HomePageViewController * homePage = [[HomePageViewController alloc]init];
    ServiceViewController * service = [[ServiceViewController alloc]init];
    SmartCommunityViewController * smart = [[SmartCommunityViewController alloc]init];
    CircleViewController * circle = [[CircleViewController alloc]init];
    YKHViewController * ykh = [[YKHViewController alloc]init];
    
    UINavigationController *homeNavi = [[UINavigationController alloc]initWithRootViewController:homePage];
    UINavigationController *serviceNavi = [[UINavigationController alloc]initWithRootViewController:service];
    UINavigationController *smartNavi = [[UINavigationController alloc]initWithRootViewController:smart];
    UINavigationController *circleNavi = [[UINavigationController alloc]initWithRootViewController:circle];
    UINavigationController *ykhNavi = [[UINavigationController alloc]initWithRootViewController:ykh];
    [self setViewControllers:@[homeNavi, serviceNavi,smartNavi,circleNavi,ykhNavi]];
    [self customizeTabBarForController:self];

}
-(void)customizeTabBarForController:(RDVTabBarController *)tabBarController{
    self.tabBar.frame = CGRectMake(0, 0, SCREENWIDTH, 68);
    self.tabBar.backgroundColor = [UIColor clearColor];
    // 选中图片数组
    NSArray *tabBarSelectImages = @[@"TabBarHome_select", @"TabBarService_select", @"TabBarCommunity_select",@"TabBarCircle_select",@"TabBarYKH_select"];
    
    // 未选中图片数组
    NSArray *tabBarUnSelectImages = @[@"TabBarHome_unselect", @"TabBarService_unselect", @"TabBarCommunity_unselect",@"TabBarCircle_unselect",@"TabBarYKH_unselect"];
    
    // 文字标题
    NSArray *titles = @[@"首页",@"服务",@"智能社区",@"圈子",@"悦客会"];
    // 选中背景图片
    UIImage *tabbar_selectBackgroundImage = [UIImage imageNamed:@"tabbar_backgroundImage"];
    
    // 未选中背景图片
    UIImage *tabbar_unSelectBackgroundImage = [UIImage imageNamed:@"tabbar_backgroundImage"];
    
    NSDictionary *textAttributes_unSelect = nil;
    NSDictionary *textAttributes_select = nil;
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        // 未选中文字颜色
        textAttributes_unSelect = @{
                                    NSFontAttributeName: [UIFont systemFontOfSize:11],
                                    NSForegroundColorAttributeName: [CommUtls colorWithHexString:@"#666666"],
                                    };
        // 选中文字颜色
        textAttributes_select = @{
                                  NSFontAttributeName: [UIFont systemFontOfSize:11],
                                  NSForegroundColorAttributeName: COLOR_OrangeColor,
                                  };
    }
    
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        
        // 设置未选中文字
        item.unselectedTitleAttributes = textAttributes_unSelect;
        // 设置选中文字
        item.selectedTitleAttributes = textAttributes_select;
        
        // 设置背景图片
        [item setBackgroundSelectedImage:tabbar_selectBackgroundImage withUnselectedImage:tabbar_unSelectBackgroundImage];
        
        // 设置选中图片
        UIImage *selectedImage = [UIImage imageNamed:[tabBarSelectImages objectAtIndex:index]];
        UIImage *unSelectedImage = [UIImage imageNamed:[tabBarUnSelectImages objectAtIndex:index]];
        [item setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:unSelectedImage];
        item.title = titles[index];
        
        // 设置图片和文字间距
        item.titlePositionAdjustment = UIOffsetMake(0, 4);
        index++;
    }
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
