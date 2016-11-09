//
//  FunctionHeader.m
//  ZLiangOffice
//
//  Created by ZhiDaKe on 2016/11/6.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "FunctionHeader.h"

@implementation FunctionHeader
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self createUI];        
    }
    return self;
}
-(void)createUI{


    UIView * blackView = [[UIView alloc]init];
    blackView.backgroundColor =UB_RGBA(0.93, 0.93, 0.93, 1.00);
    [self addSubview:blackView];
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.top.mas_equalTo(self);
        make.height.mas_equalTo(AutoHeight(10));
    }];
    _label = [CommUtls createLabelWithTitle:nil fontSize:Font_Fifteen_S textColor:COLOR_BlackColor];
    [self addSubview:_label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(200));
        make.top.mas_equalTo(self).offset(AutoHeight(20));
        make.height.mas_equalTo(AutoHeight(20));
    }];
    UIImageView * addOrDeleteUnderLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"addOrDeleteUnderLine"]];
    [self addSubview:addOrDeleteUnderLine];
    
    [addOrDeleteUnderLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(AutoWidth(10));
        make.right.mas_equalTo(self).offset(AutoWidth(-10));
        make.bottom.mas_equalTo(self).offset(AutoHeight(-1));
        make.height.mas_equalTo(AutoHeight(1));
    }];
}

@end
