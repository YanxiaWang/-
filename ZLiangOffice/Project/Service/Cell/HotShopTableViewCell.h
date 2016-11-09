//
//  HotShopTableViewCell.h
//  ZLiangOffice
//
//  Created by wangyanxia on 16/11/4.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotShopTableViewCell : UITableViewCell
@property (nonatomic , strong) void (^shopClick)(NSInteger shoptag);
@property (nonatomic , strong) void (^moreClick)();
@end
