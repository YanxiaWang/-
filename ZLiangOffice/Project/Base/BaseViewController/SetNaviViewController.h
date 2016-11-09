//
//  SetNaviViewController.h
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/4.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetNaviViewController : UIViewController
@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UIView * naviView;

-(void)initNavi;
@end
