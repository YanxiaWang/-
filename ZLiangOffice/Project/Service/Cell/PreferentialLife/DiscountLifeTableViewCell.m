//
//  DiscountLifeTableViewCell.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/6.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "DiscountLifeTableViewCell.h"

@implementation DiscountLifeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        [self createUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

#pragma mark  创建控件
-(void)createUI
{
    //背景图
    UIImageView * topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10),AutoHeight(10),APP_FRAME_W-AutoWidth(20), AutoHeight(128))];
    topImgView.image = [UIImage imageNamed:@"bgImg"];
    [self addSubview:topImgView];
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
    
    

    
}

@end
