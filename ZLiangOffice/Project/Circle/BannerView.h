//
//  BannerView.h
//  MHProject
//
//  Created by 董駸 on 15/8/25.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//
//    使用方法
//    BannerView *banner = [[BannerView alloc]initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, 143)];
//    banner.banImageArray = self.banImageArray;
//    banner.delegate = self;
//    [self.view addSubview:banner];
//    调用代理方法来区别点击图片

#import <UIKit/UIKit.h>

@protocol BannerTouchDelegate <NSObject>

//点击图片代理方法
- (void)bannerImageTouch:(NSInteger)tag;

@end

@interface BannerView : UIView <UIScrollViewDelegate>

@property (strong,nonatomic) UIScrollView *bannerScrollView;

@property (strong,nonatomic) NSArray *banImageArray;

@property (strong,nonatomic) UIPageControl *myPageCtrl;

@property (strong,nonatomic) NSTimer *timer;

@property (assign,nonatomic) BOOL hidePageCtrl;

@property (strong,nonatomic) id <BannerTouchDelegate> delegate;

@end
