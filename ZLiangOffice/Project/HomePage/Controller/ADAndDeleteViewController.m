//
//  ADAndDeleteViewController.m
//  ZLiangOffice
//
//  Created by ZhiDaKe on 2016/11/5.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "ADAndDeleteViewController.h"
#import "AddAndDeleteCell.h"
#import "FunctionHeader.h"

@interface ADAndDeleteViewController ()

@end

@implementation ADAndDeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = COLOR_WhiteColor;
    self.titleLabel.text = @"功能选择";
    UIButton * backBtn = [CommUtls createButtonWithTitle:@"确定" image:nil fontSize:Font_Thirteen_S textColor:COLOR_BlackColor target:self sel:@selector(confirmF)];
    [self.naviView addSubview:backBtn];
    
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(25));
        make.height.mas_equalTo(AutoHeight(30));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
        make.width.mas_equalTo(AutoWidth(30));
    }];
    
    
    [self createUI];
    [self loadData];
}

-(void)confirmF{

    [self.navigationController popViewControllerAnimated:YES];

}

-(void)createUI{
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    layout.itemSize = CGSizeMake(SCREENWIDTH/4, AutoHeight(74));
    
    
    _cView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, AutoHeight(64), SCREENWIDTH,SCREENHEIGHT-AutoHeight(100)) collectionViewLayout:layout];
    
    _cView.dataSource = self;
    _cView.delegate = self;
    _cView.showsVerticalScrollIndicator = NO;
    _cView.showsHorizontalScrollIndicator = NO;
    _cView.backgroundColor = COLOR_WhiteColor;
    
    [_cView registerClass:[AddAndDeleteCell class] forCellWithReuseIdentifier:@"adddelete"];
    [_cView registerClass:NSClassFromString(@"FunctionHeader") forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.view addSubview:_cView];
}
-(void)loadData{

    NSArray * s1 = @[@"s1_b1",@"s1_b2",@"s1_b3",@"s1_b4",@"s1_b5",@"s1_b6"];
    NSArray * s2 = @[@"s2_b1",@"s2_b2",@"s2_b3",@"s2_b4",@"s2_b5",@"s2_b6",@"s2_b7"];
    NSArray * s3 = @[@"s3_b1",@"s3_b2",@"s3_b3"];
    NSArray * s4 = @[@"s4_b1",@"s4_b2",@"s4_b3",@"s4_b4",@"s4_b5",@"s4_b6",@"s4_b7",@"s4_b8"];
    
    [self.dataArr addObject:s1];
    [self.dataArr addObject:s2];
    [self.dataArr addObject:s3];
    [self.dataArr addObject:s4];
    
    NSArray * st1 = @[@"签到",@"访客预约",@"访客记录",@"绿植",@"桶装水",@"办公用品"];
    NSArray * st2 = @[@"美食",@"员工餐厅",@"优惠生活",@"名片制作",@"快递查询",@"爱婴空间",@"圈子"];
    NSArray * st3 = @[@"停车",@"洗车",@"充电"];
    NSArray * st4 = @[@"物业",@"借物",@"礼宾服务",@"物品迁出",@"联合办公",@"预约宝库",@"广告",@"呼吸",];
    [self.textArr addObject:st1];
    [self.textArr addObject:st2];
    [self.textArr addObject:st3];
    [self.textArr addObject:st4];
    
    self.headerArr = @[@"基本功能",@"服务",@"社区服务",@"中粮服务"];
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
    cell.addOrDelete.image = [UIImage imageNamed:@"addFunction"];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    FunctionHeader * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    if (kind == UICollectionElementKindSectionHeader) {
        headerView.label.text = self.headerArr[indexPath.section];
    }
    return headerView;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(SCREENWIDTH, AutoHeight(53));
    
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
