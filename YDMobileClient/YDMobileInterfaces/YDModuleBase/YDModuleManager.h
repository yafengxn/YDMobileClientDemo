//
//  YDModuleManager.h
//  YDMobileClient
//
//  Created by Daemonson on 2016/9/28.
//  Copyright © 2016年 Daemonson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YDBaseModule.h"

@interface YDModuleManager : NSObject
+ (instancetype)sharedModuleManager;

//! 加载默认的模块（由业务方传参来确定）
- (void)loadDefaultModules:(NSArray*)context;

//! 清理所有模块
- (void)unLoadAllModules;

//! 查询模块
- (YDBaseModule *)moduleWithName:(NSString*)moduleName;
@end
