//
//  SignViewController.m
//  ZLiangOffice
//
//  Created by ZhiDaKe on 2016/11/6.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "SignViewController.h"
#import "SignRulesViewController.h"

@interface SignViewController ()
//请求的数据

@end

@implementation SignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"签到";
    self.view.backgroundColor = UB_RGB(246, 246, 246);
    [self createUI];

}

- (void)createUI{
    UIImageView * signHeader = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"signHeader"]];
    [self.view addSubview:signHeader];
    
    [signHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(80));
        make.height.mas_equalTo(AutoHeight(320));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-5));
        make.left.mas_equalTo(self.view).offset(AutoWidth(5));
    }];
    //日期

//    NSArray * arrWeek=[NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六", nil];
//    NSDate *date  = [NSDate date];
//    NSDateFormatter *Yearformater = [NSDateFormatter new];
//    Yearformater.dateFormat = @"yyyy";
//    NSString *yearstr = [Yearformater stringFromDate:date];
//    
//    NSDateFormatter *Monthformater = [NSDateFormatter new];
//    Monthformater.dateFormat = @"MM";
//    NSString *monthstr = [Monthformater stringFromDate:date];
//    
//    self.titleLab.text = [NSString stringWithFormat:@"%@-%@月",yearstr,monthstr];
//    
//    self.showMonth = monthstr.intValue;
//    self.showYear = yearstr.intValue;

    
//    m_labDate.text=[NSString stringWithFormat:@"%d年%d月",year,month];
//    
//    m_labToday.text=[NSString stringWithFormat:@"%d",day];
//    
//    m_labWeek.text=[NSString stringWithFormat:@"%@",[arrWeek objectAtIndex:week]];
//    UILabel * monthLabel = [CommUtls createLabelWithTitle:[NSString stringWithFormat:@"%d月",month] fontSize:Font_ThirtyTwo_S textColor:COLOR_WhiteColor];
//    monthLabel.textAlignment = NSTextAlignmentRight;
//    
//    [signHeader addSubview:monthLabel];
//    [monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(signHeader).offset(AutoHeight(15));
//        make.height.mas_equalTo(AutoHeight(30));
//        make.left.mas_equalTo(self.view).offset(SCREENWIDTH/2-AutoWidth(60));
//        make.width.mas_equalTo(AutoWidth(80));
//    }];
    
//    UILabel * monthLabel = [CommUtls createLabelWithTitle:[NSString stringWithFormat:@"%d月",month] fontSize:Font_ThirtyTwo_S textColor:COLOR_WhiteColor];
//    monthLabel.textAlignment = NSTextAlignmentRight;
//    
//    [signHeader addSubview:monthLabel];
//    [monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(signHeader).offset(AutoHeight(15));
//        make.height.mas_equalTo(AutoHeight(30));
//        make.left.mas_equalTo(self.view).offset(SCREENWIDTH/2-AutoWidth(60));
//        make.width.mas_equalTo(AutoWidth(80));
//    }];
//    
//    UILabel * monthLabel = [CommUtls createLabelWithTitle:[NSString stringWithFormat:@"%d月",month] fontSize:Font_ThirtyTwo_S textColor:COLOR_WhiteColor];
//    monthLabel.textAlignment = NSTextAlignmentRight;
//    
//    [signHeader addSubview:monthLabel];
//    [monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(signHeader).offset(AutoHeight(15));
//        make.height.mas_equalTo(AutoHeight(30));
//        make.left.mas_equalTo(self.view).offset(SCREENWIDTH/2-AutoWidth(60));
//        make.width.mas_equalTo(AutoWidth(80));
//    }];
//    
    
    UIButton * signBtn = [CommUtls createButtonWithTitle:@"签到规则" image:nil fontSize:Font_Twelve_S textColor:COLOR_BlackColor target:self sel:@selector(signRule)];
    [self.view addSubview:signBtn];
    signBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [signBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(signHeader.mas_bottom).offset(AutoHeight(5));
        make.height.mas_equalTo(AutoHeight(15));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-5));
        make.width.mas_equalTo(AutoHeight(60));
    }];
    
}

-(void)signRule{

    SignRulesViewController * signVC = [[SignRulesViewController alloc]init];

    [self.navigationController pushViewController:signVC animated:YES];

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
