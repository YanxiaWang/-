//
//  RestaurantViewController.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/6.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "RestaurantViewController.h"
#import "FoodSearchTableViewCell.h"
#import "ShopDetailViewController.h"
#import "OrderOnlineViewController.h"
@interface RestaurantViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UISearchBar * _searchBar;
}
@end

@implementation RestaurantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self CreateSearchBar];
    [self createNavWithOneButtonwithTitle:@"餐厅要加搜索" inView:self.view withrightImgName:@"shexiangtou" isRight:NO];
    [self createUI];
    
}
- (void)createUI
{
    UITableView * listTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, APP_FRAME_W, APP_FRAME_H-64) style:UITableViewStyleGrouped];
    listTableview.delegate = self;
    listTableview.dataSource = self;
    listTableview.backgroundColor = UB_RGB(243, 243, 243);
    listTableview.separatorColor = [UIColor clearColor];
    [self.view addSubview:listTableview];
}

#pragma mark  tableview delegate && datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return AutoHeight(200);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FoodSearchTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[FoodSearchTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    __weak typeof(self)  weakself = self;
    cell.orderClick = ^(){
        OrderOnlineViewController * orderVC = [[OrderOnlineViewController alloc]init];
        [weakself.navigationController pushViewController:orderVC animated:YES];
    };
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopDetailViewController * shopVC = [[ShopDetailViewController alloc]init];
    [self.navigationController pushViewController:shopVC animated:YES];
}








//创建搜索栏
-(void)CreateSearchBar{
    _searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 20, APP_FRAME_W, AutoHeight(44))];
    _searchBar.barStyle = UIBarStyleBlack;
    _searchBar.placeholder=@"请输入关键字";
    //显示取消按钮 默认NO
    _searchBar.showsCancelButton=YES;
    //显示书签按钮 默认NO
    _searchBar.showsBookmarkButton=YES;
    _searchBar.delegate=self;
    //将搜索栏绑定到表格视图
    [self.view addSubview:_searchBar];
}








//点击搜索按钮响应的回调方法
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"搜索按钮🔍");
//    if (!_searchArray) {
//        _searchArray=[[NSMutableArray alloc]init];
//    }
//    else{
//        [_searchArray removeAllObjects];
//    }
//    //获取搜索栏的文本内容
//    NSString *strSearch=searchBar.text;
//    //查找符合条件的数据Person对象列表
//    for (int i=0; i<[_dataArr count]; i++) {
//        Person *pPerson=[_dataArr objectAtIndex:i];
//        NSString *strName=pPerson.name;
//        NSRange range=[strName rangeOfString:strSearch];
//        if (range.location!=NSNotFound) {
//            [_searchArray addObject:pPerson];
//        }
//    }
//    
//    //数组深度拷贝 内存空间的内容 地址不一样
//    //_dataArr＝_searchArray
//    //_dataArr引用_searchArray的内存地址 而没有拷贝 内存地址是一样的
//    _dataArr=[_searchArray mutableCopy];
//    //_dataArray只拷贝内存空间存放的数据 不引用地址 所以地址不一样
//    //刷新表格视图
//    [self RelateStudent];
//    [mTableView reloadData];
}
//点击取消按钮响应的回调方法
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"取消按钮");
//    _dataArr=[_tempArray mutableCopy];
//    [self RelateStudent];
//    //NSLog(@"%ld",_dataArray.count);
//    [mTableView reloadData];
//    //软键盘消失
//    [_searchBar resignFirstResponder];
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
