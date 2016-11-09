//
//  BaseViewController.h
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/3.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UILabel * titleL;
- (void)createNavWithOneButtonwithTitle:(NSString *)navTitle
                                 inView:(UIView *)view
                       withrightImgName:(NSString *)rightImgName
                                isRight: (BOOL)isRight;
//设置右侧两个按钮
-(void)crateTwoBtnNavwithTitle:(NSString *)titleImg
                        inView:(UIView *)view
                   firstBtnImg:(NSString *)firstBtnName
                  secondBtnImg:(NSString *)secondBtnName;
- (void)initnavigationBar;
- (void)rightAction:(UIButton *)sender;
- (void)popVCAction:(UIButton *)sender;
- (void)searchBtnClick:(UIButton *)sender;
@end
