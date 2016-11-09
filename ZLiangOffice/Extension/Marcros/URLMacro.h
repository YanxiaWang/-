//
//  URLMarcro.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#ifndef URLMacro_h
#define URLMacro_h

/*********************************************************
 *
 *  自定义宏区域
 *
 *********************************************************/


//#define __FINALSERVER__
#ifdef __FINALSERVER__

////正式服务器
//#define BaseURL @"http://agent.tyjinkong.net"       // 基类接口 java
//#define BaseServerURL @""BaseURL"/ubang/?action="   // 基类服务器接口 java
//#define SMSURL @""BaseURL"/sms/sms_new.php"         // 短信服务器接口 php
//#define UploadImgURL @""BaseURL"/Api/storeUserPic"  // 上传头像服务器接口 php
//#define DownloadImgURL @""BaseURL"/img_server/"     // 获取图片服务器接口 php
//#define HTMLURL @""BaseURL""                        // 获取HTML5接口 php
//#else
//
//
////测试服务器
//#define BaseURL @"http://106.38.36.131"             // 基类接口 java
//#define BaseServerURL @""BaseURL"/ubang/?action="   // 基类服务器接口 java
//#define SMSURL @""BaseURL"/sms/sms_new.php"         // 短信服务器接口 php
//#define UploadImgURL @""BaseURL"/Api/storeUserPic"  // 上传头像服务器接口 php
//#define DownloadImgURL @""BaseURL"/img_server/"     // 获取图片服务器接口 php
//#define HTMLURL @""BaseURL":92"                     // 获取HTML5接口 php

#endif



/*********************************************************
 *
 *  常用宏区域（固定）
 *
 *********************************************************/

#endif /* URLMacro_h */
