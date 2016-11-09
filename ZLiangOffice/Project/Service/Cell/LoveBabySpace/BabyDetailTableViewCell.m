//
//  BabyDetailTableViewCell.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/6.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "BabyDetailTableViewCell.h"

@implementation BabyDetailTableViewCell

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
    
    UIImageView * topImgView = [[UIImageView alloc]init];
        topImgView.image = [UIImage imageNamed:@"babyspace"];
    self.topimgView = topImgView;
    [self addSubview:topImgView];
    
    UILabel * titleLabel = [CommUtls createLabelWithTitle:@"爱婴空间" fontSize:Font_Fifteen_S textColor:COLOR_BlackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel = titleLabel;
    CGSize  labelsize = [self calculationWidthWithStr:titleLabel.text withFont:15];
    
    self.topimgView.frame = CGRectMake(0, 0, labelsize.width+100, labelsize.height+1);
    topImgView.center = CGPointMake(self.contentView.center.x, AutoHeight(15));
    titleLabel.frame = topImgView.frame;
    [self addSubview:titleLabel];
    
    //地址
    UILabel * infoLabel = [CommUtls createLabelWithTitle:@"Lorem ipsum dolor sit amet, consectetur adip-scing elit. Aemean euismod" fontSize:Font_Thirteen_S textColor:UB_RGBAS(153)];
    infoLabel.frame = CGRectMake(AutoWidth(10), titleLabel.bottom+AutoWidth(10),APP_FRAME_W-AutoWidth(20), AutoWidth(35));
    infoLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:infoLabel];

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:infoLabel.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = AutoWidth(5);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [infoLabel.text length])];
    infoLabel.attributedText = attributedString;
    [infoLabel sizeToFit];

   
}
#pragma mark -  根据字符串的长度来计算label的大小
- (CGSize)calculationWidthWithStr:(NSString *)string withFont:(CGFloat)font
{
    
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};
    CGSize ziTiSize = [string boundingRectWithSize:CGSizeMake(280, 3000)options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return ziTiSize;
}
@end
