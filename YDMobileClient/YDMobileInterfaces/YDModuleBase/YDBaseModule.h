//
//  YDBaseModule.h
//  YDMobileClient
//
//  Created by Daemonson on 2016/9/28.
//  Copyright © 2016年 Daemonson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YDBaseInterface.h"

/*
 * @brief
 1、module下所有class的对外接口隐藏，通过module封装后统一提供；
 2、module下所有总线注册的class也都隐藏，通过module封装后提供；（待定？）
 3、管理对外提供接口（or总线注册）的存储结构：dic和array；
 根据入参查找接口(返回实现类的接口)，或者查找总线信号（根据入参返回RACSignal类型)
 4、module的创建、销毁、配置等等；
 */

@interface YDBaseModule : NSObject

@property (nonatomic, strong) NSMutableDictionary *interfaceDic;
@property (nonatomic, strong) NSMutableArray      *interfaceArray;
@property (nonatomic, strong) NSMutableArray      *routerArray;

@property(nonatomic, assign)  BOOL                 isRegisteredInterface; //注册接口
@property(nonatomic, assign)  BOOL                 isSetupService;        //注册服务

//! 初始化默认服务（尽量剥离跨模块依赖关系；业务由具体module去确定）
- (void)setupService;

//! 清理（具体业务module去确定）
- (void)cleanService;

//! 注册对外提供的接口（业务由具体的module去实现）
- (void)registerInterfaces;

//! 注销接口
- (void)unRegisterInterfaces;

//! 根据参数查找对应的接口
- (YDBaseInterface *)interfaceForProtocol:(NSString*)protocol;
@end
