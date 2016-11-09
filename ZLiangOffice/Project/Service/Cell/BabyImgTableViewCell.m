//
//  BabyImgTableViewCell.m
//  ZLiangOffice
//
//  Created by wangyanxia on 16/11/4.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "BabyImgTableViewCell.h"

@implementation BabyImgTableViewCell

- (void)awakeFromNib {
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
    UIImageView * topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, AutoHeight(30), AutoWidth(115), AutoHeight(15))];
    topImgView.center = CGPointMake(self.contentView.center.x, AutoHeight(20));
    topImgView.image = [UIImage imageNamed:@"babyspace"];
    [self addSubview:topImgView];
    
    UILabel * titleLabel = [CommUtls createLabelWithTitle:@"爱婴空间" fontSize:Font_Thirteen_S textColor:COLOR_BlackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.frame = topImgView.frame;
    [self addSubview:titleLabel];
    
    //图片
    UIImageView * babyImg = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(42), APP_FRAME_W-AutoHeight(10)*2, AutoHeight(150))];
    babyImg.image = [UIImage imageNamed:@"homeBack"];
    [self addSubview:babyImg];
    
}

@end
