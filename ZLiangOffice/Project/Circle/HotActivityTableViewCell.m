//
//  HotActivityTableViewCell.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/8.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "HotActivityTableViewCell.h"

@implementation HotActivityTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)createUI
{
    UIImageView * leftImgView = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(10), AutoWidth(161), AutoHeight(151))];
    leftImgView.image = [UIImage imageNamed:@"huodongtupian"];
    [self addSubview:leftImgView];
    //标题
    UILabel * titleLabel = [CommUtls createLabelWithTitle:@"相约夜跑活动" fontSize:Font_Fourteen_S textColor:COLOR_BlackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.frame = CGRectMake(leftImgView.right, leftImgView.top+AutoHeight(15), APP_FRAME_W-leftImgView.right, AutoHeight(15));
    [self addSubview:titleLabel];
    //时间
    UILabel * timeLabel = [CommUtls createLabelWithTitle:@"今天" fontSize:Font_Eleven_S textColor:UB_RGBAS(153)];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.frame = CGRectMake(leftImgView.right, titleLabel.bottom+AutoHeight(8), titleLabel.width, AutoHeight(12));
    [self addSubview:timeLabel];
    //回帖
    UILabel * feedbackLabel = [CommUtls createLabelWithTitle:@"666回帖" fontSize:Font_Twelve_S textColor:UB_RGBAS(149)];
    feedbackLabel.textAlignment = NSTextAlignmentCenter;
    feedbackLabel.frame = CGRectMake(leftImgView.right, timeLabel.bottom+AutoHeight(7), titleLabel.width, AutoHeight(12));
    [self addSubview:feedbackLabel];
    //图片
    UIImageView * sportImg = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10),feedbackLabel.bottom+ AutoHeight(8), AutoHeight(40), AutoHeight(16))];
    sportImg.center = CGPointMake(feedbackLabel.center.x, feedbackLabel.bottom+AutoHeight(16));
    sportImg.image = [UIImage imageNamed:@"yundong"];
    [self addSubview:sportImg];
    //运动名称
    UILabel * sportLabel = [CommUtls createLabelWithTitle:@"跑步" fontSize:Font_Ten_S textColor:COLOR_WhiteColor];
    sportLabel.textAlignment = NSTextAlignmentCenter;
    sportLabel.frame = CGRectMake(0, 0, sportImg.width, sportImg.height);
    [sportImg addSubview:sportLabel];
    //分割线
    UIImageView * lineImg = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10),sportImg.bottom+ AutoHeight(9), AutoHeight(101), AutoHeight(1))];
    lineImg.center = CGPointMake(feedbackLabel.center.x, sportImg.bottom+AutoHeight(10));
    lineImg.image = [UIImage imageNamed:@"fengexian"];
    [self addSubview:lineImg];
    //图片
    UIImageView * headImg = [[UIImageView alloc]initWithFrame:CGRectMake(leftImgView.right+ AutoWidth(30),lineImg.bottom+ AutoHeight(7), AutoHeight(32), AutoHeight(32))];
    headImg.image = [UIImage imageNamed:@"headphoto"];
    [self addSubview:headImg];
    
    //名字
    UILabel * nameLabel = [CommUtls createLabelWithTitle:@"小西瓜" fontSize:Font_Ten_S textColor:COLOR_BlackColor];
    nameLabel.font = UB_S_FONT(13);
    nameLabel.frame = CGRectMake(headImg.right+AutoWidth(7), 0, AutoWidth(100), AutoHeight(15));
    nameLabel.center = CGPointMake(headImg.right+AutoHeight(57), headImg.center.y);
    [self addSubview:nameLabel];
    
}

@end
