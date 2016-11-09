//
//  CustomSheetView.m
//  ZLiangOffice
//
//  Created by ZhiDaKe on 2016/11/5.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "CustomSheetView.h"
CustomSheetView *bG_View = nil;
CGFloat content_ViewHeight = 0;
UIView*content_View = nil;

@implementation CustomSheetView

+(void)showCustomSheetView{

    bG_View = [[CustomSheetView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bG_View.backgroundColor = [UIColor blackColor];
    bG_View.alpha = 0.4;
    [[[UIApplication sharedApplication].delegate window] addSubview:bG_View];

//    UITapGestureRecognizer*tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidden)];
//    [bG_View addGestureRecognizer:tap];
    
    content_ViewHeight = SCREENHEIGHT*(1.f/3.f);
    content_View = [[UIView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, content_ViewHeight)];
    content_View.backgroundColor = [UIColor whiteColor];
    [[[UIApplication sharedApplication].delegate window] addSubview:content_View];
    UIColor * backC = UB_RGB(153, 153, 153);
    content_View.backgroundColor = backC;
    [CustomSheetView initShareBtn];
    [CustomSheetView show];
}

+(void)initShareBtn{
    UIView * shareBtnBack = [[UIView alloc]init];
    
    [content_View addSubview:shareBtnBack];
    shareBtnBack.backgroundColor = COLOR_WhiteColor;
    [shareBtnBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(content_View).offset(AutoHeight(10));
        make.height.mas_equalTo(AutoHeight(120));
        make.left.mas_equalTo(content_View).offset(AutoWidth(10));
        make.right.mas_equalTo(content_View).offset(AutoWidth(-10));
    }];
    UILabel * label = [CommUtls createLabelWithTitle:@"分享到" fontSize:Font_Fifteen_S textColor:COLOR_BlackColor];
    label.textAlignment = NSTextAlignmentCenter;
    [shareBtnBack addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(shareBtnBack).offset(AutoHeight(10));
        make.height.mas_equalTo(AutoHeight(20));
        make.left.mas_equalTo(shareBtnBack).offset(AutoWidth(50));
        make.right.mas_equalTo(shareBtnBack).offset(AutoWidth(-50));
    }];

    NSArray * array = @[@"QQ",@"微信好友",@"微博好友"];
    NSArray * imageArr = @[@"qqBtn",@"weChatBtn",@"blogBtn"];
    for (int i = 0; i<array.count; i++)
    {
        UIView * shareView = [[UIView alloc]initWithFrame:CGRectMake((SCREENWIDTH-AutoWidth(20))*i/3,AutoHeight(30), (SCREENWIDTH-AutoWidth(20))/3, AutoHeight(90))];
        shareView.backgroundColor = COLOR_WhiteColor;
        shareView.userInteractionEnabled = YES;
        [shareBtnBack addSubview:shareView];
        UIButton * shareBtn = [CommUtls createButtonWithTitle:nil image:imageArr[i] fontSize:nil textColor:nil target:self sel:nil];
        shareBtn.tag = i+1;
        shareBtn.backgroundColor = COLOR_WhiteColor;
        [shareView addSubview:shareBtn];
        [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(shareView).offset(AutoHeight(15));
            make.height.mas_equalTo(AutoHeight(30));
            make.left.mas_equalTo(shareView).offset(AutoWidth(36));
            make.right.mas_equalTo(shareView).offset(-AutoWidth(36));
        }];
        
        
        UILabel * shareLabel = [CommUtls createLabelWithTitle:array[i] fontSize:Font_Eleven_S textColor:COLOR_BlackColor];
        shareLabel.backgroundColor = COLOR_WhiteColor;
        shareLabel.textAlignment = NSTextAlignmentCenter;

        [shareView addSubview:shareLabel];
        
        [shareLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(shareBtn.mas_bottom).offset(AutoHeight(5));
            make.height.mas_equalTo(AutoHeight(30));
            make.left.mas_equalTo(shareView).offset(AutoWidth(5));
            make.right.mas_equalTo(shareView).offset(-AutoWidth(5));
        }];
    }
    //取消按钮
    
    
    UIButton * cancelBtn = [CommUtls createButtonWithTitle:@"取消" image:nil fontSize:Font_Fifteen_S textColor:COLOR_BlackColor target:self sel:@selector(hidden)];
    cancelBtn.backgroundColor = COLOR_WhiteColor;
    [content_View addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(shareBtnBack.mas_bottom).offset(AutoHeight(10));
        make.height.mas_equalTo(AutoHeight(40));
        make.left.mas_equalTo(content_View).offset(AutoWidth(10));
        make.right.mas_equalTo(content_View).offset(-AutoWidth(10));
    }];
    UITapGestureRecognizer*tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidden)];
    [cancelBtn addGestureRecognizer:tap];
    
    
    
}

-(void)functionBtnClicked:(id)sender{
    UIButton * zjscBtn = (UIButton *)sender;
    if (zjscBtn.tag == 5) {
        
    }
    NSLog(@"1111111");
}


+(void)show
{
    [UIView animateWithDuration:0.1 animations:^{
        content_View.frame = CGRectMake(0, SCREENHEIGHT-content_ViewHeight, SCREENWIDTH, content_ViewHeight);
    } completion:nil];
}
+(void)hidden
{
//    [UIView animateWithDuration:0.5 animations:^{
//        content_View.frame = CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, content_ViewHeight);
//    } completion:^(BOOL finished) {
//        [bG_View removeFromSuperview];
//        [content_View removeFromSuperview];
//        bG_View=nil;
//        content_View=nil;
//    }];
    [UIView animateWithDuration:0.1 animations:^{
        content_View.frame = CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, content_ViewHeight);
        [bG_View removeFromSuperview];
        [content_View removeFromSuperview];
        bG_View=nil;
        content_View=nil;
    } completion:nil];

}

@end
