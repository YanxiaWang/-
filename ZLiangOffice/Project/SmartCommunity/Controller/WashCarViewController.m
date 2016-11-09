//
//  WashCarViewController.m
//  ZLiangOffice
//
//  Created by bluemobi on 16/11/7.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "WashCarViewController.h"

@interface WashCarViewController ()
@property (nonatomic, strong) UILabel * dateLabel;
@property (nonatomic, strong) UILabel * carTypeLabel;
@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) UILabel * priceLabel;


@end

@implementation WashCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"洗车";
    self.view.backgroundColor = COLOR_SystemBackColor;
    [self createUI];
}
-(void)createUI{
    
    [self initMap];
    
    
    UIImageView * washView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"washBack"]];
    [self.view addSubview:washView];
    washView.userInteractionEnabled = YES;
    
    [washView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_mapView.mas_bottom).offset(AutoHeight(-10));
        make.height.mas_equalTo(AutoHeight(215));
        make.left.mas_equalTo(self.view).offset(AutoWidth(10));
        make.right.mas_equalTo(self.view).offset(AutoWidth(-10));
    }];
    UIView * view1 = [[UIView alloc]init];
    //手势1
    UITapGestureRecognizer*tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(choiceDate)];
    [view1 addGestureRecognizer:tap1];
    [washView addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(washView);
        make.height.mas_equalTo(AutoHeight(42));
        make.left.mas_equalTo(washView);
        make.right.mas_equalTo(washView);
    }];
    UIImageView * choiceDateLeft = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"choiceDateLeft"]];
    UILabel * choiceDateLabel = [CommUtls createLabelWithTitle:@"选择时间" fontSize:Font_Fourteen_S textColor:COLOR_BlackColor];
    _dateLabel = [CommUtls createLabelWithTitle:@"2016/11/15" fontSize:Font_Twelve_S textColor:UB_RGBA(0.73, 0.73, 0.73, 1.00)];
    UIButton * choiceDateBtn = [CommUtls createButtonWithTitle:nil image:@"gotoChoiceDate" fontSize:nil textColor:nil target:self sel:nil];
    UIImageView * underLine1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"washPageUnderLine"]];
    
    [view1 addSubview:choiceDateLeft];
    [view1 addSubview:choiceDateLabel];
    [view1 addSubview:_dateLabel];
    [view1 addSubview:choiceDateBtn];
    [view1 addSubview:underLine1];

    [choiceDateLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view1).offset(AutoHeight(12));
        make.bottom.mas_equalTo(view1).offset(AutoHeight(-12));
        make.left.mas_equalTo(view1).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(20));
    }];
    [choiceDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view1).offset(AutoHeight(11));
        make.bottom.mas_equalTo(view1).offset(AutoHeight(-11));
        make.left.mas_equalTo(choiceDateLeft.mas_right).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(70));
    }];
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view1).offset(AutoHeight(11));
        make.bottom.mas_equalTo(view1).offset(AutoHeight(-11));
        make.left.mas_equalTo(choiceDateLabel.mas_right).offset(AutoWidth(1));
        make.width.mas_equalTo(AutoWidth(100));
    }];
    [choiceDateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view1).offset(AutoHeight(16));
        make.bottom.mas_equalTo(view1).offset(AutoHeight(-16));
        make.right.mas_equalTo(view1).offset(AutoWidth(-10));
        make.width.mas_equalTo(AutoWidth(17));
    }];
    [underLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(view1).offset(AutoHeight(-1));
        make.height.mas_equalTo(AutoHeight(1));
        make.right.mas_equalTo(view1).offset(AutoWidth(-10));
        make.left.mas_equalTo(view1).offset(AutoWidth(10));
    }];
    UIView * view2 = [[UIView alloc]init];
    //手势2
    UITapGestureRecognizer*tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(choiceCarType)];
    [view1 addGestureRecognizer:tap2];
    [washView addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view1.mas_bottom);
        make.height.mas_equalTo(AutoHeight(42));
        make.left.mas_equalTo(washView);
        make.right.mas_equalTo(washView);
    }];
    
    UIImageView * choiceCarTypeLeft = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"choiceCarTypeLeft"]];
    UILabel * choiceCarTypeLabel = [CommUtls createLabelWithTitle:@"选择车辆类型" fontSize:Font_Fourteen_S textColor:COLOR_BlackColor];
    _carTypeLabel = [CommUtls createLabelWithTitle:@"大众官图" fontSize:Font_Twelve_S textColor:UB_RGBA(0.73, 0.73, 0.73, 1.00)];
    UIButton * choiceCarTypeBtn = [CommUtls createButtonWithTitle:nil image:@"gotoChoiceCarType" fontSize:nil textColor:nil target:self sel:@selector(choiceCarType)];
    UIImageView * underLine2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"washPageUnderLine"]];
    [view2 addSubview:choiceCarTypeLeft];
    [view2 addSubview:choiceCarTypeLabel];
    [view2 addSubview:_carTypeLabel];
    [view2 addSubview:choiceCarTypeBtn];
    [view2 addSubview:underLine2];
    
    [choiceCarTypeLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view2).offset(AutoHeight(12));
        make.bottom.mas_equalTo(view2).offset(AutoHeight(-12));
        make.left.mas_equalTo(view2).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(20));
    }];
    [choiceCarTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view2).offset(AutoHeight(11));
        make.bottom.mas_equalTo(view2).offset(AutoHeight(-11));
        make.left.mas_equalTo(choiceDateLeft.mas_right).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(100));
    }];
    [_carTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view2).offset(AutoHeight(11));
        make.bottom.mas_equalTo(view2).offset(AutoHeight(-11));
        make.left.mas_equalTo(choiceCarTypeLabel.mas_right).offset(AutoWidth(1));
        make.width.mas_equalTo(AutoWidth(100));
    }];
    [choiceCarTypeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view2).offset(AutoHeight(14));
        make.bottom.mas_equalTo(view2).offset(AutoHeight(-14));
        make.right.mas_equalTo(view2).offset(AutoWidth(-13));
        make.width.mas_equalTo(AutoWidth(10));
    }];
    [underLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(view2).offset(AutoHeight(-1));
        make.height.mas_equalTo(AutoHeight(1));
        make.right.mas_equalTo(view2).offset(AutoWidth(-10));
        make.left.mas_equalTo(view2).offset(AutoWidth(10));
    }];
    
    UIView * view3 = [[UIView alloc]init];
    [washView addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view2.mas_bottom);
        make.height.mas_equalTo(AutoHeight(42));
        make.left.mas_equalTo(washView);
        make.right.mas_equalTo(washView);
    }];

    UIImageView * washTimeLeft = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"washTime"]];
    UILabel * timeL = [CommUtls createLabelWithTitle:@"时长" fontSize:Font_Fourteen_S textColor:COLOR_BlackColor];
    _timeLabel = [CommUtls createLabelWithTitle:@"预计50分钟" fontSize:Font_Twelve_S textColor:UB_RGBA(0.73, 0.73, 0.73, 1.00)];
    UIImageView * washPriceLeft = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"washPrice"]];
    UILabel * priceL = [CommUtls createLabelWithTitle:@"价格" fontSize:Font_Fourteen_S textColor:COLOR_BlackColor];
    _priceLabel = [CommUtls createLabelWithTitle:@"50/每次" fontSize:Font_Twelve_S textColor:UB_RGBA(0.73, 0.73, 0.73, 1.00)];
    UIImageView * underLine3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"washPageUnderLine"]];
    UIImageView * line1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"washPageUnderLine"]];

    [view3 addSubview:washTimeLeft];
    [view3 addSubview:timeL];
    [view3 addSubview:_timeLabel];
    [view3 addSubview:washPriceLeft];
    [view3 addSubview:priceL];
    [view3 addSubview:_priceLabel];
    [view3 addSubview:underLine3];
    [view3 addSubview:line1];

    [washTimeLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view3).offset(AutoHeight(12));
        make.bottom.mas_equalTo(view3).offset(AutoHeight(-12));
        make.left.mas_equalTo(view3).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(18));
    }];
    [timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view3).offset(AutoHeight(11));
        make.bottom.mas_equalTo(view3).offset(AutoHeight(-11));
        make.left.mas_equalTo(washTimeLeft.mas_right).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(30));
    }];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view3).offset(AutoHeight(11));
        make.bottom.mas_equalTo(view3).offset(AutoHeight(-11));
        make.left.mas_equalTo(timeL.mas_right).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(80));
    }];
    [underLine3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(view3).offset(AutoHeight(-1));
        make.height.mas_equalTo(AutoHeight(1));
        make.right.mas_equalTo(view3).offset(AutoWidth(-10));
        make.left.mas_equalTo(view3).offset(AutoWidth(10));
    }];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view3);
        make.bottom.mas_equalTo(underLine3.mas_bottom);
        make.left.mas_equalTo(self.view).offset(SCREENWIDTH/2);
        make.width.mas_equalTo(AutoWidth(1));

    }];

    [washPriceLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view3).offset(AutoHeight(12));
        make.bottom.mas_equalTo(view3).offset(AutoHeight(-12));
        make.left.mas_equalTo(line1).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(18));
    }];
    [priceL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view3).offset(AutoHeight(11));
        make.bottom.mas_equalTo(view3).offset(AutoHeight(-11));
        make.left.mas_equalTo(washPriceLeft.mas_right).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(30));
    }];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view3).offset(AutoHeight(11));
        make.bottom.mas_equalTo(view3).offset(AutoHeight(-11));
        make.left.mas_equalTo(priceL.mas_right).offset(AutoWidth(10));
        make.width.mas_equalTo(AutoWidth(80));
    }];
    
    UIButton * confirmBtn = [CommUtls createButtonWithTitle:@"预约" image:nil fontSize:Font_Fifteen_S textColor:COLOR_WhiteColor target:self sel:@selector(washConfirm)];
    [washView addSubview:confirmBtn];
    [confirmBtn setBackgroundImage:[UIImage imageNamed:@"washConfrimBack"] forState:UIControlStateNormal];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view3.mas_bottom).offset(AutoHeight(20));
        make.height.mas_equalTo(AutoHeight(40));
        make.left.mas_equalTo(washView).offset(AutoWidth(10));
        make.right.mas_equalTo(washView).offset(AutoWidth(-10));
    }];
}







-(void)initMap{

    _mapView = [[MKMapView alloc]init];
    [self.view addSubview:_mapView];
    
    [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AutoHeight(64));
        make.height.mas_equalTo(AutoHeight(270));
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
    }];
    
    _mapView.mapType = MKMapTypeStandard;
    /*
     * MKMapTypeStandard 标准地图
     * MKMapTypeSatellite 卫星地图
     * MKMapTypeHybrid 混合
     * MKMapTypeSatelliteFlyover 卫星云地图
     * MKMapTypeHybridFlyover 混合云地图
     */
    
    //设置显示比例尺
    MKCoordinateSpan span = MKCoordinateSpanMake(0.03, 0.03);
    //设置区域
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(40.003305, 116.326760);
    //    116.326760  纬度：40.003305
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
    //设置显示区域
    _mapView.region = region;
    //显示用户的位置
    _mapView.showsUserLocation = YES;
    //设置地图的跟踪模型
    _mapView.userTrackingMode = MKUserTrackingModeFollow;
    /**
     * MKUserTrackingModeFollowWithHeading 追踪位置和移动方向
     *MKUserTrackingModeFollow 追踪位置
     *MKUserTrackingModeNone 不追踪
     */
    //显示指南针
    _mapView.showsCompass = YES;
    //显示交通状况
    _mapView.showsTraffic = YES;
    //是否显示
    //建筑物
    _mapView.showsBuildings = YES;
    //设置地图是否可以滚动
    _mapView.scrollEnabled = YES;
    //指定代理
    //_mapView.delegate = self;
    
    //UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(addAnotationView:)];
    //gesture.minimumPressDuration = 0.5;
    //添加长按手势，添加大头针
    //[_mapView addGestureRecognizer:gesture];
}

-(void)choiceDate{
    NSLog(@"1");
}
-(void)choiceCarType{
    
}
-(void)washConfirm{

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
