//
//  DateTimePickerView.h
//  DateTimePicker
//
//  Created by fengs on 14-11-24.
//  Copyright (c) 2014年 fengs. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    timeDetail = 0,//具体时间(年 月 日 时 分)
    timeChinese = 1,//今天，明天，后天(日 时 分)
    dateDetail = 2,//日期选择(年 月 日)
} TimeType;

typedef void(^DatePickerButtonBlock)(id sender);

@protocol UBDatePickerViewDelegate <NSObject>
@optional
-(void)selectBackDate:(NSString *)backDate andFrontDate:(NSString *)frontDate;
@end

@interface UBDatePickerView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,strong) UIView *pickView;
@property (nonatomic,strong) UIView *toolBar;
@property (nonatomic,strong) UIPickerView *pickViewList;
@property (nonatomic,assign) id delegate;

@property (nonatomic,strong) NSMutableArray *yearArray;
@property (nonatomic,strong) NSMutableArray *monthArray;
@property (nonatomic,strong) NSMutableArray *daysArray;
@property (nonatomic,strong) NSMutableArray *hoursArray;
@property (nonatomic,strong) NSMutableArray *minutesArray;
@property (nonatomic,assign) NSInteger currentMonth;
@property (nonatomic,assign) NSInteger selectedYearRow;
@property (nonatomic,assign) NSInteger selectedMonthRow;
@property (nonatomic,assign) NSInteger selectedDayRow;
@property (nonatomic,assign) NSInteger selectedHourRow;
@property (nonatomic,assign) NSInteger selectedMinRow;
@property (nonatomic,assign) TimeType timeType;
@property (nonatomic,copy) DatePickerButtonBlock cancelButtonClickBlock;

-(id)initWithWidth:(float)width Height:(float)height TimeType:(TimeType)tType WithSheetTitle:(NSString*)title;
-(void)viewLoad:(NSDate *)date;
//- (void)showInView:(UIView *)view;
@end
