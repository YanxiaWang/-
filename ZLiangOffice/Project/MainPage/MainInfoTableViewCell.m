//
//  MainInfoTableViewCell.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/9.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "MainInfoTableViewCell.h"

@implementation MainInfoTableViewCell

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
    
    UIImageView * leftImgView = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(58), AutoHeight(17.5), AutoWidth(16.5), AutoHeight(16.5))];
    self.leftImgView = leftImgView;
    [self addSubview:leftImgView];
    //标题
    UILabel * titleLabel = [CommUtls createLabelWithTitle:@"" fontSize:Font_Fourteen_S textColor:UB_RGBAS(153)];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.frame = CGRectMake(AutoWidth(97), AutoHeight(17.5), APP_FRAME_W-AutoWidth(97), AutoHeight(16.5));
    self.infoLabel = titleLabel;
    [self addSubview:titleLabel];
    
}

@end
