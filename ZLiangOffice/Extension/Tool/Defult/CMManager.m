//
//  CMManager.m
//  BMProject
//
//  Created by MengHuan on 15/4/19.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#import "CMManager.h"

@implementation CMManager

singleton_for_class(CMManager)



#pragma mark - 判断字符串是否为空
- (BOOL)isBlankString:(NSString *)string
{
    string  = [NSString stringWithFormat:@"%@",string];
    
    if (string == nil || string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    // 去掉前后空格，判断length是否为0
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    
    if ([string isEqualToString:@"(null)"] || [string isEqualToString:@"null"]) {
        return YES;
    }
    
    // 不为空
    return NO;
}





#pragma mark - 判断身份证号
- (BOOL) validateIdentityCard: (NSString *)identityCard
 {
         identityCard = [identityCard stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([identityCard length] != 18) {
                 return NO;
            }
       NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
         NSString *leapMmdd = @"0229";
         NSString *year = @"(19|20)[0-9]{2}";
         NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
         NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
         NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
        NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
        NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
         NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd  , @"[0-9]{3}[0-9Xx]"];
    
         NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
         if (![regexTest evaluateWithObject:identityCard]) {
                 return NO;
            }
         int summary = ([identityCard substringWithRange:NSMakeRange(0,1)].intValue + [identityCard substringWithRange:NSMakeRange(10,1)].intValue) *7+ ([identityCard substringWithRange:NSMakeRange(1,1)].intValue + [identityCard substringWithRange:NSMakeRange(11,1)].intValue) *9
                + ([identityCard substringWithRange:NSMakeRange(2,1)].intValue + [identityCard substringWithRange:NSMakeRange(12,1)].intValue) *10
                 + ([identityCard substringWithRange:NSMakeRange(3,1)].intValue + [identityCard substringWithRange:NSMakeRange(13,1)].intValue) *5
                 + ([identityCard substringWithRange:NSMakeRange(4,1)].intValue + [identityCard substringWithRange:NSMakeRange(14,1)].intValue) *8
                 + ([identityCard substringWithRange:NSMakeRange(5,1)].intValue + [identityCard substringWithRange:NSMakeRange(15,1)].intValue) *4
                 + ([identityCard substringWithRange:NSMakeRange(6,1)].intValue + [identityCard substringWithRange:NSMakeRange(16,1)].intValue) *2
                + [identityCard substringWithRange:NSMakeRange(7,1)].intValue *1 + [identityCard substringWithRange:NSMakeRange(8,1)].intValue *6
                 + [identityCard substringWithRange:NSMakeRange(9,1)].intValue *3;
         NSInteger remainder = summary % 11;
         NSString *checkBit = @"";
        NSString *checkString = @"10X98765432";
         checkBit = [checkString substringWithRange:NSMakeRange(remainder,1)];// 判断校验位
         return [checkBit isEqualToString:[[identityCard substringWithRange:NSMakeRange(17,1)] uppercaseString]];
     }
-(NSString *)getStringWithRange:(NSString *)str Value1:(int)v1 Value2:(int)v2{
    
    NSString * sub = [str substringWithRange:NSMakeRange(v1, v2)];
    
    return sub;
    
}


#pragma mark - 判断是否为真实手机号码

/*手机号码验证 MODIFIED BY HELENSONG*/
- (BOOL)isMobileNumber:(NSString *)mobileNum
{
    //1[0-9]{10}
    //^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$
    //    NSString *regex = @"[0-9]{11}";
    NSString *regex = @"^((13[0-9])|(147)|(157)|(177)|(15[^4,\\D])|(18[0,1,2,3,5-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:mobileNum];
    return isMatch;
}

- (BOOL)checkInputMobile:(NSString *)mobileNum
{
    if (mobileNum.length != 11)
    {
        
//        SHOW_ALERT(@"");
        return NO;
    }
        return YES;
//
//    /**
//     * 手机号码
//     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
//     * 联通：130,131,132,152,155,156,185,186
//     * 电信：133,1349,153,180,189
//     */
//    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
//    /**
//     10 * 中国移动：China Mobile
//     11 * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
//     12 */
//    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
//    /**
//     15 * 中国联通：China Unicom
//     16 * 130,131,132,152,155,156,185,186
//     17 */
//    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
//    /**
//     20 * 中国电信：China Telecom
//     21 * 133,1349,153,180,189
//     22 */
//    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
//    /**
//     25 * 大陆地区固话及小灵通
//     26 * 区号：010,020,021,022,023,024,025,027,028,029
//     27 * 号码：七位或八位
//     28 */
//    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
//    /**
//     *  并兼容14开头的
//     *
//     *  @param
//     *
//     *  @return 是否为14开头的手机号
//     */
//    NSString * phoneRegex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
//    
//    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
//    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
//    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
//    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
//    NSPredicate *regextespho = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
//    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
//        || ([regextestcm evaluateWithObject:mobileNum] == YES)
//        || ([regextestct evaluateWithObject:mobileNum] == YES)
//        || ([regextestcu evaluateWithObject:mobileNum] == YES)
//        || ([regextespho evaluateWithObject:mobileNum] == YES))
//    {
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }
 
    /*   //              @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
    NSString *MOBILE    = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString *CM        = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378]|7[7])\\d)\\d{7}$";   // 包含电信4G 177号段
    NSString *CU        = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString *CT        = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    //
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    BOOL res1 = [regextestmobile evaluateWithObject:mobileNum];
    BOOL res2 = [regextestcm evaluateWithObject:mobileNum];
    BOOL res3 = [regextestcu evaluateWithObject:mobileNum];
    BOOL res4 = [regextestct evaluateWithObject:mobileNum];
    
    if (res1 || res2 || res3 || res4 )
    {
        return YES;
    }
    
    return NO;
     */
}

#pragma mark - 判断email格式是否正确
- (BOOL)isAvailableEmail:(NSString *)emailString
{
    NSString *emailRegEx =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    //先把NSString转换为小写
    NSString *lowerString       = emailString.lowercaseString;
    
    return [regExPredicate evaluateWithObject:lowerString] ;
}

#pragma mark - 姓名验证
- (BOOL)isValidateName:(NSString *)name
{
    // 只含有汉字、数字、字母、下划线不能以下划线开头和结尾
    NSString *userNameRegex = @"^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    return [userNamePredicate evaluateWithObject:name];
}

#pragma mark - 时间戳转时间格式
- (NSString *)changeTimestampToCommonTime:(long)time format:(NSString *)format;
{
    //设置时间格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    
    //设置时区
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    return [NSString stringWithFormat:@"%@",[formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:time]]];
}


#pragma mark - 时间格式转时间戳
- (long)changeCommonTimeToTimestamp:(NSString *)time format:(NSString *)format
{
    //设置时间格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    
    //设置时区
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    return (long)[[formatter dateFromString:time] timeIntervalSince1970];
}


#pragma mark - 获取当前使用语言
- (NSString *)currentLanguage
{
    NSString *opinion   = [NSLocale preferredLanguages][0];
    NSDictionary *dict  = @{
                            @"chs"      : @"chs",
                            @"cht"      : @"cht",
                            @"jp"       : @"jp",
                            @"kr"       : @"kr",
                            @"zh-Hans"  : @"chs",
                            @"zh-Hant"  : @"cht",
                            @"ja"       : @"jp",
                            @"ko"       : @"kr",
                            };
    
    // 不满足以上整合的语种，则全部默认为 en 英文
    return dict[opinion] ? dict[opinion] : @"en";
}


#pragma mark - 打印出项目工程里自定义字体名
- (void)printCustomFontName
{
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames )
    {
        printf( "Family: %s \n", [familyName UTF8String]);
        
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for( NSString *fontName in fontNames )
        {
            printf( "\tFont: %s \n", [fontName UTF8String] );
        }
    }
}
#pragma mark -- 密码规则(6到16位包含数字或字母)
- (BOOL)isValidatePassword:(NSString *)password
{
    NSString *passwordRegex = @"^[A-Za-z0-9]{6,16}$";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passwordRegex];
    return [passwordTest evaluateWithObject:password];
}
#pragma mark -  根据字符串的长度来计算label的大小
- (CGSize)calculationWidthWithStr:(NSString *)string withFont:(CGFloat)font
{
    
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};
    CGSize ziTiSize = [string boundingRectWithSize:CGSizeMake(280, 3000)options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return ziTiSize;
}

#pragma mark -  根据字符串的长度来计算label的大小
- (CGSize)calculationWidthWithStr:(NSString *)string withFont:(UIFont *)fonet withWidth:(CGFloat)width
{
    
    NSDictionary *attribute = @{NSFontAttributeName:fonet};
    CGSize ziTiSize = [string boundingRectWithSize:CGSizeMake(width, 3000)options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return ziTiSize;
}

#pragma mark -  根据字符串的长度来计算label的宽
+(CGFloat)kWidthWithStr:(NSString *)string withFont:(CGFloat)font
{
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};
    CGSize ziTiSize = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, 15)options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return ziTiSize.width;
}

@end
