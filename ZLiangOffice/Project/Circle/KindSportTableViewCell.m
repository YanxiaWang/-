//
//  KindSportTableViewCell.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/8.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "KindSportTableViewCell.h"

@implementation KindSportTableViewCell

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
    //分割线
    UILabel * lineLabel = [CommUtls createLabelWithTitle:@"" fontSize:Font_Ten_S textColor:COLOR_WhiteColor];
    lineLabel.backgroundColor = UB_RGBAS(229);
    lineLabel.frame = CGRectMake(AutoWidth(10), 0, APP_FRAME_W-AutoWidth(20), 1);
    self.lineLabel = lineLabel;
    [self addSubview:lineLabel];
    
    //标题
    UILabel * titleLabel = [CommUtls createLabelWithTitle:@"中粮集团2016企业服务创新会" fontSize:Font_Fourteen_S textColor:UB_RGBAS(51)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.frame = CGRectMake(0, lineLabel.bottom, APP_FRAME_W, AutoHeight(42));
    [self addSubview:titleLabel];
    
    //图片
    UIImageView * sportImg = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10),titleLabel.bottom, APP_FRAME_W-AutoWidth(20), AutoHeight(101))];
    sportImg.image = [UIImage imageNamed:@"huodongtupian"];
    [self addSubview:sportImg];

    
    //时间
    UILabel * timeLabel = [CommUtls createLabelWithTitle:@"07-02" fontSize:Font_Twelve_S textColor:UB_RGBAS(153)];
    timeLabel.textAlignment = NSTextAlignmentRight;
    timeLabel.frame = CGRectMake(APP_FRAME_W-AutoWidth(160), sportImg.bottom, AutoWidth(150), AutoHeight(40));
    [self addSubview:timeLabel];
    
    //回帖
    
    //图片
    UIImageView * editImg = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10),sportImg.bottom+AutoHeight(15), AutoWidth(14), AutoHeight(15))];
    editImg.image = [UIImage imageNamed:@"huitie"];
    editImg.userInteractionEnabled = YES;
    [self addSubview:editImg];
    
    
    //时间
    UILabel * backLabel = [CommUtls createLabelWithTitle:@"666回帖" fontSize:Font_Twelve_S textColor:UB_RGBAS(153)];
    backLabel.textAlignment = NSTextAlignmentLeft;
    backLabel.frame = CGRectMake(editImg.right+AutoWidth(10), sportImg.bottom, AutoWidth(150), AutoHeight(40));
    backLabel.userInteractionEnabled = YES;
    [self addSubview:backLabel];
    
    
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(AutoWidth(10), sportImg.bottom+AutoHeight(2), AutoWidth(200), AutoHeight(40));
    [self addSubview:backBtn];
    
    
//    UILabel * feedbackLabel = [CommUtls createLabelWithTitle:@"666回帖" fontSize:Font_Thirteen_S textColor:COLOR_BlackColor];
//    feedbackLabel.textAlignment = NSTextAlignmentCenter;
//    feedbackLabel.frame = CGRectMake(leftImgView.right, timeLabel.bottom+AutoHeight(7), titleLabel.width, AutoHeight(12));
//    [self addSubview:feedbackLabel];
    
}

@end
