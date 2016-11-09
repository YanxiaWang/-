//
//  OrderOnlineViewController.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/7.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "OrderOnlineViewController.h"
#import "UserdDiscountViewController.h"
@interface OrderOnlineViewController ()
{
    UIView * orderView ;
}
@property (nonatomic , strong)UIScrollView * scrollView;
@end

@implementation OrderOnlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    [self CreateSearchBar];
    [self createNavWithOneButtonwithTitle:@"在线选座" inView:self.view withrightImgName:@"" isRight:NO];
    [self createUI];
    
    
}
- (void)createUI
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, AutoHeight(64), APP_FRAME_W, APP_FRAME_H-AutoHeight(64+77))];
    self.scrollView.contentSize  = CGSizeMake(APP_FRAME_W, APP_FRAME_H-AutoHeight(64));
    self.scrollView.backgroundColor = UB_RGBAS(246);
    [self.view addSubview:self.scrollView];
    //预定信息
     [self orderInfo];
    //联系方式
    [self createContactStyle];
    //可用优惠券

    [self createOrderBtn];
    
}
//预定信息
- (void)orderInfo
{
    orderView = [[UIView alloc]initWithFrame:CGRectMake(0, AutoHeight(10), APP_FRAME_W, AutoHeight(212))];
    orderView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:orderView];
    
    NSArray * imgArray = @[@"zuowei",@"renshu",@"chishijian",@"beizhu"];
    NSArray * tipArray = @[@"预约订座",@"就餐人数",@"就餐时间",@""];
    for (int i = 0; i < 4; i ++) {
        UIImageView * leftImgView = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(13)+AutoHeight(44)*i, AutoWidth(17), AutoHeight(18))];
        leftImgView.image = [UIImage imageNamed:imgArray[i]];
        [orderView addSubview:leftImgView];
        //横线
        UILabel * line = [[UILabel alloc]initWithFrame:CGRectMake(0, AutoHeight(43)*(i+1), APP_FRAME_W, AutoHeight(0.5))];
        line.backgroundColor = UB_RGBAS(229);
        [orderView addSubview:line];
        //提示文字
        UILabel * tipLabel = [[UILabel alloc]init];
        tipLabel.textColor = UB_RGBAS(153);
        tipLabel.text = tipArray[i];
        tipLabel.font = UB_S_FONT(14);
        CGFloat  labelwidth = [CMManager kWidthWithStr:tipArray[i] withFont:14];
        tipLabel.frame = CGRectMake(leftImgView.right+AutoWidth(10), AutoHeight(43)*i, labelwidth+AutoWidth(5), AutoHeight(44));
        [orderView addSubview:tipLabel];
        //输入信息
        UITextField * contentTF = [[UITextField alloc]initWithFrame:CGRectMake(tipLabel.right+AutoWidth(10), tipLabel.top, AutoWidth(180), tipLabel.height)];
        contentTF.text = @"haha";
        [orderView addSubview:contentTF];
        
        if (i == 2) {
            UIButton * timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            timeBtn.frame = CGRectMake(APP_FRAME_W-AutoWidth(30), AutoHeight(12)+AutoHeight(44)*i, AutoHeight(20), AutoHeight(20));
            [timeBtn setBackgroundImage:[UIImage imageNamed:@"orderrili"] forState:UIControlStateNormal];
            [orderView addSubview:timeBtn];
        }
        if (i == 3) {
            tipLabel.hidden = YES;
            line.hidden = YES;
            contentTF.hidden = YES;
        }
    }
    UITextView * contentTextView = [[UITextView alloc]initWithFrame:CGRectMake(AutoWidth(33), AutoHeight(135), AutoWidth(255), AutoHeight(75))];
    contentTextView.placeholder = @"备注:如有附加要求,可填写";
    contentTextView.font = UB_S_FONT(14);
//    contentTextView.backgroundColor = [UIColor yellowColor];
    [orderView addSubview:contentTextView];
}
//联系方式
- (void)createContactStyle
{
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, orderView.bottom, APP_FRAME_W, AutoHeight(44))];
    titleLabel.text = @"   联系方式";
    titleLabel.font = UB_S_FONT(15);
    titleLabel.textColor = UB_RGBAS(51);
    [self.scrollView addSubview:titleLabel];
    
    UIView * styleView = [[UIView alloc]initWithFrame:CGRectMake(0, titleLabel.bottom, APP_FRAME_W, AutoHeight(44)*3)];
    styleView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:styleView];
    
    NSArray * imgArray = @[@"renshu",@"orderxingbie",@"ordetelephone"];
    NSArray * tipArray = @[@"联系人",@"性别",@"联系方式"];
    for (int i = 0; i < 3; i ++) {
        UIImageView * leftImgView = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(13)+AutoHeight(44)*i, AutoWidth(18), AutoHeight(18))];
        if (i == 2)
        {
          leftImgView.frame = CGRectMake(AutoWidth(10), AutoHeight(13)+AutoHeight(44)*i, AutoWidth(16), AutoHeight(18));
        }
        leftImgView.image = [UIImage imageNamed:imgArray[i]];
        [styleView addSubview:leftImgView];
        //横线
        UILabel * line = [[UILabel alloc]initWithFrame:CGRectMake(0, AutoHeight(43)*(i+1), APP_FRAME_W, AutoHeight(0.5))];
        line.backgroundColor = UB_RGBAS(229);
        [styleView addSubview:line];
        //提示文字
        UILabel * tipLabel = [[UILabel alloc]init];
        tipLabel.textColor = UB_RGBAS(153);
        tipLabel.text = tipArray[i];
        tipLabel.font = UB_S_FONT(14);
        CGFloat  labelwidth = [CMManager kWidthWithStr:tipArray[i] withFont:14];
        tipLabel.frame = CGRectMake(AutoWidth(40), AutoHeight(43)*i, labelwidth+AutoWidth(5), AutoHeight(44));
        [styleView addSubview:tipLabel];
        //输入信息
        UITextField * contentTF = [[UITextField alloc]initWithFrame:CGRectMake(tipLabel.right+AutoWidth(10), tipLabel.top, AutoWidth(180), tipLabel.height)];
        contentTF.text = @"haha";
        [styleView addSubview:contentTF];
        
        if (i == 1) {
        contentTF.hidden = YES;
       //男按钮
        UIButton * manBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        manBtn.frame = CGRectMake(tipLabel.right+AutoWidth(10), AutoHeight(12)+AutoHeight(44)*i, AutoHeight(20), AutoHeight(20));
        manBtn.imageEdgeInsets = UIEdgeInsetsMake(-2, -2, -2, -2);
        [manBtn setImage:[UIImage imageNamed:@"choose"] forState:UIControlStateSelected];
        [manBtn setImage:[UIImage imageNamed:@"nochoose"] forState:UIControlStateNormal];
        manBtn.selected = YES;
        [styleView addSubview:manBtn];
            
        UILabel * manLabel = [[UILabel alloc]initWithFrame:CGRectMake(manBtn.right+AutoWidth(10), AutoHeight(43)*i, AutoWidth(20), AutoHeight(44))];
        manLabel.text = @"男";
        manLabel.font = UB_S_FONT(14);
        manLabel.textColor = UB_RGBAS(51);
        [styleView addSubview:manLabel];
            
            //女按钮
        UIButton * womanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        womanBtn.frame = CGRectMake(manLabel.right+AutoWidth(20), AutoHeight(12)+AutoHeight(44)*i, AutoHeight(20), AutoHeight(20));
        womanBtn.imageEdgeInsets = UIEdgeInsetsMake(-2, -2, -2, -2);
        [womanBtn setImage:[UIImage imageNamed:@"choose"] forState:UIControlStateSelected];
        [womanBtn setImage:[UIImage imageNamed:@"nochoose"] forState:UIControlStateNormal];
        [styleView addSubview:womanBtn];
        
        UILabel * womanLabel = [[UILabel alloc]initWithFrame:CGRectMake(womanBtn.right+AutoWidth(10), AutoHeight(43)*i, AutoWidth(20), AutoHeight(44))];
        womanLabel.text = @"女";
        womanLabel.font = UB_S_FONT(14);
        womanLabel.textColor = UB_RGBAS(51);
        [styleView addSubview:womanLabel];

        }else if (i == 2)
        {
            line.hidden = YES;
        }
    }
    self.scrollView.contentSize = CGSizeMake(APP_FRAME_W, styleView.bottom);
    [self createDiscountViewwithView:styleView];
    
}
//可用优惠券
- (void)createDiscountViewwithView:(UIView *)lastView
{
    UIView * quanView = [[UIView alloc]initWithFrame:CGRectMake(0, lastView.bottom+AutoWidth(10),APP_FRAME_W, AutoHeight(186))];
    quanView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:quanView];
    
    UILabel * tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), 0, AutoHeight(200), AutoHeight(42))];
    tipLabel.textColor = UB_RGBAS(51);
    tipLabel.text = @"可用优惠券";
    tipLabel.font = UB_S_FONT(15);
    [quanView addSubview:tipLabel];
    
    //箭头
    UIImageView * arrowImg = [[UIImageView alloc]initWithFrame:CGRectMake(APP_FRAME_W-AutoHeight(20), AutoHeight(15), AutoWidth(9), AutoHeight(14))];
    arrowImg.image = [UIImage imageNamed:@"rightarrow"];
    arrowImg.userInteractionEnabled = YES;
    [quanView addSubview:arrowImg];

    
    UIButton * arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    arrowBtn.frame = CGRectMake(APP_FRAME_W-AutoWidth(40), 0, AutoWidth(40), tipLabel.height);
    [arrowBtn addTarget:self action:@selector(moreDiscountClick) forControlEvents:UIControlEventTouchUpInside];
    [quanView addSubview:arrowBtn];
    
    //背景图
    UIImageView * topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10),tipLabel.bottom,APP_FRAME_W-AutoWidth(20), AutoHeight(128))];
    topImgView.image = [UIImage imageNamed:@"bgImg"];
    [quanView addSubview:topImgView];
    //左边图片
    UIImageView * leftImgView = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(38), AutoHeight(15),AutoWidth(90), AutoHeight(90))];
    leftImgView.image = [UIImage imageNamed:@"img1"];
    [topImgView addSubview:leftImgView];
    
    //编号
    UILabel * codeLabel = [CommUtls createLabelWithTitle:@"编号:123456" fontSize:Font_Nine_S textColor:COLOR_WhiteColor];
    codeLabel.textAlignment = NSTextAlignmentCenter;
    codeLabel.frame = CGRectMake(AutoWidth(38), leftImgView.bottom, leftImgView.width, AutoHeight(24));
    [topImgView addSubview:codeLabel];
    
    //标题
    UILabel * titleLabel = [CommUtls createLabelWithTitle:@"美美咖啡厅代金券" fontSize:Font_Fifteen_S textColor:COLOR_WhiteColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.frame = CGRectMake(leftImgView.right+AutoWidth(10), leftImgView.top, AutoWidth(162), AutoHeight(20));
    [topImgView addSubview:titleLabel];
    //消费
    UILabel * spendLabel = [CommUtls createLabelWithTitle:@"无门槛消费" fontSize:Font_Twelve_S textColor:COLOR_WhiteColor];
    spendLabel.textAlignment = NSTextAlignmentLeft;
    spendLabel.frame = CGRectMake(titleLabel.left, titleLabel.bottom+AutoHeight(10), titleLabel.width, AutoHeight(20));
    [topImgView addSubview:spendLabel];
    
    //价格
    UILabel * priceLabel = [CommUtls createLabelWithTitle:@"20" fontSize:Font_TwentyFive_S textColor:COLOR_WhiteColor];
    priceLabel.textAlignment = NSTextAlignmentLeft;
    priceLabel.frame = CGRectMake(titleLabel.left, spendLabel.bottom+AutoHeight(5), leftImgView.width, AutoHeight(35));
    priceLabel.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:40];
    [topImgView addSubview:priceLabel];
    
    //截至时间
    UILabel * timeLabel = [CommUtls createLabelWithTitle:@"截至日期: 2016-09-08" fontSize:Font_Nine_S textColor:COLOR_WhiteColor];
    timeLabel.textAlignment = NSTextAlignmentLeft;
    timeLabel.frame = CGRectMake(titleLabel.left, codeLabel.top, titleLabel.width, codeLabel.height);
    //    timeLabel.center = CGPointMake(codeLabel.right+AutoWidth(64), codeLabel.center.y);
    [topImgView addSubview:timeLabel];
     self.scrollView.contentSize = CGSizeMake(APP_FRAME_W, quanView.bottom);
}
- (void)createOrderBtn
{
    UIView * bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, APP_FRAME_H-AutoHeight(77), APP_FRAME_W, AutoHeight(77))];
    bottomView.backgroundColor = UB_RGBAS(246);
    [self.view addSubview:bottomView];
    UIButton * orderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    orderBtn.frame = CGRectMake(AutoWidth(10), AutoHeight(20), APP_FRAME_W-AutoWidth(20), AutoHeight(40));
    [orderBtn setBackgroundImage:[UIImage imageNamed:@"bottombtn"] forState:UIControlStateNormal];
    [orderBtn setTitle:@"立即预约" forState:UIControlStateNormal];
    [orderBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    orderBtn.titleLabel.font = UB_S_FONT(14);
    [orderBtn addTarget:self action:@selector(orderbtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:orderBtn];
}
- (void)moreDiscountClick
{
    UserdDiscountViewController * usedVC = [[UserdDiscountViewController alloc]init];
    [self.navigationController pushViewController:usedVC animated:YES];
}
- (void)orderbtnClick:(UIButton *)sender
{
    NSLog(@"立即预约");
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
