//
//  BaseInfoTableViewCell.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/7.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "BaseInfoTableViewCell.h"

@implementation BaseInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.backgroundColor=[UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self  initView];
    }
    return self;
}
-(void)initView{
    
    //分割线
    UIView  *lineView=[[UIView alloc]initWithFrame:CGRectMake(AutoWidth(10), 0, APP_FRAME_W-AutoWidth(20), 1)];
    lineView.backgroundColor=UB_RGBAS(229);
    [self addSubview:lineView];
    
    //左边图片
    UIImageView * picImgVIew = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(13), AutoWidth(18), AutoHeight(18))];
    picImgVIew.image = [UIImage imageNamed:@"niuroupisa"];
    self.picImgVIew = picImgVIew;
    [self addSubview:picImgVIew];
    
    //标题
    self.contentLabel=[[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10)+picImgVIew.right, 0, APP_FRAME_W-AutoWidth(20)-picImgVIew.right, AutoHeight(44))];
    self.contentLabel.text = @"黑橄榄至尊披萨";
    self.contentLabel.font=UB_S_FONT(14);
    self.contentLabel.textColor=UB_RGBAS(153);
    [self addSubview:self.contentLabel];
    
    }

@end
