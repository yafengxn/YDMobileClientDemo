//
//  YDBaseModule.m
//  YDMobileClient
//
//  Created by Daemonson on 2016/9/28.
//  Copyright © 2016年 Daemonson. All rights reserved.
//

#import "YDBaseModule.h"

@implementation YDBaseModule
- (instancetype)init {
    self = [super init];
    if (self) {
        _interfaceDic = [NSMutableDictionary dictionary];
        _interfaceArray = [NSMutableArray array];
        _routerArray = [NSMutableArray array];
    }
    return self;
}

- (void)setupService {
    NSException *e = [NSException exceptionWithName:@"BaseModule Exception"
                                             reason:@"setupService should override in subModule"
                                           userInfo:nil];
    [e raise];
    
    //在子模块实现中，启动各个模块的基础服务（如果有的话）
}


- (void)cleanService {
    NSException *e = [NSException exceptionWithName:@"BaseModule Exception"
                                             reason:@"cleanService should override in subModule"
                                           userInfo:nil];
    [e raise];
    
    //在子模块实现中，清理服务（如果有的话）
}


//! 注册该模块下的所有需对外提供的接口（业务由具体的module去实现）
- (void)registerInterfaces {
    NSException *e = [NSException exceptionWithName:@"BaseModule Exception"
                                             reason:@"registerInterfaces should override in subModule"
                                           userInfo:nil];
    [e raise];
    
    //在子模块实现中，调用各个实现类的注册方法，并把@{protocol <--> 接口对象} 加入到字典中
}

//! 注销接口
- (void)unRegisterInterfaces {
    
    NSException *e = [NSException exceptionWithName:@"BaseModule Exception"
                                             reason:@"unRegisterInterfaces should override in subModule"
                                           userInfo:nil];
    [e raise];
    
}

//! 根据参数查找对应的接口（参数形式为：com.yongche.ModuleName.ProtocolName）
- (YDBaseInterface *)interfaceForProtocol:(NSString*)protocol {
    YDBaseInterface *baseInterface = [self.interfaceDic objectForKey:protocol];
    return baseInterface;
}
@end
