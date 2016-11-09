//
//  ADAndDeleteViewController.h
//  ZLiangOffice
//
//  Created by ZhiDaKe on 2016/11/5.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADAndDeleteViewController : SetNaviViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)NSMutableArray * dataArr;

@property (nonatomic, strong)UICollectionView * cView;

@property (nonatomic, strong)NSMutableArray * textArr;

@property (nonatomic, strong)NSArray * headerArr;

@end
