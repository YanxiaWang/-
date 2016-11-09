//
//  SystemMacro.h
//  UBang
//
//  Created by xiaoyao on 16/4/27.
//  Copyright © 2016年 tianqingchuanmei. All rights reserved.
//

#ifndef UIMacro_h
#define UIMacro_h


/*********************************************************
 *
 *  自定义宏区域
 *
 *********************************************************/
/**
 *  颜色
 */
#define COLOR_MainColor       UBCOLOR_RGB(0xf8f8f8) //灰色
#define COLOR_OrangeColor     UBCOLOR_RGB(0xff6700) //橙色
#define COLOR_GreenColor      UBCOLOR_RGB(0x409b18) //绿色
#define COLOR_RedColor        UBCOLOR_RGB(0xed604f) //红色
#define COLOR_BlueColor       UBCOLOR_RGB(0x339bf3) //蓝色
#define COLOR_WhiteColor      UBCOLOR_RGB(0xffffff) //白色
#define COLOR_BlackColor      UBCOLOR_RGB(0x333333) //白色

#define COLOR_MainFontColor   UBCOLOR_RGB(0x333333) //黑色
#define COLOR_SecondFontColor UBCOLOR_RGB(0x666666) //黑色
#define COLOR_ThirdFontColor  UBCOLOR_RGB(0x999999) //黑色
#define COLOR_FourthFontColor UBCOLOR_RGB(0xcccccc) //黑色
#define COLOR_LineColor       UBCOLOR_RGB(0xe1e1e1) //线条色
#define COLOR_SystemBackColor UB_RGB(246, 246, 246)

/**
 *  字体大小
 */
#define Font_TwentyTwo_S     UB_S_FONT(AdaptedWidth(22.0f))
#define Font_ThirtyTwo_S     UB_S_FONT(AdaptedWidth(32.0f))
#define Font_TwentyEight_S   UB_S_FONT(AdaptedWidth(28.0f))
#define Font_TwentyFive_S    UB_S_FONT(AdaptedWidth(25.0f))
#define Font_TwentyFive_B    UB_S_BOLD_FONT(AdaptedWidth(25.0f))
#define Font_Eighteen_S      UB_S_FONT(AdaptedWidth(18.0f))
#define Font_Eighteen_B      UB_S_BOLD_FONT(AdaptedWidth(18.0f))
#define Font_Sixteen_S       UB_S_FONT(AdaptedWidth(16.0f))
#define Font_Sixteen_B       UB_S_BOLD_FONT(AdaptedWidth(16.0f))
#define Font_Fifteen_S       UB_S_FONT(AdaptedWidth(15.0f))
#define Font_Fifteen_B       UB_S_BOLD_FONT(AdaptedWidth(15.0f))
#define Font_Fourteen_S      UB_S_FONT(AdaptedWidth(14.0f))
#define Font_Fourteen_B      UB_S_BOLD_FONT(AdaptedWidth(14.0f))
#define Font_Thirteen_S      UB_S_FONT(AdaptedWidth(13.0f))
#define Font_Thirteen_B      UB_S_BOLD_FONT(AdaptedWidth(13.0f))
#define Font_Twelve_S        UB_S_FONT(AdaptedWidth(12.0f))
#define Font_Twelve_B        UB_S_BOLD_FONT(AdaptedWidth(12.0f))
#define Font_Eleven_S        UB_S_FONT(AdaptedWidth(11.0f))
#define Font_Eleven_B        UB_S_BOLD_FONT(AdaptedWidth(11.0f))
#define Font_Ten_S           UB_S_FONT(AdaptedWidth(10.0f))
#define Font_Ten_B           UB_S_BOLD_FONT(AdaptedWidth(10.0f))
#define Font_Nine_S          UB_S_FONT(AdaptedWidth(9.0f))
#define Font_Nine_B          UB_S_BOLD_FONT(AdaptedWidth(9.0f))

/**
 *  布局
 */
#define H_TABBAR            49
#define H_NAVIGATIONBAR     64
#define H_STATUSBAR         20

//获取View的属性
#define GetViewWidth(view)  view.frame.size.width
#define GetViewHeight(view) view.frame.size.height
#define GetViewX(view)      view.frame.origin.x
#define GetViewY(view)      view.frame.origin.y

// 是否空对象
#define IS_NULL_CLASS(OBJECT) [OBJECT isKindOfClass:[NSNull class]]



/*********************************************************
 *
 *  常用宏区域（固定）
 *
 *********************************************************/
/** 主屏幕的高度 */
#define SCREENHEIGHT [[UIScreen mainScreen] bounds].size.height

/** 主屏幕的宽度 */
#define SCREENWIDTH  [[UIScreen mainScreen] bounds].size.width

/** 主屏幕的高度比例 */
#define SCREENHEIGHT_RATIO (SCREENHEIGHT / 568.0)

/** 主屏幕的宽度比例 */
#define SCREENWIDTH_RADIO  (SCREENWIDTH / 320.0)



/** 屏幕的分辨率 当结果为1时，显示的是普通屏幕，结果为2时，显示的是Retian屏幕 */
#define SCREEN_SCALE [[UIScreen mainScreen] scale]



/** 除去信号区的屏幕的frame */
#define APP_FRAME  [[UIScreen mainScreen] applicationFrame]

/** 应用程序的屏幕高度 */
#define APP_FRAME_H   [[UIScreen mainScreen] applicationFrame].size.height

/** 应用程序的屏幕宽度 */
#define APP_FRAME_W    [[UIScreen mainScreen] applicationFrame].size.width


/** 系统控件的默认高度 */
#define STATUS_BAR_H   (20.f)
#define TOP_BAR_H      (44.f)
#define BOTTOM_BAR_H   (49.f)
#define CELL_H (44.f)


/** 中英状态下键盘的高度 */
#define ENG_KEY_BOARD_H  (216.f)
#define CHN_KEY_BOARD_H  (252.f)



/*  获取自适应高度 */
#define AutoHeight(x) ((x) * (1.0) / (568) * (SCREENHEIGHT))

/*  获取自适应宽度 */
#define AutoWidth(x) ((x) * (1.0) / (320) * (SCREENWIDTH))


#define Scaleheight ([[UIScreen mainScreen] bounds].size.height > 480 ? [[UIScreen mainScreen] bounds].size.height/568 : [[UIScreen mainScreen] bounds].size.height/480)
#define Scalewidth [[UIScreen mainScreen] bounds].size.width/320

/** 中文字体 */
#define CHINESE_FONT_NAME  @"Heiti SC"
#define CHINESE_SYSTEM(x) [UIFont fontWithName:CHINESE_FONT_NAME size:x]

/** 字体大小 */
#define UB_FONT(NAME,FONTSIZE) [UIFont fontWithName:(NAME) size:(FONTSIZE)]
#define UB_S_FONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define UB_S_BOLD_FONT(FONTSIZE)   [UIFont boldSystemFontOfSize:FONTSIZE]

/** 不同屏幕尺寸字体适配（320，568是因为效果图为IPHONE5 如果不是则根据实际情况修改）*/
#define AdaptedWidth(x)  ceilf((x) * SCREENWIDTH_RADIO)
#define AdaptedHeight(x) ceilf((x) * SCREENHEIGHT_RATIO)
#define AdaptedFontSize(R)     CHINESE_SYSTEM(AdaptedWidth(R))

/** 颜色(RGB) */
#define UB_RGB(r,g,b)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1];
#define UB_RGBA(r,g,b,a)   [UIColor colorWithRed:(r) green:(g) blue:(b) alpha:(a)]
#define UB_RGBAS(r)   [UIColor colorWithRed:(r)/255.0f green:(r)/255.0f blue:(r)/255.0f alpha:1]

/** 颜色(0xFFFFFF) */
#define UBCOLOR_RGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UBCOLOR_RGBA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]


/** 资源路径 */
#define PNG_PATH(NAME) [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"png"]
#define JPG_PATH(NAME) [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"jpg"]
#define PATH(NAME,EXT) [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]

/** 加载图片 */
#define PNG_IMAGE_FILE(NAME)         [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define JPG_IMAGE_FILE(NAME)         [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define IMAGE_FILE(NAME,EXT)        [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]
#define GetIMAGE(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]


//Library/Caches 文件路径
#define FilePath ([[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil])
//获取temp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]


#endif /* UIMacro_h */
