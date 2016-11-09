//
//  SmartCommunityViewController.h
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/2.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmartCommunityViewController : BaseViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)NSMutableArray * dataArr;

@property (nonatomic, strong)UICollectionView * cView;

@property (nonatomic, strong)NSMutableArray * textArr;

@property (nonatomic, strong)NSArray * headerBackArr;

@property (nonatomic, strong)NSArray * headerArr;


@end
