//
//  GoodTableViewCell.m
//  ZLiangOffice
//
//  Created by wangyanxia on 16/11/4.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "GoodTableViewCell.h"

@implementation GoodTableViewCell

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

#pragma mark  创建控件
-(void)createUI
{
    UIImageView * topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, AutoHeight(15), AutoWidth(170), AutoHeight(15))];
    topImgView.center = CGPointMake(self.contentView.center.x, AutoHeight(20));
    topImgView.image = [UIImage imageNamed:@"goodfood"];
    [self addSubview:topImgView];
    
    UILabel * titleLabel = [CommUtls createLabelWithTitle:@"美食推荐" fontSize:Font_Thirteen_S textColor:COLOR_BlackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.frame = topImgView.frame;
    [self addSubview:titleLabel];
    
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    moreBtn.frame = CGRectMake(0, 0, AutoWidth(50), AutoHeight(25));
    moreBtn.center = CGPointMake(APP_FRAME_W- AutoWidth(30), titleLabel.center.y);
    [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    [moreBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [moreBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [self addSubview:moreBtn];
    
    [self createShops];
    
}
- (void)createShops
{
    NSArray  *menuArr=@[@"Cafe 4U",@"85面包坊",@"菲诗小铺"];
    NSArray  *menuImgArr=@[@"img1",@"img1",@"img1"];
    NSInteger  totalnum = 3;
    CGFloat space = (APP_FRAME_W-AutoWidth(10)*2-AutoWidth(91)*totalnum)/2;
    for (int i = 0; i < totalnum; i ++) {
        
        CGFloat  btnLeft = AutoWidth(10)+(space+AutoWidth(91))*i;
        UIButton * chooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        chooseBtn.frame = CGRectMake(btnLeft, AutoHeight(55), AutoWidth(91), AutoHeight(90));
        [self.contentView addSubview:chooseBtn];
        chooseBtn.tag = 20+i;
        [chooseBtn addTarget:self action:@selector(shopchooseclick:) forControlEvents:UIControlEventTouchUpInside];
        //上方图片
        UIImageView *  topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, AutoWidth(91), AutoHeight(90))];
        topImgView.center = CGPointMake(chooseBtn.center.x, chooseBtn.center.y-AutoHeight(15));
        topImgView.image = [UIImage imageNamed:menuImgArr[i]];
        topImgView.userInteractionEnabled = YES;
        [self.contentView addSubview:topImgView];
        
        
        //下方文字
        UILabel * titleLabel = [CommUtls createLabelWithTitle:menuArr[i] fontSize:Font_Fourteen_S textColor:COLOR_BlackColor];
        titleLabel.bounds = CGRectMake(0, 0, chooseBtn.width, AutoWidth(15));
        titleLabel.center = CGPointMake(chooseBtn.center.x, topImgView.center.y+AutoWidth(60));
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.userInteractionEnabled = YES;
        [self.contentView addSubview:titleLabel];
        
        
        UIView * starView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, AutoWidth(55), AutoHeight(8))];
        starView.center = CGPointMake(chooseBtn.center.x, titleLabel.bottom+AutoHeight(10));
        [self.contentView addSubview:starView];
        float  starspace = (starView.width-AutoWidth(8)*5)/4;
        for (int j = 0; j <5; j ++) {
            UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake((starspace +AutoWidth(8))*j, 0, AutoWidth(8), AutoWidth(8))];
            imgView.image = [UIImage imageNamed:@"star"];
            [starView addSubview:imgView];
        }
        
    }
    
}
- (void)shopchooseclick:(UIButton *)sender
{
   
}
@end
