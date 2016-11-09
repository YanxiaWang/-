//
//  SmartCommunityHeader.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/7.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "SmartCommunityHeader.h"

@implementation SmartCommunityHeader
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _backLabel = [CommUtls createLabelWithTitle:nil fontSize:Font_TwentyTwo_S textColor:UB_RGBA(0.95, 0.95, 0.95, 1.00)];
        _backLabel.textAlignment = NSTextAlignmentCenter;
        _backLabel.frame = self.bounds;
        [self addSubview:_backLabel];

        _label = [CommUtls createLabelWithTitle:nil fontSize:Font_Fourteen_S textColor:COLOR_BlackColor];
        _label.frame = self.bounds;
        _label.textAlignment = NSTextAlignmentCenter;

        [self addSubview:_label];
        UIImageView * addOrDeleteUnderLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"addOrDeleteUnderLine"]];
        [self addSubview:addOrDeleteUnderLine];
        
        [addOrDeleteUnderLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(AutoWidth(10));
            make.right.mas_equalTo(self).offset(AutoWidth(-10));
            make.bottom.mas_equalTo(self).offset(AutoHeight(-1));
            make.height.mas_equalTo(AutoHeight(1));
        }];
        
    }
    return self;
}

@end
