//
//  YDModuleManager.m
//  YDMobileClient
//
//  Created by Daemonson on 2016/9/28.
//  Copyright © 2016年 Daemonson. All rights reserved.
//

#import "YDModuleManager.h"

@interface YDModuleManager()
@property (nonatomic, strong) NSMutableDictionary      *moduleDic;
@property (nonatomic, strong) NSMutableArray           *moduleArray;
@end

@implementation YDModuleManager
+ (instancetype)sharedModuleManager {
    static dispatch_once_t _onceToken;
    static YDModuleManager *_instance = nil;
    dispatch_once(&_onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _moduleDic = [NSMutableDictionary dictionary];
        _moduleArray = [NSMutableArray array];
    }
    return self;
}


#pragma mark - 所有模块（加载&&清理）

//! 加载默认模块（由业务方传参来确定）
//最理想方式：传入dic，指定依赖模块；即key为当前启动模块，value为所依赖的模块
- (void)loadDefaultModules:(NSArray *)context {
    @synchronized (self) {
        // setup
        [context enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            Class klass = NSClassFromString(obj);
            if (klass) {
                YDBaseModule *module = [[klass alloc] init];
                self.moduleDic[obj] = module;
                [self.moduleArray addObject:module];
            }
        }];
        //先加载服务
        [self.moduleDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            YDBaseModule *module = obj;
            [module setupService];
        }];
        //再提供接口
        [self.moduleDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            YDBaseModule *module = obj;
            [module registerInterfaces];
        }];
        
    }
}

//! 清理所有模块
- (void)unLoadAllModules {
    for (YDBaseModule *module in self.moduleArray) {
        [module cleanService];
        [module unRegisterInterfaces];
    }
    
    [self.moduleArray removeAllObjects];
    
    [self.moduleDic removeAllObjects];
    
}

#pragma mark - 单个模块处理 （暂未开放）

//! 注册模块，moduleName形如：com.yongche.mobile.ModuleName
- (void)registerModule:(YDBaseModule *)module {
    //启动服务
    if (!module.isSetupService) {
        [module setupService];
    }
    
    //开启对外提供的接口
    if (!module.isRegisteredInterface) {
        [module registerInterfaces];
    }
    
    @synchronized (self) {
        [self.moduleDic setObject:module forKey:NSStringFromClass([module class])];
        [self.moduleArray addObject:module];
    }
}

- (void)registerModuleWithName:(NSString *)moduleName {
    Class cls = NSClassFromString(moduleName);
    if (cls) {
        YDBaseModule *module = [[cls alloc] init];
        [module setupService];
        [module  registerInterfaces];
        
        @synchronized (self) {
            [self.moduleDic setObject:module forKey:moduleName];
            [self.moduleArray addObject:module];
        }
    }
}

//! 查询模块
- (YDBaseModule *)moduleWithName:(NSString *)moduleName {
    return [self.moduleDic objectForKey:moduleName];
}

//! 注销模块(通过模块)
- (void)unRegisterModule:(YDBaseModule *)module {
    if (module) {
        [module cleanService];
        [module  unRegisterInterfaces];
        
        [self.moduleArray removeObject:module];
    }
    
    NSString *name = nil;
    for (NSString *key in self.moduleDic.allKeys) {
        if ([self.moduleDic objectForKey:key] == module) {
            name = key;
            break;
        }
    }
    if (name) {
        [self.moduleDic removeObjectForKey:name];
    }
}

//! 注销模块(通过模块名称)
- (void)unRegisterModuleWithName:(NSString *)name {
    if (name) {
        [self.moduleDic removeObjectForKey:name];
    }
    
    YDBaseModule *module = [self.moduleDic objectForKey:name];
    if (module) {
        [module cleanService];
        [module  unRegisterInterfaces];
        
        [self.moduleArray removeObject:module];
    }
}
@end
