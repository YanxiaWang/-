//
//  ActivityCommendTableViewCell.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/8.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "ActivityCommendTableViewCell.h"

@implementation ActivityCommendTableViewCell

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
    UIView  *lineView=[[UIView alloc]initWithFrame:CGRectMake(AutoWidth(10), 0, APP_FRAME_W-AutoWidth(20), 1)];
    lineView.backgroundColor=UB_RGBAS(229);
    [self addSubview:lineView];
    //头像
    UIImageView * topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(15), AutoWidth(46), AutoWidth(46))];
    //    topImgView.layer.cornerRadius = AutoWidth(23);
    topImgView.image = [UIImage imageNamed:@"touxiang"];
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
    //评价内容
    UILabel * commitcontentLabel = [[UILabel alloc]initWithFrame:CGRectMake(titleLabel.left, titleLabel.bottom, APP_FRAME_W-titleLabel.left-AutoWidth(10), AutoHeight(37))];
    commitcontentLabel.text = @"这里显示哈哈评论,这里显示评论,这里显示评论,这里显";
    commitcontentLabel.font = UB_S_FONT(12);
    commitcontentLabel.textColor = UB_RGBAS(153);
    commitcontentLabel.numberOfLines = 0;
    [self addSubview:commitcontentLabel];
    
    
    //点赞条数
    UIButton * zanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    zanBtn.frame = CGRectMake(lineView.right-AutoWidth(103), AutoHeight(80), AutoWidth(40),AutoHeight(15) );
    [zanBtn setImage:[UIImage imageNamed:@"zan"] forState:UIControlStateNormal];
    [zanBtn setTitle:@"500" forState:UIControlStateNormal];
    [zanBtn setTitleColor:UB_RGBAS(161) forState:UIControlStateNormal];//UB_RGB(102, 102, 102)
    zanBtn.titleEdgeInsets  =UIEdgeInsetsMake(0, 2, 0, -5);
    //    zanBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 2, 2, 2);
    zanBtn.titleLabel.font = UB_S_FONT(10);
    [self addSubview:zanBtn];
    
    //评论条数
    UIButton * commentDetailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commentDetailBtn.frame = CGRectMake(zanBtn.right+AutoWidth(20), AutoHeight(80), AutoWidth(40),AutoHeight(15) );
    [commentDetailBtn setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
    [commentDetailBtn setTitle:@"500" forState:UIControlStateNormal];
    [commentDetailBtn setTitleColor:UB_RGBAS(161) forState:UIControlStateNormal];//UB_RGB(102, 102, 102)
    commentDetailBtn.titleEdgeInsets  =UIEdgeInsetsMake(0, 2, 0, -5);
    commentDetailBtn.titleLabel.font = UB_S_FONT(10);
    [self addSubview:commentDetailBtn];
    
    
    
}

@end
