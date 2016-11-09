//
//  UIImageView+DWebCache.m
//  MHProject
//
//  Created by 董駸 on 15/8/25.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#import "UIImageView+DWebCache.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (DWebCache)

- (void)setImageURL:(NSURL *)url placeholder:(UIImage *)placeholder
{
    [self sd_setImageWithURL:url placeholderImage:placeholder options:SDWebImageRetryFailed | SDWebImageLowPriority];
}

- (void)setImageURLStr:(NSString *)urlStr placeholder:(UIImage *)placeholder
{
    
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:placeholder];
}

@end
