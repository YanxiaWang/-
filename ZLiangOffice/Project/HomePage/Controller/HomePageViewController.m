
//
//  HomePageViewController.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/2.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "HomePageViewController.h"
#import "InfoCell.h"
#import "ADViewController.h"
#import "ADImageViewController.h"
#import "ADAndDeleteViewController.h"
#import "SignViewController.h"

@interface HomePageViewController ()

@property (strong, nonatomic) NSArray * localImages;
//文本滚动
@property (strong, nonatomic) NSMutableArray * infoArr;
//广告滚动
@property (strong, nonatomic) UICollectionView * infoCollectionView;
@property (strong, nonatomic) NSTimer * timer;
//功能滚动
@property (strong, nonatomic) UIScrollView * functionScroll;
@property (strong, nonatomic) UIPageControl * functionPage;
@property (strong, nonatomic) NSMutableArray * functionArr;
//广告图片轮播
@property (strong, nonatomic) NSMutableArray * adImageArr;
@property (strong, nonatomic) RollingCircleView * rollView;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    self.titleL.text = @"中粮置地广场";
    [self initnavigationBar];
    self.view.backgroundColor = COLOR_SystemBackColor;
    [self createUI];
    [self loadDate];
    //[self createInfoCollectionView];

}

#pragma mark -请求数据
-(void)loadDate{

    for (int i = 0; i<500; i++) {
        NSString * str = [NSString stringWithFormat:@"%d",i];
        [self.infoArr addObject:str];
    }
}
#pragma mark -创建界面
-(void)createUI{
    
    
    SDCycleScrollView * sd = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREENWIDTH, AutoHeight(210)) imageNamesGroup:self.localImages];
    [self.view addSubview:sd];
    [self.view sendSubviewToBack:sd];

    
    UIImageView * weatherView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"weatherBack"]];
    [self.view addSubview:weatherView];
    [weatherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(145));
        make.height.mas_equalTo(AutoHeight(35));
        make.width.mas_equalTo(AutoWidth(80));
        make.right.mas_equalTo(self.view);
    }];
    
    UIImageView * weatherState = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"weatherState"]];
    UILabel * temperatureL = [CommUtls createLabelWithTitle:@"-3~10" fontSize:Font_Fourteen_S textColor:COLOR_BlackColor];
    temperatureL.textAlignment = NSTextAlignmentCenter;
    UILabel * ultravioletL = [CommUtls createLabelWithTitle:@"AQI:16" fontSize:Font_Twelve_S textColor:COLOR_BlackColor];
    ultravioletL.textAlignment = NSTextAlignmentCenter;
    [weatherView addSubview:weatherState];
    [weatherView addSubview:temperatureL];
    [weatherView addSubview:ultravioletL];
    
    [weatherState mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weatherView.mas_top).offset(AutoHeight(8));
        make.bottom.mas_equalTo(weatherView.mas_bottom).offset(AutoHeight(-8));
        make.width.mas_equalTo(AutoWidth(20));
        make.left.mas_equalTo(weatherView).offset(AutoWidth(8));
    }];
    
    [temperatureL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weatherView).offset(AutoHeight(5));
        make.height.mas_equalTo(AutoHeight(10));
        make.left.mas_equalTo(weatherState.mas_right).offset(AutoWidth(3));
        make.right.mas_equalTo(weatherView).offset(AutoWidth(-8));
    }];
    [ultravioletL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weatherView).offset(AutoHeight(-5));
        make.height.mas_equalTo(AutoHeight(10));
        make.left.mas_equalTo(weatherState.mas_right).offset(AutoWidth(3));
        make.right.mas_equalTo(weatherView).offset(AutoWidth(-8));
    }];

    UIImageView * infoView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"infoBack"]];
    infoView.userInteractionEnabled = YES;
    [self.view addSubview:infoView];
    
    [infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(190));
        make.height.mas_equalTo(AutoHeight(60));
        make.left.mas_equalTo(self.view).offset(AutoWidth(5));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-5));
    }];
    
    
    UIButton * infoBtn = [CommUtls createButtonWithTitle:nil image:@"infoIcon" fontSize:nil textColor:nil target:nil sel:nil];
    [infoView addSubview:infoBtn];
    [infoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(infoView).offset(AutoHeight(25));
        make.bottom.mas_equalTo(infoView).offset(AutoHeight(-25));
        make.left.mas_equalTo(infoView).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(50));
    }];
    
    UIImageView * infoIconRight = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"infoIconRight"]];
    [self.view addSubview:infoIconRight];
    
    [infoIconRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(infoBtn.mas_top).offset(AutoHeight(-5));
        make.bottom.mas_equalTo(infoBtn.mas_bottom).offset(AutoHeight(5));
        make.left.mas_equalTo(infoBtn.mas_right).offset(AutoWidth(5));
        make.width.mas_equalTo(AutoWidth(1));
    }];
    
     //资讯轮播
    [self createInfoCollectionView];
    [infoView addSubview:_infoCollectionView];

    [_infoCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(infoView).offset(AutoHeight(5));
        make.bottom.mas_equalTo(infoView).offset(AutoHeight(-10));
        make.left.mas_equalTo(infoBtn.mas_right).offset(AutoWidth(10));
        make.right.mas_equalTo(infoView.mas_right).offset(AutoWidth(-10));
    }];
    
    
    
    
    //功能背景图
    UIView * functionIconView = [[UIView alloc]init];
    functionIconView.backgroundColor = COLOR_WhiteColor;
    [self.view addSubview:functionIconView];
    functionIconView.userInteractionEnabled = YES;
    [functionIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(infoView.mas_bottom).offset(AutoHeight(0));
        make.height.mas_equalTo(AutoHeight(83));
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
    }];
    
    //功能
    
    [self createFunctionScroll];
    [functionIconView addSubview:_functionScroll];
    //int i = [self loadFunctionKey];
    [_functionScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(functionIconView);
        make.height.mas_equalTo(AutoHeight(80));
        make.left.mas_equalTo(functionIconView);
        make.right.mas_equalTo(functionIconView);
    }];
    [self addFunctionContent];
    
    [functionIconView addSubview:_functionPage];
    [_functionPage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(functionIconView).offset(AutoHeight(-5));
        make.height.mas_equalTo(AutoHeight(10));
        make.left.mas_equalTo(functionIconView);
        make.right.mas_equalTo(functionIconView);
    }];
    //广告轮播
    CGFloat itemWidth = AutoWidth(250);
    CGFloat itemHeight = AutoHeight(160);
    
    RollingCircleView * rollView = [[RollingCircleView alloc]initWithoutMasonryItemMargin:20 itemSize:CGSizeMake(itemWidth, itemHeight) dataArray:self.adImageArr andClickItemBlock:^(int index) {
        ADImageViewController * adImageVC = [[ADImageViewController alloc]init];
        [self.navigationController pushViewController:adImageVC animated:YES];
        NSLog(@"index == %d",index);
    }];
    [self.view addSubview:rollView];
    [rollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(functionIconView.mas_bottom).offset(AutoHeight(10));
        make.height.mas_equalTo(AutoHeight(170));
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
    }];
}
#pragma mark - 功能键创建及实现
-(void)createFunctionScroll
{
    _functionScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    _functionScroll.bounces = NO;
    _functionScroll.showsVerticalScrollIndicator = NO;
    _functionScroll.showsHorizontalScrollIndicator = NO;
    _functionScroll.delegate = self;
    _functionScroll.contentOffset = CGPointMake(0, 0);
    _functionScroll.pagingEnabled = YES;
    //根据内容设置！！！contentSize
    _functionScroll.contentSize = CGSizeMake(SCREENWIDTH * 2, AutoHeight(60));
    
    UIColor * pageTintColor = UB_RGBA(0.92, 0.92, 0.92, 1.00);
    UIColor * currentPageColor = UB_RGBA(0.92, 0.65, 0.50, 1.00);
    _functionPage = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    _functionPage.backgroundColor = [UIColor clearColor];
    _functionPage.pageIndicatorTintColor = pageTintColor;
    _functionPage.currentPageIndicatorTintColor = currentPageColor;
    _functionPage.currentPage = 0;
    
    //根据内容设置！！！numberOfPages
    _functionPage.numberOfPages = 2;
    [_functionPage addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventValueChanged];
}


-(NSInteger)loadFunctionKey{
    NSArray * array = @[@"签到",@"访客预约",@"食堂",@"日用办公",@"增加删除"];
    for (int i = 0; i<6; i++) {
        NSString * string = array[i];
        [self.functionArr addObject:string];
    }
    NSInteger i;
    if (array.count%4 == 0) {
        i = array.count/4;
    }else
    {
        i = array.count/4 +1;
    }
    return i;
}

-(void)addFunctionContent{
    NSArray * array = @[@"签到",@"访客预约",@"食堂",@"日用办公",@"增加删除"];
    NSArray * imageArr = @[@"qd",@"fkyy",@"st",@"rybg",@"zjsc"];
    for (int i = 0; i<array.count; i++)
    {
        UIView * functionView = [[UIView alloc]initWithFrame:CGRectMake((SCREENWIDTH/4)*i,0, SCREENWIDTH/4, AutoHeight(60))];
        functionView.userInteractionEnabled = YES;
        [_functionScroll addSubview:functionView];
        UIButton * functionBtn = [CommUtls createButtonWithTitle:nil image:imageArr[i] fontSize:nil textColor:nil target:self sel:@selector(functionBtnClicked:)];
        functionBtn.tag = i+1;
        [functionView addSubview:functionBtn];
        [functionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(functionView).offset(AutoHeight(12));
            make.height.mas_equalTo(AutoHeight(28));
            make.left.mas_equalTo(functionView).offset(SCREENWIDTH/12);
            make.right.mas_equalTo(functionView).offset(-SCREENWIDTH/12);
        }];
        UILabel * functionLabel = [CommUtls createLabelWithTitle:array[i] fontSize:Font_Eleven_S textColor:COLOR_BlackColor];
        functionLabel.textAlignment = NSTextAlignmentCenter;
        [functionView addSubview:functionLabel];
        [functionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(functionView).offset(AutoHeight(42));
            make.height.mas_equalTo(AutoHeight(28));
            make.left.mas_equalTo(functionView);
            make.right.mas_equalTo(functionView);
        }];
    }
}

-(void)pageChange:(id)sender
{
    //获取分页控件的当前页码号
    int currentPage = (int)_functionPage.currentPage;
    //设置内容视图的偏移位置
    [UIView animateWithDuration:0.5 animations:^{
        
        _functionScroll.contentOffset = CGPointMake(SCREENWIDTH * currentPage, 0);
        
    } completion:nil];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    _functionPage.currentPage = point.x / SCREENWIDTH;
}

-(void)functionBtnClicked:(id)sender{

    UIButton * functionBtn = (UIButton *)sender;
    if (functionBtn.tag == 5) {
        ADAndDeleteViewController * addAndDeleteVC = [[ADAndDeleteViewController alloc]init];

        [self.navigationController pushViewController:addAndDeleteVC animated:YES];
    }
    if (functionBtn.tag == 1) {
        SignViewController * signVC = [[SignViewController alloc]init];
        [self.navigationController pushViewController:signVC animated:YES];
    }

}


-(NSMutableArray *)functionArr{
    if (_functionArr == nil) {
        _functionArr = [[NSMutableArray alloc]init];
    }
    return _functionArr;
}


#pragma mark - 广告文本轮播
-(void)createInfoCollectionView{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    _infoCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    _infoCollectionView.dataSource = self;
    _infoCollectionView.delegate = self;
    _infoCollectionView.backgroundColor = COLOR_WhiteColor;
    _infoCollectionView.pagingEnabled = YES;
    _infoCollectionView.showsVerticalScrollIndicator = NO;
    _infoCollectionView.showsHorizontalScrollIndicator = NO;
    
    [_infoCollectionView registerClass:[InfoCell class] forCellWithReuseIdentifier:@"infocell"];
}

- (NSMutableArray *)infoArr{
    
    if (_infoArr==nil)
    {
        
        _infoArr = [[NSMutableArray alloc]init];
    }
    return _infoArr;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.infoArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    InfoCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"infocell" forIndexPath:indexPath];
    
    cell.adLabel.text = @"顶级写字楼的超一流硬件设施更顶级。";
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.infoCollectionView.frame.size.width ,self.infoCollectionView.frame.size.height);
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ADViewController * adVC = [[ADViewController alloc]init];
    [self.navigationController pushViewController:adVC animated:YES];
    
}

- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 广告图片轮播
- (NSMutableArray *)adImageArr{
    
    if (_adImageArr==nil) {
        
        _adImageArr = [NSMutableArray array];
        
        // 改变imageCount的个数 最多是10
        int imageCount = 1000;
        for (int i = 0; i < imageCount; i++) {
            
            NSString *imageName = [NSString stringWithFormat:@"ad"];
            [_adImageArr addObject:imageName];
        }
    }
    return _adImageArr;
}
#pragma mark - 背景图片轮播
-(NSArray *)localImages{
    
    if (!_localImages) {
        _localImages = @[@"homeBack.png",@"homeBack.png",@"homeBack.png",@"homeBack.png"];
    }
    return _localImages;
}


@end
