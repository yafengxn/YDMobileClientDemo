//
//  YDMobileInterfaces.h
//  YDMobileInterfaces
//
//  Created by yafengxn on 2018/5/24.
//  Copyright © 2018年 yongche. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for YDMobileInterfaces.
FOUNDATION_EXPORT double YDMobileInterfacesVersionNumber;

//! Project version string for YDMobileInterfaces.
FOUNDATION_EXPORT const unsigned char YDMobileInterfacesVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <YDMobileInterfaces/PublicHeader.h>
#import <YDMobileInterfaces/YDBaseInterface.h>
#import <YDMobileInterfaces/YDBaseModule.h>
#import <YDMobileInterfaces/YDModuleManager.h>

// 用户中心
#import <YDMobileInterfaces/YDUserCenterProtocol.h>



// 统一定义的各个模块名称
#define YDUserCenterModuleName          @"YDUserCenterModule"


// 定义获取接口的宏
#define  GETIFACE(x, T, n) \
id<T> x = nil; \
{ \
YDModuleManager *moduleManager = [YDModuleManager sharedModuleManager]; \
YDBaseModule *m = [moduleManager moduleWithName: (n)];\
x = (id<T>) [m interfaceForProtocol: NSStringFromProtocol(@protocol(T))]; \
} \

