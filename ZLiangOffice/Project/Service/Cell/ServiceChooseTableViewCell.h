//
//  ServiceChooseTableViewCell.h
//  ZLiangOffice
//
//  Created by wangyanxia on 16/11/4.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceChooseTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate>
{
  UICollectionView *  _collectionview;
}
@property (nonatomic , copy) void (^ chooseBlock)(NSInteger chooseTag);
@end
