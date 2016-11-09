//
//  ResturantCommitTableViewCell.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/7.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "ResturantCommitTableViewCell.h"

@implementation ResturantCommitTableViewCell

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
    //头像
    UIImageView * topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(15), AutoWidth(46), AutoWidth(46))];
    topImgView.image = [UIImage imageNamed:@"touxiang"];
//    topImgView.layer.cornerRadius = AutoWidth(23);
    [self addSubview:topImgView];
    
    //名称
    UILabel * titleLabel = [CommUtls createLabelWithTitle:@"刘丽" fontSize:Font_Thirteen_S textColor:COLOR_BlackColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.frame = CGRectMake(AutoWidth(15)+topImgView.right, AutoHeight(20), AutoWidth(135), AutoHeight(16));
    [self addSubview:titleLabel];
    
    //时间
    UILabel * timeLabel = [CommUtls createLabelWithTitle:@"2016-07-18 14:00" fontSize:Font_Twelve_S textColor:UB_RGBAS(160)];
    timeLabel.textAlignment = NSTextAlignmentRight;
    timeLabel.frame = CGRectMake(APP_FRAME_W-AutoWidth(125), AutoHeight(20), AutoWidth(115), AutoHeight(16));
    [self addSubview:timeLabel];
    //评价
//    UIView * starView = [[UIView alloc]initWithFrame:CGRectMake(titleLabel.left, titleLabel.bottom+AutoWidth(5), AutoWidth(55), AutoHeight(8))];
////    starView.center = CGPointMake(chooseBtn.center.x, titleLabel.bottom+AutoHeight(10));
//    [self.contentView addSubview:starView];
//    float  starspace = (starView.width-AutoWidth(8)*5)/4;
//    for (int j = 0; j <5; j ++) {
//        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake((starspace +AutoWidth(8))*j, 0, AutoWidth(8), AutoWidth(8))];
//        imgView.image = [UIImage imageNamed:@"star"];
//        [starView addSubview:imgView];
//    }
    //评价星星
    float starspace = AutoWidth(4);
    for (int j = 0; j <5; j ++) {
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(titleLabel.left+(starspace +AutoWidth(7))*j, titleLabel.bottom+AutoWidth(10), AutoWidth(7), AutoWidth(7))];
        imgView.image = [UIImage imageNamed:@"star"];
        [self addSubview:imgView];

    }
    //评价内容
    UILabel * commitcontentLabel = [[UILabel alloc]initWithFrame:CGRectMake(titleLabel.left, topImgView.bottom, APP_FRAME_W-titleLabel.left-AutoWidth(10), AutoHeight(37))];
//    commitcontentLabel.center = CGPointMake(lastStarView.right+AutoWidth(30), lastStarView.center.y);
    commitcontentLabel.text = @"这里显示哈哈评论,这里显示评论,这里显示评论,这里显示评论,这里显示评论,这里显示评";
    commitcontentLabel.font = UB_S_FONT(12);
    commitcontentLabel.textColor = UB_RGBAS(153);
    commitcontentLabel.numberOfLines = 0;
    [self addSubview:commitcontentLabel];
    
    UILabel * lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(105), APP_FRAME_W-AutoWidth(20), AutoHeight(1))];
    lineLabel.backgroundColor = UB_RGBAS(229);
    self.lineLabel = lineLabel;
    [self addSubview:lineLabel];
}

@end
