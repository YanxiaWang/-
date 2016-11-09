//
//  DinnerPlaceViewController.m
//  ZLiangOffice
//
//  Created by wangyanxia on 16/11/4.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "DinnerPlaceViewController.h"
#import "ResturantCell.h"
#import "TomorrowDinnerViewController.h"
#import "RestaurantEnvViewController.h"
@interface DinnerPlaceViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UIScrollView *titleScrollView;
@property (nonatomic, strong)UIView * lineView;
@property (nonatomic,strong)UIScrollView *rootScrollView;                  //主视图
@property (nonatomic, assign) CGFloat userContentOffsetX;
@property (nonatomic, assign) BOOL isLeftScroll;
@property (nonatomic, strong)UITableView * ListtableView;
@end

@implementation DinnerPlaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavWithOneButtonwithTitle:@"员工餐厅" inView:self.view withrightImgName:@"shexiangtou" isRight:YES];
    [self createUI];
    [self addtableview];
}
- (void)createUI
{
    NSArray * titleArray = [NSArray arrayWithObjects:@"当日菜品",@"当日主食",@"明日菜品", nil];
    self.titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,AutoHeight(60), APP_FRAME_W, AutoHeight(50))];
    [self.view addSubview:self.titleScrollView];
    
    
    for (int i = 0; i < 3; i ++)
    {
        UIButton * titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        float space = (APP_FRAME_W-AutoWidth(3)*2-AutoWidth(100)*3)/2;
        titleBtn.frame = CGRectMake(AutoWidth(3)+(AutoWidth(100)+space)*i, AutoHeight(0), AutoWidth(100), AutoWidth(50));
        titleBtn.titleLabel.font = UB_S_FONT(14);
        [titleBtn setTitle:titleArray[i] forState:UIControlStateNormal];
        UIColor * SELECTIDCOLOR =   UB_RGB(192, 138, 99);
        UIColor * NORMALCOLOR =   UB_RGB(153, 153, 153);
        [titleBtn setTitleColor:NORMALCOLOR forState:UIControlStateNormal];//
        [titleBtn setTitleColor:SELECTIDCOLOR forState:UIControlStateSelected];
        
        [self.titleScrollView addSubview:titleBtn];
        if (i == 0)
        {
            titleBtn.selected = YES;
            self.lineView = [[UIView alloc] initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(48), AutoWidth(100), AutoHeight(2))];
            self.lineView.backgroundColor = SELECTIDCOLOR;
        }
        
        titleBtn.tag = i+600;
        [titleBtn addTarget:self action:@selector(changeClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.titleScrollView addSubview:self.lineView];
}
//上方标题
- (void)changeClick:(UIButton *)button
{
    
    self.lineView.frame = CGRectMake(button.left, button.height-AutoHeight(2), AutoWidth(100), AutoHeight(2));
    [UIView animateWithDuration:0.4 animations:^{
        _rootScrollView.contentOffset =CGPointMake((button.tag-600)*APP_FRAME_W, 0);
    }];
    
    
    for (int i=0; i<3; i++)
    {
        ((UIButton*)[self.view viewWithTag:600+i]).selected=NO;
    }
    
    button.selected=!button.selected;
    
}
- (void)addtableview
{
    //创建主滚动视图
//    _rootScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,AutoWidth(40), APP_FRAME_W, APP_FRAME_H - AutoHeight(40)-AutoHeight(64)-AutoHeight(49))];
//    _rootScrollView.contentSize = CGSizeMake(APP_FRAME_H*3, APP_FRAME_H-AutoWidth(40)-AutoWidth(64));
//    _rootScrollView.delegate = self;
//    _rootScrollView.pagingEnabled = YES;
//    _rootScrollView.userInteractionEnabled = YES;
//    _rootScrollView.showsHorizontalScrollIndicator = NO;
//    _rootScrollView.showsVerticalScrollIndicator = NO;
//    _rootScrollView.bounces = NO;
//    _userContentOffsetX = 0;
//    [_rootScrollView.panGestureRecognizer addTarget:self action:@selector(scrollHandlePan:)];
//    [self.view addSubview:_rootScrollView];
    
    // 报备
    _ListtableView = [[UITableView alloc] initWithFrame:CGRectMake(0,self.titleScrollView.bottom+AutoHeight(1), APP_FRAME_W, APP_FRAME_H-AutoHeight(64)-AutoHeight(80)) style:UITableViewStylePlain];
    _ListtableView.delegate = self;
    _ListtableView.dataSource = self;
    _ListtableView.tag = 10010;
    _ListtableView.backgroundColor = UB_RGB(247, 247, 247);
    _ListtableView.separatorStyle = UITableViewCellAccessoryNone;
    [_ListtableView registerClass:[ResturantCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_ListtableView];
//    //    带看
//    _lookTableView = [[UITableView alloc] initWithFrame:CGRectMake(DEF_SCREEN_WIDTH,DEF_Transform(1), DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT-DEF_Transform(64)-DEF_Transform(40)-DEF_Transform(49)) style:UITableViewStyleGrouped];
//    _lookTableView.delegate = self;
//    _lookTableView.dataSource = self;
//    _lookTableView.tag = 10011;
//    _lookTableView.backgroundColor = [UIColor clearColor];
//    _lookTableView.separatorStyle = UITableViewCellAccessoryNone;
//    //    _lookTableView.scrollEnabled = NO;
//    [_lookTableView registerClass:[RushCustomerCell class] forCellReuseIdentifier:@"cell"];
//    [_rootScrollView addSubview:_lookTableView];
//    
//    //    成交
//    _dealTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,DEF_Transform(1), DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT-DEF_Transform(64)-DEF_Transform(40)-DEF_Transform(49)) style:UITableViewStyleGrouped];
//    _dealTableView.delegate = self;
//    _dealTableView.dataSource = self;
//    _dealTableView.tag = 10012;
//    _dealTableView.backgroundColor = [UIColor clearColor];
//    _dealTableView.separatorStyle = UITableViewCellAccessoryNone;
//    //    _dealTableView.scrollEnabled = NO;
//    [_dealTableView registerClass:[RushCustomerCell class] forCellReuseIdentifier:@"cell"];
//    [_rootScrollView addSubview:_dealTableView];
    
}
#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ResturantCell * rankCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    rankCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
//    rankCell.backgroundColor = [UIColor whiteColor];
    //    [rankCell refreshCellWithDict:nil];
//    rankCell.isAgent = YES;
//    NSArray * rightArray = [NSArray arrayWithObjects:@"聚寓购_116",@"聚寓购_119",@"聚寓购_121", nil];
//    NSArray * rankArray = [NSArray arrayWithObjects:@"第一名",@"第二名",@"第三名", nil];
//    rankCell.rankView.image = [UIImage imageNamed:rightArray[indexPath.row]];
//    rankCell.rankLab.text = rankArray[indexPath.row];
//    if (indexPath.row == 0) {
//        rankCell.lineView.hidden = YES;
//    }
//    if (tableView.tag ==10010) {
//        
//        rankCell.rankIndex = 0;
//        if (_reportArr.count >0) {
//            rankCell.name = _reportArr[indexPath.row];
//        }
//    }else if (tableView.tag == 10011){
//        
//        rankCell.rankIndex = 1;
//        if (_lookArr.count >0) {
//            rankCell.name = _lookArr[indexPath.row];
//        }
//    }else if (tableView.tag == 10012){
//        rankCell.rankIndex = 2;
//        if (_dealArr.count >0) {
//            rankCell.name = _dealArr[indexPath.row];
//        }
//        
//    }
    
    
    return rankCell;
    
}

#pragma mark-tableview delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return AutoHeight(112);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
 return AutoHeight(10);
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 0.0f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TomorrowDinnerViewController * vc = [[TomorrowDinnerViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark 主视图逻辑方法

//滚动视图开始时
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
    
    
}

//滚动视图结束
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.rootScrollView) {
        //判断用户是否左滚动还是右滚动
        if (self.userContentOffsetX < scrollView.contentOffset.x) {
            self.isLeftScroll = YES;
        }
        else {
            self.isLeftScroll = NO;
        }
    }
    
}


- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    
}
//滚动视图释放滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
//    if (scrollView == self.rootScrollView) {
//        int tag = (int)scrollView.contentOffset.x/DEF_SCREEN_WIDTH +600;
//        UIButton *button = (UIButton *)[self.titleScrollView viewWithTag:tag];
//        [UIView animateWithDuration:0.25 animations:^{
//            self.lineView.frame = CGRectMake(button.left, button.height-DEF_Transform(2), DEF_Transform(40), DEF_Transform(2));
//            
//        }];
//        
//        for (int i=0; i<3; i++)
//        {
//            ((UIButton*)[self.view viewWithTag:600+i]).selected=NO;
//            
//        }
//        button.selected=!button.selected;
//    }
    
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
}
//传递滑动事件给下一层
-(void)scrollHandlePan:(UIPanGestureRecognizer*) panParam
{
    
}

- (void)rightAction:(UIButton *)sender
{
    RestaurantEnvViewController * envVC = [[RestaurantEnvViewController alloc]init];
    [self.navigationController pushViewController:envVC animated:YES];
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
