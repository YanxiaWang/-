//
//  BannerView.m
//  MHProject
//
//  Created by 董駸 on 15/8/25.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#import "BannerView.h"
#import "UIImageView+DWebCache.h"

@implementation BannerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *back = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, self.frame.size.height)];
        [self addSubview:back];
        
//        if (self.banImageArray.count == 1) {
//            UIImageView * imgaview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, self.frame.size.height)];
//            imgaview
//        }
        
        //banner定义
        self.bannerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, self.frame.size.height)];
        self.bannerScrollView.delegate = self;
        self.bannerScrollView.showsHorizontalScrollIndicator = NO;
        self.bannerScrollView.backgroundColor = [UIColor lightGrayColor];
        self.bannerScrollView.pagingEnabled = YES;
        self.bannerScrollView.scrollsToTop = NO;
        [back addSubview:self.bannerScrollView];
        
        //pageCtrl定义
        self.myPageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 78, 36)];
        self.myPageCtrl.center = CGPointMake([[UIScreen mainScreen] bounds].size.width / 2, self.bannerScrollView.frame.size.height - 11);
        [self.myPageCtrl.layer setCornerRadius:8];//设置圆角
        self.myPageCtrl.currentPage = 0;
        self.myPageCtrl.enabled = YES;
        self.myPageCtrl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
        self.myPageCtrl.pageIndicatorTintColor = [UIColor colorWithRed:0.77 green:0.76 blue:0.77 alpha:1];
        self.myPageCtrl.userInteractionEnabled = NO;
        self.myPageCtrl.hidesForSinglePage = YES;
        [self.myPageCtrl addTarget:self action:@selector(pageClick:) forControlEvents:UIControlEventValueChanged];
        [back addSubview:self.myPageCtrl];
    }
    return self;
}

- (void)setBanImageArray:(NSArray *)banImageArray
{
    _banImageArray = banImageArray;
    
    UIImageView *firstImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, self.frame.size.height)];
    firstImage.userInteractionEnabled = YES;
    firstImage.tag = 0;
    [firstImage addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bannerImageClick:)]];
    //placeholder 是默认占位图 请按实际情况修改//
    [firstImage setImageURLStr:[banImageArray lastObject] placeholder:[UIImage imageNamed:@"banner"]];
    [self.bannerScrollView addSubview:firstImage];
    
    //banner添加图片
    for (int i = 0; i < banImageArray.count; i++) {
        UIImageView *bannerImage = [[UIImageView alloc]initWithFrame:CGRectMake(0 + (i + 1) * [[UIScreen mainScreen] bounds].size.width, 0, [[UIScreen mainScreen] bounds].size.width, self.frame.size.height)];
        bannerImage.userInteractionEnabled = YES;
        bannerImage.tag = i;
        [bannerImage addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bannerImageClick:)]];
        [bannerImage setImageURLStr:[banImageArray objectAtIndex:i] placeholder:[UIImage imageNamed:@"banner"]];
        [self.bannerScrollView addSubview:bannerImage];
    }
    
    UIImageView *lastImage = [[UIImageView alloc]initWithFrame:CGRectMake(0 + (self.banImageArray.count + 1) * [[UIScreen mainScreen] bounds].size.width, 0, [[UIScreen mainScreen] bounds].size.width, self.frame.size.height)];
    lastImage.userInteractionEnabled = YES;
    lastImage.tag = banImageArray.count - 1;
    [lastImage addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bannerImageClick:)]];
    [lastImage setImageURLStr:[banImageArray firstObject] placeholder:[UIImage imageNamed:@"banner"]];
    [self.bannerScrollView addSubview:lastImage];
    
    self.bannerScrollView.contentSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width * (banImageArray.count + 2), self.frame.size.height);
    [self.bannerScrollView scrollRectToVisible:CGRectMake([[UIScreen mainScreen] bounds].size.width, 0, [[UIScreen mainScreen] bounds].size.width, self.frame.size.height) animated:NO];
    if (self.banImageArray.count == 1)
    {
        self.bannerScrollView.scrollEnabled     = NO;
    }
    else
    {
        //定时器定义
        self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(scrollToNextPage:) userInfo:nil repeats:YES];
    }
   
    
    self.myPageCtrl.numberOfPages = banImageArray.count;
}

- (void)setHidePageCtrl:(BOOL)hidePageCtrl
{
    self.myPageCtrl.hidden = hidePageCtrl;
}

- (void)pageClick:(UIPageControl *)pageControl
{
    NSInteger pageNum = pageControl.currentPage;
    CGSize viewSize = self.bannerScrollView.frame.size;
    [self.bannerScrollView setContentOffset:CGPointMake((pageNum) * viewSize.width, 0) animated:YES];
    [self.timer invalidate];
}

-(void)scrollToNextPage:(id)sender
{
    NSInteger pageNum = self.myPageCtrl.currentPage;
    //    LogRed(@"%ld",(long)pageNum);
    CGSize viewSize = self.bannerScrollView.frame.size;
    [self.bannerScrollView setContentOffset:CGPointMake((pageNum + 2) * viewSize.width, 0) animated:YES];
    pageNum++;
    
    //    NSInteger pageNum = self.myPageCtrl.currentPage;
    //    CGSize viewSize = self.bannerScrollView.frame.size;
    //    CGRect rect = CGRectMake((pageNum + 2) * viewSize.width, 0, viewSize.width, viewSize.height);
    //    [self.bannerScrollView scrollRectToVisible:rect animated:YES];
    //    pageNum++;
    //    if (pageNum == self.banImageArray.count)
    //    {
    //        CGRect newRect = CGRectMake(viewSize.width, 0, viewSize.width, viewSize.height);
    //        [self.bannerScrollView scrollRectToVisible:newRect animated:YES];
    //    }
    if(pageNum == self.banImageArray.count)
    {
        [self performSelector:@selector(delayMethod) withObject:nil afterDelay:0.3f];
        return;
    }
}

- (void)delayMethod
{
    self.myPageCtrl.currentPage = 0;
    
    CGFloat pageWidth = self.bannerScrollView.frame.size.width;
    CGFloat pageHeigth = self.bannerScrollView.frame.size.height;
    [self.bannerScrollView scrollRectToVisible:CGRectMake(pageWidth, 0, pageWidth, pageHeigth) animated:NO];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.bannerScrollView.frame.size.width;
    int currentPage = floor((self.bannerScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    if (currentPage == 0)
    {
        self.myPageCtrl.currentPage = self.banImageArray.count - 1;
    }
    else if(currentPage == self.banImageArray.count + 1)
    {
        self.myPageCtrl.currentPage = 0;
    }
    self.myPageCtrl.currentPage = currentPage - 1;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //定时器暂停
    [self.timer invalidate];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //定时器继续
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(scrollToNextPage:) userInfo:nil repeats:YES];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.bannerScrollView.frame.size.width;
    CGFloat pageHeigth = self.bannerScrollView.frame.size.height;
    int currentPage = floor((self.bannerScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    if (currentPage == 0)
    {
        [self.bannerScrollView scrollRectToVisible:CGRectMake(pageWidth * self.banImageArray.count, 0, pageWidth, pageHeigth) animated:NO];
        self.myPageCtrl.currentPage = self.banImageArray.count - 1;
        return;
    }
    else if(currentPage == self.banImageArray.count + 1)
    {
        [self.bannerScrollView scrollRectToVisible:CGRectMake(pageWidth, 0, pageWidth, pageHeigth) animated:NO];
        self.myPageCtrl.currentPage = 0;
        return;
    }
    self.myPageCtrl.currentPage = currentPage - 1;
}

- (void)bannerImageClick:(UITapGestureRecognizer *)tap
{
    [self.delegate bannerImageTouch:tap.view.tag];
}

- (void)dealloc
{
    [self.timer invalidate];
    self.timer = nil;
}

@end
