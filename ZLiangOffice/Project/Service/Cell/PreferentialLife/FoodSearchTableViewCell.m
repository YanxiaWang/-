//
//  FoodSearchTableViewCell.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/6.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "FoodSearchTableViewCell.h"

@implementation FoodSearchTableViewCell

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
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

#pragma mark  创建控件
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
    [commenbtn setTitle:@"预约" forState:UIControlStateNormal];
    [commenbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    commenbtn.titleLabel.font = UB_S_FONT(14);
    [commenbtn addTarget:self action:@selector(orderbtnClick:) forControlEvents:UIControlEventTouchUpInside];
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
    
    
    //点赞条数
    UIButton * zanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    zanBtn.frame = CGRectMake(titleLabel.left, AutoHeight(80), AutoWidth(40),AutoHeight(15) );
    [zanBtn setImage:[UIImage imageNamed:@"zan"] forState:UIControlStateNormal];
    [zanBtn setTitle:@"500" forState:UIControlStateNormal];
    [zanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//UB_RGB(102, 102, 102)
    zanBtn.titleEdgeInsets  =UIEdgeInsetsMake(0, 2, 0, -5);
    zanBtn.titleLabel.font = UB_S_FONT(10);
    [self addSubview:zanBtn];
    //评论条数
    UIButton * commentDetailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commentDetailBtn.frame = CGRectMake(zanBtn.right+AutoWidth(10), AutoHeight(80), AutoWidth(40),AutoHeight(15) );
    [commentDetailBtn setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
    [commentDetailBtn setTitle:@"500" forState:UIControlStateNormal];
    [commentDetailBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//UB_RGB(102, 102, 102)
    commentDetailBtn.titleEdgeInsets  =UIEdgeInsetsMake(0, 2, 0, -5);
    commentDetailBtn.titleLabel.font = UB_S_FONT(10);
    [self addSubview:commentDetailBtn];

    //第一个线
    UILabel * lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(topImgView.left, topImgView.bottom+AutoHeight(10), APP_FRAME_W-AutoWidth(20), AutoWidth(1))];
    lineLabel.backgroundColor = UB_RGBAS(229);
    [self addSubview:lineLabel];
    //图片
    UIImageView * priceImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, AutoWidth(18), AutoHeight(13))];
    priceImg.center = CGPointMake(topImgView.left+AutoWidth(9), lineLabel.bottom+AutoHeight(22));
    priceImg.image = [UIImage imageNamed:@"price"];
    [self addSubview:priceImg];
    //赠送提示
    UILabel * giveLabel = [[UILabel alloc]initWithFrame:CGRectMake(priceImg.right+AutoWidth(10), lineLabel.bottom, APP_FRAME_W-AutoWidth(20)-priceImg.right, AutoHeight(44))];
    giveLabel.text = @"商家赠送优惠券";
    giveLabel.textColor = UB_RGBAS(159);
    giveLabel.font = UB_S_FONT(12);
    [self addSubview:giveLabel];
    //第二个线
    UILabel * lineLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(topImgView.left, giveLabel.bottom, APP_FRAME_W-AutoWidth(20), AutoWidth(1))];
    lineLabel2.backgroundColor = UB_RGBAS(229);
    [self addSubview:lineLabel2];
    
    //介绍
    UILabel * showLabel = [[UILabel alloc]initWithFrame:CGRectMake(topImgView.left, lineLabel2.bottom, APP_FRAME_W-AutoWidth(20), AutoHeight(44))];
    showLabel.text = @"介绍:嫩牛五方.麻辣鸡翅.麻辣汉堡.薯片.五香豆腐.哈哈哈";
    showLabel.textColor = UB_RGBAS(159);
    showLabel.font = UB_S_FONT(12);
    [self addSubview:showLabel];

 
    
}
- (void)orderbtnClick:(UIButton *)sender
{
    self.orderClick();
}

@end
