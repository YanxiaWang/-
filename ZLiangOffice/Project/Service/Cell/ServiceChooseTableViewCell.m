//
//  ServiceChooseTableViewCell.m
//  ZLiangOffice
//
//  Created by wangyanxia on 16/11/4.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "ServiceChooseTableViewCell.h"
#import "ServiceChooseCollectionViewCell.h"
@implementation ServiceChooseTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)createUI
{
    NSArray  *menuArr=@[@"优惠生活",@"员工餐厅",@"餐饮",@"快递查询"];
    NSArray  *menuImgArr=@[@"youhuichoose",@"ygct",@"canyin",@"kdcx"];
    NSInteger  totalnum = 4;
    CGFloat space = (APP_FRAME_W-AutoWidth(17)*2-AutoWidth(60)*4)/3;
    for (int i = 0; i < totalnum; i ++) {
        
        CGFloat  btnLeft = AutoWidth(17)+(space+AutoWidth(60))*i;
        UIButton * chooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        chooseBtn.frame = CGRectMake(btnLeft, 0, AutoWidth(60), AutoHeight(75));
        
        chooseBtn.tag = 10+i;
        [chooseBtn addTarget:self action:@selector(chooseclick:) forControlEvents:UIControlEventTouchUpInside];
        //上方图片
        UIImageView *  topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, AutoWidth(20), AutoHeight(22))];
        topImgView.center = CGPointMake(chooseBtn.center.x, chooseBtn.center.y-AutoHeight(10));
        topImgView.image = [UIImage imageNamed:menuImgArr[i]];
        topImgView.userInteractionEnabled = YES;
        [self.contentView addSubview:topImgView];
        
        
        //下方文字
        UILabel * titleLabel = [CommUtls createLabelWithTitle:menuArr[i] fontSize:Font_Twelve_S textColor:COLOR_BlackColor];
        titleLabel.bounds = CGRectMake(0, 0, chooseBtn.width, AutoWidth(15));
        titleLabel.center = CGPointMake(chooseBtn.center.x, chooseBtn.center.y+AutoWidth(20));
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.userInteractionEnabled = YES;
        [self.contentView addSubview:titleLabel];
        
//        //下方横线
//        UILabel * lineLabel = [CommUtls createLabelWithTitle:@"" fontSize:Font_Fifteen_S textColor:[UIColor yellowColor]];
//        lineLabel.bounds = CGRectMake(0, 0, chooseBtn.width-AutoWidth(10), AutoWidth(1));
//        lineLabel.center = CGPointMake(chooseBtn.center.x, AutoWidth(74.5));
//        lineLabel.backgroundColor = UB_RGB(230, 168, 124);
//        lineLabel.textAlignment = NSTextAlignmentCenter;
//        lineLabel.userInteractionEnabled = YES;
//        if (i == 0) {
//         [self.contentView addSubview:lineLabel];   
//        }
        [self addSubview:chooseBtn];
        
    }
//    UICollectionViewFlowLayout *layout =
//    [[UICollectionViewFlowLayout alloc] init];
//    
//    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
//    layout.minimumLineSpacing = 3;
//    layout.minimumInteritemSpacing = 3;
//    
//    _collectionview = [[UICollectionView alloc]
//                       initWithFrame:CGRectMake(0, 60,
//                                                APP_FRAME_W,
//                                                AutoHeight(65))
//                       collectionViewLayout:layout];
//    _collectionview.backgroundColor = [UIColor clearColor];
//    _collectionview.delegate = self;
//    _collectionview.dataSource = self;
//    _collectionview.showsHorizontalScrollIndicator = NO;
//    _collectionview.showsVerticalScrollIndicator = NO;
//    [self.contentView addSubview:_collectionview];
//
//    [_collectionview registerClass:[ServiceChooseCollectionViewCell class]
//        forCellWithReuseIdentifier:@"cellindentifier"];
}
- (void)chooseclick:(UIButton *)sender
{
    self.chooseBlock(sender.tag);
}








#pragma mark---------------------- collectionView delegate----------
//定义展示的UICollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return 4;
}
//定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
//区头的高度
//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ServiceChooseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellindentifier" forIndexPath:indexPath];
    cell.goodsNameLabel.textAlignment = NSTextAlignmentCenter;
    
    NSArray  *menuArr=@[@"优惠生活",@"员工餐厅",@"餐饮",@"快递查询"];
    NSArray  *menuImgArr=@[@"youhuichoose",@"ygct",@"canyin",@"kdcx"];
    cell.goodsNameLabel.text = menuArr[indexPath.row];
    cell.goodsNameLabel.numberOfLines = 1;
    cell.goodsImageView.image = [UIImage imageNamed:menuImgArr[indexPath.row]];\
    if (indexPath.row != 0) {
        cell.lineLabel.hidden = YES;
    }
    return cell;
}

//头部显示的内容
//设置元素大小
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    //    return CGSizeMake((KWIDTH - 0 * Scalewidth)/2, (KWIDTH - 20 * Scalewidth) /2);
    float cellWidth = (APP_FRAME_H - 40 ) / 4.0;
    return CGSizeMake(cellWidth,  cellWidth*1.1);
}
//定义每个UICollectionView 的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
// UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.chooseBlock (indexPath.row);
}


@end
