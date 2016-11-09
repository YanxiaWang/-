//
//  UIImage+renderImage.m
//  OnTheWay
//
//  Created by qianfeng on 16/6/19.
//  Copyright © 2016年 MrWang. All rights reserved.
//

#import "UIImage+renderImage.h"

@implementation UIImage (renderImage)

+(UIImage*) loadImageByName:(NSString *)imageName{
    
    UIImage  * image = [UIImage imageNamed:imageName];
    if ([UIDevice currentDevice].systemVersion.floatValue >=(7)) {
        //保持图片格式不变
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return image;
}

@end
