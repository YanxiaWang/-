//
//  SmartCommunityViewController.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/2.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "SmartCommunityViewController.h"
#import "AddAndDeleteCell.h"
#import "SmartCommunityHeader.h"
#import "WashCarViewController.h"
@interface SmartCommunityViewController ()

@end

@implementation SmartCommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self initnavigationBar];
    self.titleL.text = @"中粮置地广场";
    self.titleL.textColor = COLOR_BlackColor;
    self.view.backgroundColor = COLOR_SystemBackColor;
    [self createUI];
    [self loadData];
}

-(void)createUI{

    UIView * headerView = [[UIView alloc]init];
    headerView.backgroundColor = COLOR_WhiteColor;
    [self.view addSubview:headerView];
    [self.view sendSubviewToBack:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view);
        make.height.mas_equalTo(AutoHeight(64));
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
    }];

    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    layout.itemSize = CGSizeMake(SCREENWIDTH/4, AutoHeight(74));
    
    
    _cView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, AutoHeight(64), SCREENWIDTH,SCREENHEIGHT) collectionViewLayout:layout];
    
    _cView.dataSource = self;
    _cView.delegate = self;
    _cView.showsVerticalScrollIndicator = NO;
    _cView.showsHorizontalScrollIndicator = NO;
    _cView.backgroundColor = COLOR_WhiteColor;
    
    [_cView registerClass:[AddAndDeleteCell class] forCellWithReuseIdentifier:@"adddelete"];
    [_cView registerClass:NSClassFromString(@"SmartCommunityHeader") forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.view addSubview:_cView];

}
-(void)loadData{
    

    NSArray * s1 = @[@"s3_b1",@"s3_b2",@"s3_b3"];
    NSArray * s2 = @[@"s4_b1",@"s4_b2",@"s4_b3",@"s4_b4",@"s4_b5",@"s4_b6",@"s4_b7",@"s4_b8"];
    [self.dataArr addObject:s1];
    [self.dataArr addObject:s2];

    NSArray * st1 = @[@"停车",@"洗车",@"充电"];
    NSArray * st2 = @[@"物业",@"借物",@"礼宾服务",@"物品迁出",@"联合办公",@"预约宝库",@"广告",@"呼吸",];
    [self.textArr addObject:st1];
    [self.textArr addObject:st2];
    self.headerBackArr = @[@"SERVICECOMMUNITY",@"COFCOSERVICE"];
    self.headerArr = @[@"社区服务",@"中粮服务"];
}
#pragma mark --collectionView协议

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArr.count;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return [self.dataArr[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AddAndDeleteCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"adddelete" forIndexPath:indexPath];
    cell.functionB.image = [UIImage imageNamed:self.dataArr[indexPath.section][indexPath.item]];
    cell.textLabel.text = self.textArr[indexPath.section][indexPath.item];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    SmartCommunityHeader * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    if (kind == UICollectionElementKindSectionHeader) {
        headerView.backLabel.text = self.headerBackArr[indexPath.section];
        headerView.label.text = self.headerArr[indexPath.section];
    }
    return headerView;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(SCREENWIDTH, AutoHeight(53));
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.item == 1) {
            WashCarViewController * washVC = [[WashCarViewController alloc]init];
            [self.navigationController pushViewController:washVC animated:YES];
        }
    }else{
        
    
    
    }
}

-(NSMutableArray *)dataArr
{
    if (!_dataArr)
    {
        
        _dataArr = [[NSMutableArray alloc]init];
        
    }
    return _dataArr;
}
-(NSMutableArray *)textArr{
    if (!_textArr)
    {
        
        _textArr = [[NSMutableArray alloc]init];
        
    }
    return _textArr;
}

- (NSArray *)headerArr
{
    if (!_headerArr)
    {
        
        _headerArr = [[NSArray alloc]init];
        
    }
    return _headerArr;
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
