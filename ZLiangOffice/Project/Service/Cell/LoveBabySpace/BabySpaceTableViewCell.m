//
//  BabySpaceTableViewCell.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/6.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "BabySpaceTableViewCell.h"

@implementation BabySpaceTableViewCell

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
   
    //上方图片
    UIImageView *  topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(15),APP_FRAME_W-AutoWidth(20), AutoHeight(152))];
    topImgView.image = [UIImage imageNamed:@"babytu"];
    [self.contentView addSubview:topImgView];
    
    //地图
    UIImageView *  mapView = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10),topImgView.bottom+AutoHeight(10),AutoWidth(12), AutoHeight(16))];
    mapView.image = [UIImage imageNamed:@"map"];
    [self.contentView addSubview:mapView];
    
    //地址
    UILabel * mapLabel = [CommUtls createLabelWithTitle:@"泰禾文化大厦B座3楼" fontSize:Font_Twelve_S textColor:UB_RGBAS(153)];
    mapLabel.frame = CGRectMake(mapView.right+AutoWidth(5), mapView.top, AutoWidth(200), AutoWidth(16));
    mapLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:mapLabel];
    
    //容纳量
    UILabel * capacityLabel = [CommUtls createLabelWithTitle:@"容纳量:500" fontSize:Font_Twelve_S textColor:UB_RGBAS(153)];
    capacityLabel.frame = CGRectMake(mapLabel.right, mapView.top, APP_FRAME_W-mapLabel.right-AutoWidth(10), AutoWidth(16));
    capacityLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:capacityLabel];
    
    
    //下方文字
    UILabel * titleLabel = [CommUtls createLabelWithTitle:@"旺仔牛奶新品展示" fontSize:Font_Fifteen_S textColor:COLOR_BlackColor];
    titleLabel.frame = CGRectMake(topImgView.left, mapView.bottom+AutoHeight(17), APP_FRAME_W-AutoWidth(20), AutoHeight(17));
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleLabel];

    //信息文字
    UILabel * infoLabel = [CommUtls createLabelWithTitle:@"一是解决功能定位问题,明晰集团战略定位,聚焦核心主业,履行国家粮食安全和食品安全战略." fontSize:Font_Fourteen_S textColor:UB_RGBAS(189)];
    infoLabel.frame = CGRectMake(topImgView.left, titleLabel.bottom+AutoHeight(10), APP_FRAME_W-AutoWidth(20), AutoHeight(35));
    infoLabel.textAlignment = NSTextAlignmentLeft;
    infoLabel.numberOfLines = 2;
    
    [self.contentView addSubview:infoLabel];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:infoLabel.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = AutoWidth(5);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [infoLabel.text length])];
    infoLabel.attributedText = attributedString;
    [infoLabel sizeToFit];
 
    
}

@end
