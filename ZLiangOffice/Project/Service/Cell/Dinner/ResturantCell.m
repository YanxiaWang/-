//
//  ResturantCell.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/6.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "ResturantCell.h"

@implementation ResturantCell
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
    UIImageView * topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(10), AutoWidth(90), AutoHeight(90))];
    topImgView.image = [UIImage imageNamed:@"food"];
    [self addSubview:topImgView];
    
    //名称
    UILabel * titleLabel = [CommUtls createLabelWithTitle:@"梅菜扣肉" fontSize:Font_Thirteen_S textColor:COLOR_BlackColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.frame = CGRectMake(AutoWidth(10)+topImgView.right, AutoHeight(17), AutoWidth(140), AutoHeight(14));
    [self addSubview:titleLabel];
    
    //评价
    UIButton * commenbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commenbtn.frame = CGRectMake(titleLabel.right, AutoHeight(11), AutoWidth(61), AutoHeight(27));
    [commenbtn setBackgroundImage:[UIImage imageNamed:@"commentbtn"] forState:UIControlStateNormal];
    [commenbtn setTitle:@"评价" forState:UIControlStateNormal];
    [commenbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    commenbtn.titleLabel.font = UB_S_FONT(14);
    [self addSubview:commenbtn];

    float starspace = AutoWidth(4);
    UIImageView * lastStarView;
    for (int j = 0; j <5; j ++) {
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(titleLabel.left+(starspace +AutoWidth(7))*j, titleLabel.bottom+AutoWidth(10), AutoWidth(7), AutoWidth(7))];
        imgView.image = [UIImage imageNamed:@"star"];
        [self addSubview:imgView];
        if (j == 4) {
            lastStarView = imgView;
        }
    }
    //得分
    UILabel * scoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(lastStarView.right+AutoWidth(5), lastStarView.top, AutoWidth(50), AutoHeight(10))];
    scoreLabel.center = CGPointMake(lastStarView.right+AutoWidth(30), lastStarView.center.y);
    scoreLabel.text = @"5.0";
    scoreLabel.font = UB_S_FONT(10);
    [self addSubview:scoreLabel];

    
    //评论条数
    UIButton * commentDetailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commentDetailBtn.frame = CGRectMake(titleLabel.left, AutoHeight(80), AutoWidth(40),AutoHeight(15) );
    [commentDetailBtn setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
    [commentDetailBtn setTitle:@"500" forState:UIControlStateNormal];
    [commentDetailBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//UB_RGB(102, 102, 102)
    commentDetailBtn.titleEdgeInsets  =UIEdgeInsetsMake(0, 2, 0, -5);
    commentDetailBtn.titleLabel.font = UB_S_FONT(10);
    [self addSubview:commentDetailBtn];
    
    
}

@end
