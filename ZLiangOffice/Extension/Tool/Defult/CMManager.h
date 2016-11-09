//
//  CMManager.h
//  BMProject
//
//  Created by MengHuan on 15/4/19.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

/**
 *  常用方法管理器
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SingletonTemplate.h"   // 单例模板


@interface CMManager : NSObject

singleton_for_header(CMManager)



#pragma mark - 判断字符串是否为空
/**
 *  判断字符串是否为空
 *
 *  @param string 要判断的字符串
 *
 *  @return 返回YES为空，NO为不空
 */
- (BOOL)isBlankString:(NSString *)string;


#pragma mark - 判断是否为真实手机号码
/**
 *  判断是否为真实手机号码
 *
 *  @return 返回YES为真实手机号码，NO为否
 */
- (BOOL)checkInputMobile:(NSString *)mobileNum;


#pragma mark - 判断email格式是否正确
/**
 *  判断email格式是否正确
 *
 *  @param emailString 邮箱
 *
 *  @return 返回YES为Email格式正确，NO为否
 */
- (BOOL)isAvailableEmail:(NSString *)emailString;
#pragma mark - 判断身份证号是否正确
/**
 *  判断身份证号是否正确
 *
 *  @param identityCard 身份证号
 *
 *  @return 返回值是yes为正确,no为否
 */
- (BOOL) validateIdentityCard: (NSString *)identityCard;

#pragma mark - 姓名验证
/**
 *  姓名验证
 *
 *  @param name 姓名
 *
 *  @return 返回YES为姓名规格正确，NO为否
 */
- (BOOL)isValidateName:(NSString *)name;


#pragma mark - 时间戳转时间格式
/**
 *  时间戳转时间格式
 *
 *  @param timestamp    传入时间戳
 *  @param format       格式,如"yyyy-MM-dd HH:mm:ss"
 *
 *  @return 普通时间
 */
- (NSString *)changeTimestampToCommonTime:(long)time format:(NSString *)format;


#pragma mark - 时间格式转时间戳
/**
 *  时间格式转时间戳
 *
 *  @param time   普通时间
 *  @param format 格式,如"yyyy-MM-dd HH:mm:ss"
 *
 *  @return 时间戳
 */
- (long)changeCommonTimeToTimestamp:(NSString *)time format:(NSString *)format;


#pragma mark - 获取当前使用语言
/**
 *  获取当前使用语言
 *
 *  @return 当前使用语言
 */
- (NSString *)currentLanguage;


#pragma mark - 打印出项目工程里自定义字体名
/**
 *  打印出项目工程里自定义字体名
 */
- (void)printCustomFontName;
#pragma mark - 根据字符串的长度来计算label的宽
/**
 *  根据字符串的长度来计算label的宽
 *
 *  @param string label上面要显示的字符串
 *  @param font   label上面要显示的字符串的字体大小
 *
 *  @return 返回的是一个CGSize类型的
 */
#pragma mark -  根据字符串的长度来计算label的大小
/**
 *  根据字符串的长度来计算label的大小
 *
 *  @param string 传入的字符串
 *  @param font   字体大小
 *  @param width  lable的长度
 *
 *  @return 大小
 */
- (CGSize)calculationWidthWithStr:(NSString *)string withFont:(UIFont *)font withWidth:(CGFloat)width;

#pragma mark -  根据字符串的长度来计算label的大小
- (CGSize)calculationWidthWithStr:(NSString *)string withFont:(CGFloat)font;
+(CGFloat)kWidthWithStr:(NSString *)string withFont:(CGFloat)font;
#pragma mark - 6-12为数字和字母
/**
 *  验证密码格式
 */
- (BOOL)isValidatePassword:(NSString *)password;
- (CGSize)calculationWidthWithStr:(NSString *)string withFont:(UIFont *)fonet withWidth:(CGFloat)width;
@end
