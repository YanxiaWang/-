//
//  UIImage+renderImage.h
//  OnTheWay
//
//  Created by qianfeng on 16/6/19.
//  Copyright © 2016年 MrWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (renderImage)
/**
 *  根据文件名生成一个UIImage对象
 *
 *  @param path 文件名
 *
 *  @return 生成UIImage对象
 */
+(UIImage*) loadImageByName:(NSString*)imageName;

@end
