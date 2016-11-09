//
//  DateTimePickerView.m
//  DateTimePicker
//
//  Created by fengs on 14-11-24.
//  Copyright (c) 2014年 fengs. All rights reserved.
//

#import "UBDatePickerView.h"

@implementation UBDatePickerView
@synthesize pickView = _pickView;
@synthesize toolBar = _toolBar;
@synthesize pickViewList = _pickViewList;
@synthesize delegate = _delegate;

@synthesize yearArray = _yearArray;
@synthesize monthArray = _monthArray;
@synthesize daysArray = _daysArray;
@synthesize hoursArray = _hoursArray;
@synthesize minutesArray = _minutesArray;
@synthesize selectedYearRow = _selectedYearRow;
@synthesize selectedMonthRow = _selectedMonthRow;
@synthesize selectedDayRow = _selectedDayRow;
@synthesize selectedHourRow = _selectedHourRow;
@synthesize selectedMinRow = _selectedMinRow;
@synthesize timeType = _timeType;



-(id)initWithWidth:(float)width Height:(float)height TimeType:(TimeType)tType WithSheetTitle:(NSString*)title{
    self = [super init];
    if (self)
	{
        self.backgroundColor = [UIColor whiteColor];
        self.timeType = tType;
        self.pickView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width,height)];
		self.pickView.backgroundColor = [UIColor whiteColor];
        
		self.toolBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 44)];
		self.toolBar.backgroundColor = [UIColor whiteColor];
        [self.pickView addSubview:self.toolBar];

        UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton setTitle:@"取消" forState:UIControlStateNormal];
        [leftButton setTitleColor:COLOR_BlueColor forState:UIControlStateNormal];
        leftButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [leftButton addTarget:self action:@selector(actionCancel) forControlEvents:UIControlEventTouchUpInside];
        [self.toolBar addSubview:leftButton];
        [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.toolBar.mas_left).offset(8);
            make.width.mas_equalTo(@50);
            make.centerY.mas_equalTo(self.toolBar.mas_centerY);
            make.height.mas_equalTo(self.toolBar.mas_height);
        }];

        UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightButton setTitle:@"确定" forState:UIControlStateNormal];
        [rightButton setTitleColor:COLOR_BlueColor forState:UIControlStateNormal];
        rightButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [rightButton addTarget:self action:@selector(actionDone) forControlEvents:UIControlEventTouchUpInside];
        [self.toolBar addSubview:rightButton];
        [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.toolBar.mas_right).offset(-8);
            make.width.mas_equalTo(leftButton.mas_width);
            make.centerY.mas_equalTo(self.toolBar.mas_centerY);
            make.height.mas_equalTo(self.toolBar.mas_height);
        }];
        
        
        UIButton * titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [titleButton setTitle:title forState:UIControlStateNormal];
        [titleButton setTitleColor:COLOR_ThirdFontColor forState:UIControlStateNormal];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [self.toolBar addSubview:titleButton];
        [titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(rightButton.mas_left);
            make.left.mas_equalTo(leftButton.mas_right);
            make.centerY.mas_equalTo(self.toolBar.mas_centerY);
            make.height.mas_equalTo(self.toolBar.mas_height);
        }];

        UIPickerView *pickList = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44,width,height-44)] ;
        pickList.showsSelectionIndicator = YES;//在当前选择上显示一个透明窗口
        pickList.delegate = self;
        pickList.dataSource = self;
        self.pickViewList = pickList;
        [self viewLoad:[NSDate date]];
        [self.pickView addSubview:pickList];
        [self setFrame:self.pickView.frame];
        [self addSubview:self.pickView];
    }
    return self;
}

-(void)viewLoad:(NSDate *)date{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // Get Current  Hour
    [formatter setDateFormat:@"HH"];
    NSString *currentHourString = [NSString stringWithFormat:@"%02ld时",(long)[[formatter stringFromDate:date] integerValue]];
    
    // Get Current  Minutes
    [formatter setDateFormat:@"mm"];
    NSString *currentMinutesString = [NSString stringWithFormat:@"%02ld分",(long)[[formatter stringFromDate:date] integerValue]];
    
    
    // PickerView -  Hours data
    self.hoursArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < 24 ; i++)
    {
        [self.hoursArray addObject:[NSString stringWithFormat:@"%02d时",i]];
    }
    
    // PickerView -  Mins data
    self.minutesArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 60; i++)
    {
        [self.minutesArray addObject:[NSString stringWithFormat:@"%02d分",i]];
    }
    
    
    
    if (self.timeType==timeDetail) {//timeDetail
        // Get Current Year
        [formatter setDateFormat:@"yyyy"];
        NSString *currentYearString = [NSString stringWithFormat:@"%@年",[formatter stringFromDate:date]];
        
        // Get Current  Month
        [formatter setDateFormat:@"MM"];
        NSString *currentMonthString = [NSString stringWithFormat:@"%ld月",(long)[[formatter stringFromDate:date] integerValue]];
        
        // Get Current  Date
        [formatter setDateFormat:@"dd"];
        NSString *currentDateString = [NSString stringWithFormat:@"%ld日",(long)[[formatter stringFromDate:date] integerValue]];
        
        // PickerView -  Years data
        self.yearArray = [[NSMutableArray alloc] init];
        for (int i = 1970; i <= 2050 ; i++)
        {
            [self.yearArray addObject:[NSString stringWithFormat:@"%d年",i]];
        }
        
        // PickerView -  Months data
        self.monthArray = [[NSMutableArray alloc] init];
        for (int i = 1; i <= 12 ; i++)
        {
            [self.monthArray addObject:[NSString stringWithFormat:@"%d月",i]];
        }
        
        // PickerView -  Days data
        self.daysArray = [[NSMutableArray alloc] init];
        for (int i = 1; i <= 31; i++)
        {
            [self.daysArray addObject:[NSString stringWithFormat:@"%d日",i]];
        }
        
        // PickerView - Default Selection as per current Date
        [self.pickViewList selectRow:[self.yearArray indexOfObject:currentYearString] inComponent:0 animated:YES];
        [self.pickViewList selectRow:[self.monthArray indexOfObject:currentMonthString] inComponent:1 animated:YES];
        [self.pickViewList selectRow:[self.daysArray indexOfObject:currentDateString] inComponent:2 animated:YES];
        [self.pickViewList selectRow:[self.hoursArray indexOfObject:currentHourString] inComponent:3 animated:YES];
        [self.pickViewList selectRow:[self.minutesArray indexOfObject:currentMinutesString] inComponent:4 animated:YES];
    }else if(self.timeType==timeChinese){//timeChinese
        
        // PickerView -  Days data
        self.daysArray = [[NSMutableArray alloc] initWithArray:@[@"今天",@"明天",@"2016"]];
        
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *today=[formatter dateFromString:[formatter stringFromDate:[NSDate date]]];
        date=[formatter dateFromString:[formatter stringFromDate:date]];
        
        NSTimeInterval secondsPerDay = 24 * 60 * 60;
        NSDate *tomorrow = [NSDate dateWithTimeInterval:secondsPerDay sinceDate:today];
        NSDate *theDayAfterTomorrow = [NSDate dateWithTimeInterval:secondsPerDay*2 sinceDate:today];
        NSString *currentDateString = @"";
        if ([date compare:today] == NSOrderedSame) {
            currentDateString=@"今天";
        }else if ([date compare:tomorrow] == NSOrderedSame) {
            currentDateString=@"明天";
        }else if ([date compare:theDayAfterTomorrow] == NSOrderedSame) {
            currentDateString=@"后天";
        }
        
        // PickerView - Default Selection as per current Date
        [self.pickViewList selectRow:[self.daysArray indexOfObject:currentDateString] inComponent:0 animated:YES];
        [self.pickViewList selectRow:[self.hoursArray indexOfObject:currentHourString] inComponent:1 animated:YES];
        [self.pickViewList selectRow:[self.minutesArray indexOfObject:currentMinutesString] inComponent:2 animated:YES];
        
    }else{//dateDetail
        // Get Current Year
        [formatter setDateFormat:@"yyyy"];
        NSString *currentYearString = [NSString stringWithFormat:@"%@年",[formatter stringFromDate:date]];
        
        // Get Current  Month
        [formatter setDateFormat:@"MM"];
        NSString *currentMonthString = [NSString stringWithFormat:@"%ld月",(long)[[formatter stringFromDate:date] integerValue]];
        
        // Get Current  Date
        [formatter setDateFormat:@"dd"];
        NSString *currentDateString = [NSString stringWithFormat:@"%ld日",(long)[[formatter stringFromDate:date] integerValue]];
        
        // PickerView -  Years data
        self.yearArray = [[NSMutableArray alloc] init] ;
        for (int i = 1970; i <= 2050 ; i++)
        {
            [self.yearArray addObject:[NSString stringWithFormat:@"%d年",i]];
        }
        
        // PickerView -  Months data
        self.monthArray = [[NSMutableArray alloc] init];
        for (int i = 1; i <= 12 ; i++)
        {
            [self.monthArray addObject:[NSString stringWithFormat:@"%d月",i]];
        }
        
        // PickerView -  Days data
        self.daysArray = [[NSMutableArray alloc] init];
        for (int i = 1; i <= 31; i++)
        {
            [self.daysArray addObject:[NSString stringWithFormat:@"%d日",i]];
        }
        
        // PickerView - Default Selection as per current Date
        [self.pickViewList selectRow:[self.yearArray indexOfObject:currentYearString] inComponent:0 animated:YES];
        [self.pickViewList selectRow:[self.monthArray indexOfObject:currentMonthString] inComponent:1 animated:YES];
        [self.pickViewList selectRow:[self.daysArray indexOfObject:currentDateString] inComponent:2 animated:YES];
    }
    
}

#pragma mark - 
#pragma mark - UIPickerViewDelegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (self.timeType==timeDetail) {//timeDetail
        if (component == 0)
        {
            self.selectedYearRow = row;
        }
        else if (component == 1)
        {
            self.selectedMonthRow = row;
            [self.pickViewList reloadComponent:2];
        }
        else if (component == 2)
        {
            self.selectedDayRow = row;
        }
        else if (component == 3)
        {
            self.selectedHourRow = row;
        }
        else if (component == 4)
        {
            self.selectedMinRow = row;
        }
    }else if(self.timeType == timeChinese){//timeChinese
        if (component == 0)
        {
            self.selectedDayRow = row;
        }
        else if (component == 1)
        {
            self.selectedHourRow = row;
        }
        else
        {
            self.selectedMinRow = row;
        }
    }else{//dateDetail
        if (component == 0)
        {
            self.selectedYearRow = row;
        }
        else if (component == 1)
        {
            self.selectedMonthRow = row;
            [self.pickViewList reloadComponent:2];
        }
        else if (component == 2)
        {
            self.selectedDayRow = row;
        }
    }
    
    [self.pickViewList reloadComponent:component];
}

#pragma mark - 
#pragma mark - UIPickerViewDatasource

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)reusingView {
    
    // Custom View created for each component
    
    UILabel *pickerLabel = (UILabel *)reusingView;
    if (pickerLabel == nil) {
        CGRect frame = CGRectMake(0.0, 0.0, 50, 60);
        pickerLabel = [[UILabel alloc] initWithFrame:frame];
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        pickerLabel.font = [UIFont systemFontOfSize:14.0f];;
        pickerLabel.textColor = [UIColor blackColor];
    }
    
    if (self.timeType==timeDetail) {//timeDetail
        
        if (component == 0)
        {
            pickerLabel.text =  [self.yearArray objectAtIndex:row]; // Year
        }
        else if (component == 1)
        {
            pickerLabel.text = [self.monthArray objectAtIndex:row];  // Month
        }
        else if (component == 2)
        {
            pickerLabel.text =  [self.daysArray objectAtIndex:row]; // Date
            
        }
        else if (component == 3)
        {
            pickerLabel.text =  [self.hoursArray objectAtIndex:row]; // Hours
        }
        else if (component == 4)
        {
            pickerLabel.text =  [self.minutesArray objectAtIndex:row]; // Mins
        }
        
    }else if(self.timeType == timeChinese){//timeChinese
        if (component == 0)
        {
            pickerLabel.text =  [self.daysArray objectAtIndex:row]; // Date
        }
        else if (component == 1)
        {
            pickerLabel.text =  [self.hoursArray objectAtIndex:row]; // Hours
        }
        else
        {
            pickerLabel.text =  [self.minutesArray objectAtIndex:row]; // Mins
        }
    }else{//dateDetail
        if (component == 0)
        {
            pickerLabel.text =  [self.yearArray objectAtIndex:row]; // Year
        }
        else if (component == 1)
        {
            pickerLabel.text = [self.monthArray objectAtIndex:row];  // Month
        }
        else if (component == 2)
        {
            pickerLabel.text =  [self.daysArray objectAtIndex:row]; // Date
            
        }
    }
    
    return pickerLabel;
    
}


//返回组件数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    if (self.timeType == timeDetail) {//timeDetail
        return 5;
    }else if(self.timeType == timeChinese){
        return 3;
    }else{//dateDetail
        return 3;
    }
}

// returns the # of rows in each component..
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (self.timeType == timeDetail) {//timeDetail
        if (component == 0)
        {
            return [self.yearArray count];
            
        }
        else if (component == 1)
        {
            return [self.monthArray count];
        }
        else if (component == 2)
        { // day
            if (self.selectedMonthRow == 0 || self.selectedMonthRow == 2 || self.selectedMonthRow == 4 || self.selectedMonthRow == 6 || self.selectedMonthRow == 7 || self.selectedMonthRow == 9 || self.selectedMonthRow == 11)
            {
                return 31;
            }
            else if (self.selectedMonthRow == 1)
            {
                int yearint = [[self.yearArray objectAtIndex:self.selectedYearRow]intValue ];
                
                if(((yearint %4==0)&&(yearint %100!=0))||(yearint %400==0)){
                    return 29;
                }
                else
                {
                    return 28; // or return 29
                }
            }
            else
            {
                return 30;
            }
        }
        else if (component == 3)
        { // hour
            return 24;
        }
        else
        { // min
            return 60;
        }
        
    }else if(self.timeType == timeChinese){//timehinese
        if (component == 0)
        { // day
            return 3;
        }
        else if (component == 1)
        { // hour
            return 24;
        }
        else
        { // min
            return 60;
        }
    }else{//dateDetail
        if (component == 0)
        {
            return [self.yearArray count];
        }
        else if (component == 1)
        {
            return [self.monthArray count];
        }
        else
        { // day
            if (self.selectedMonthRow == 0 || self.selectedMonthRow == 2 || self.selectedMonthRow == 4 || self.selectedMonthRow == 6 || self.selectedMonthRow == 7 || self.selectedMonthRow == 9 || self.selectedMonthRow == 11)
            {
                return 31;
            }
            else if (self.selectedMonthRow == 1)
            {
                int yearint = [[self.yearArray objectAtIndex:self.selectedYearRow]intValue ];
                
                if(((yearint %4==0)&&(yearint %100!=0))||(yearint %400==0)){
                    return 29;
                }
                else
                {
                    return 28; // or return 29
                }
            }
            else
            {
                return 30;
            }
        }
    }
}


#pragma mark -
#pragma mark - Others

// 选择完成
-(void)actionDone
{
    
    if (self.timeType == timeDetail)
    {//timeDetail
        [self.delegate selectBackDate:[NSString stringWithFormat:@"%@%@%@ %@%@",[self.yearArray objectAtIndex:[self.pickViewList selectedRowInComponent:0]],[self.monthArray objectAtIndex:[self.pickViewList selectedRowInComponent:1]],[self.daysArray objectAtIndex:[self.pickViewList selectedRowInComponent:2]],[self.hoursArray objectAtIndex:[self.pickViewList selectedRowInComponent:3]],[self.minutesArray objectAtIndex:[self.pickViewList selectedRowInComponent:4]]] andFrontDate:[NSString stringWithFormat:@"%@ %@:%@",[self.daysArray objectAtIndex:[self.pickViewList selectedRowInComponent:0]],[self.hoursArray objectAtIndex:[self.pickViewList selectedRowInComponent:3]],[self.minutesArray objectAtIndex:[self.pickViewList selectedRowInComponent:4]]]];
    }
    else if(self.timeType == timeChinese)
    {//timeChinese
        
        NSString * selectHour = [[self.hoursArray objectAtIndex:[self.pickViewList selectedRowInComponent:1]] substringWithRange:NSMakeRange(0,2)];
        NSString * selectMinute = [[self.minutesArray objectAtIndex:[self.pickViewList selectedRowInComponent:2]] substringWithRange:NSMakeRange(0,2)];
        
        NSTimeInterval secondsPerDay = 24 * 60 * 60;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *todayDate=[formatter dateFromString:[formatter stringFromDate:[NSDate date]]];
        if ([[self.daysArray objectAtIndex:[self.pickViewList selectedRowInComponent:0]] isEqual:@"今天"])
        {
            todayDate=[formatter dateFromString:[formatter stringFromDate:[NSDate date]]];
        }
        else if ([[self.daysArray objectAtIndex:[self.pickViewList selectedRowInComponent:0]] isEqual:@"明天"])
        {
            todayDate=[NSDate dateWithTimeInterval:secondsPerDay sinceDate:todayDate];
        }
        else if ([[self.daysArray objectAtIndex:[self.pickViewList selectedRowInComponent:0]] isEqual:@"后天"])
        {
            todayDate=[NSDate dateWithTimeInterval:secondsPerDay*2 sinceDate:todayDate];
        }
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyyMMdd"];
        NSString * selectTime = [NSString stringWithFormat:@"%@%@%@",[dateFormatter stringFromDate:todayDate],selectHour,selectMinute];
        if (![self compareCurrentTimeAndSelectTime:selectTime])
        {
            //[SVProgressHUD showErrorWithStatus:@"时间非法，请重新选择"];
            //[SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
            return;
        }
        
        NSString * backDateString = [NSString stringWithFormat:@"%@ %@:%@",[formatter stringFromDate:todayDate],selectHour,selectMinute];
        NSString * FrontDateString = [NSString stringWithFormat:@"%@ %@:%@",[self.daysArray objectAtIndex:[self.pickViewList selectedRowInComponent:0]],selectHour,selectMinute];
        [self.delegate selectBackDate:backDateString andFrontDate:FrontDateString];

    }
    else
    {
        [self.delegate selectBackDate:[NSString stringWithFormat:@"%@%@%@",[self.yearArray objectAtIndex:[self.pickViewList selectedRowInComponent:0]],[self.monthArray objectAtIndex:[self.pickViewList selectedRowInComponent:1]],[self.daysArray objectAtIndex:[self.pickViewList selectedRowInComponent:2]]] andFrontDate:[NSString stringWithFormat:@"%@ %@:%@",[self.daysArray objectAtIndex:[self.pickViewList selectedRowInComponent:0]],@"",@""]];
    }
    
    if (self.cancelButtonClickBlock)
    {
        self.cancelButtonClickBlock(nil);
    }
}

// 取消选择
- (void)actionCancel
{
    [self.delegate selectBackDate:nil andFrontDate:nil];
    
    if (self.cancelButtonClickBlock)
    {
        self.cancelButtonClickBlock(nil);
    }
}

#pragma mark - 自定义方法实现选中时间和当前时间比较
- (BOOL)compareCurrentTimeAndSelectTime:(NSString *)selectTime{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmm"];
    NSString *currentTime = [dateFormatter stringFromDate:[NSDate date]];
    if (selectTime.longLongValue - currentTime.longLongValue < 0)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}


#if 0

// UIPicker显示
- (void)showInView:(UIView *)view
{
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
        // 添加阴影
        UIView *shadowView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        shadowView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        shadowView.userInteractionEnabled = NO;
        shadowView.tag = 1024;
        [view addSubview:shadowView];
        [view bringSubviewToFront:shadowView];
        // 添加UIPickerView
        [self setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-self.pickView.frame.size.height, [UIScreen mainScreen].bounds.size.width, self.pickView.frame.size.height)];
        [view addSubview:self];
        [view bringSubviewToFront:self];
        // navigationItem 禁用
        UIViewController *viewController = [self viewController];
        viewController.navigationItem.leftBarButtonItem.enabled = NO;
        viewController.navigationItem.rightBarButtonItem.enabled = NO;
        // 除了UIPickerView外 禁用
        for (UIView *subView in [view subviews]) {
            if (![self isEqual:subView]) {
                subView.userInteractionEnabled = NO;
            }
        }
    } completion:^(BOOL isFinished){
        
    }];
}

// UIPicker隐藏
-(void)hidePickerView
{
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
        // 去掉阴影，去掉禁用
        for (UIView *subView in [[self superview] subviews]) {
            if (subView.tag == 1024) {
                [subView removeFromSuperview];
            }else{
                subView.userInteractionEnabled = YES;
            }
        }
        // UIPickerView隐藏
        [self setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        //  navigationItem可用
        UIViewController *viewController = [self viewController];
        viewController.navigationItem.leftBarButtonItem.enabled = YES;
        viewController.navigationItem.rightBarButtonItem.enabled = YES;
        
    } completion:^(BOOL isFinished){
        
    }];
}

// 通过UIView查找UIViewController
- (UIViewController *)viewController {
    UIResponder *responder = self;
    while (![responder isKindOfClass:[UIViewController class]]) {
        responder = [responder nextResponder];
        if (nil == responder) {
            break;
        }
    }
    return (UIViewController *)responder;
}


#endif


@end
