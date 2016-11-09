//
//  AddAndDeleteCell.m
//  ZLiangOffice
//
//  Created by ZhiDaKe on 2016/11/6.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "AddAndDeleteCell.h"

@implementation AddAndDeleteCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self createUI];
        //self.backgroundColor = COLOR_RedColor;
    }
    return self;

}

-(void)createUI{

    _functionB = [[UIImageView alloc]init];
    [self.contentView addSubview:_functionB];
    [_functionB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(AutoWidth(29));
        make.right.mas_equalTo(self.contentView).offset(AutoWidth(-29));
        make.top.mas_equalTo(self.contentView).offset(AutoHeight(15));
        make.height.mas_equalTo(AutoHeight(20));
    }];
    _textLabel = [CommUtls createLabelWithTitle:nil fontSize:Font_Twelve_S textColor:COLOR_BlackColor];
    _textLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_textLabel];
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(AutoWidth(10));
        make.right.mas_equalTo(self.contentView).offset(AutoWidth(-10));
        make.top.mas_equalTo(_functionB.mas_bottom).offset(AutoHeight(4));
        make.height.mas_equalTo(AutoHeight(20));
    }];
    
    _addOrDelete = [[UIImageView alloc]init];
    [self.contentView addSubview:_addOrDelete];
    [_addOrDelete mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_functionB.mas_right).offset(AutoWidth(0));
        make.width.mas_equalTo(AutoWidth(10));
        make.top.mas_equalTo(_functionB.mas_top).offset(AutoHeight(-5));
        make.height.mas_equalTo(AutoHeight(10));
    }];
}

@end
