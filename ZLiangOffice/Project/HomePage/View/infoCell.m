//
//  InfoCell.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/4.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "InfoCell.h"

@implementation InfoCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self createUI];
        self.backgroundColor = COLOR_WhiteColor;
    }
    return self;
}
-(void)createUI{
    
    _adLabel = [CommUtls createLabelWithTitle:nil fontSize:Font_Twelve_S textColor:COLOR_BlackColor];
    _adLabel.numberOfLines = 2;
    [self.contentView addSubview:_adLabel];

    [_adLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(2);
        make.right.equalTo(self.contentView).offset(-2);
        make.top.equalTo(self.contentView).offset(2);
        make.bottom.equalTo(self.contentView).offset(-2);
    }];

}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    NSInteger maxLineNum = 2;
    NSString *textString = @"Text";
    CGSize fontSize = [textString sizeWithAttributes:@{NSFontAttributeName:textView.font}];
    
    NSString* newText = [textView.text stringByReplacingCharactersInRange:range withString:text];
    CGSize tallerSize = CGSizeMake(textView.frame.size.width-15,textView.frame.size.height*2);
    
    CGSize newSize = [newText boundingRectWithSize:tallerSize
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName: textView.font}
                                           context:nil].size;
    NSInteger newLineNum = newSize.height / fontSize.height;
    if ([text isEqualToString:@"\n"]) {
        newLineNum += 1;
    }
    
    if ((newLineNum <= maxLineNum)
        && newSize.width < textView.frame.size.width-15)
    {
        return YES;
    }else{
        return NO;
    }
}

@end
