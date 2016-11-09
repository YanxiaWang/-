//
//  ServiceChooseCollectionViewCell.m
//  ZLiangOffice
//
//  Created by wangyanxia on 16/11/4.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "ServiceChooseCollectionViewCell.h"

@implementation ServiceChooseCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self     = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor        = [UIColor whiteColor];
        // 创建控件
        [self initUI];
    }
    return self;
}
#pragma mark  创建控件
-(void)initUI
{
    // 图片
    self.goodsImageView             = [[UIImageView  alloc]initWithFrame:CGRectMake(5, 5, AutoWidth(20), AutoHeight(23))];
    [self addSubview:self.goodsImageView];
    // 内容
    self.goodsNameLabel             = [[UILabel alloc]initWithFrame:CGRectMake(0, self.goodsImageView.bottom + AutoHeight(11) , AutoWidth(50), AutoHeight(13))];
    self.goodsNameLabel.font       = [UIFont systemFontOfSize:14];
    self.goodsNameLabel.textColor  = [UIColor blackColor];
    [self addSubview:self.goodsNameLabel];
    
    //横线
    UILabel * lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.goodsNameLabel.bottom + AutoHeight(11), self.goodsNameLabel.width, 1)];
    lineLabel.backgroundColor = [UIColor lightGrayColor];
    self.lineLabel = lineLabel;
    [self addSubview:lineLabel];
}


@end
