//
//  UIImageView+DWebCache.h
//  MHProject
//
//  Created by 董駸 on 15/8/25.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (DWebCache)

- (void)setImageURL:(NSURL *)url placeholder:(UIImage *)placeholder;

- (void)setImageURLStr:(NSString *)urlStr placeholder:(UIImage *)placeholder;

@end
