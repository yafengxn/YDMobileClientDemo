//
//  YDUserCenterModule.m
//  YDMobileModuleUserCenter
//
//  Created by yafengxn on 2018/5/24.
//  Copyright © 2018年 yongche. All rights reserved.
//

#import "YDUserCenterModule.h"
#import "YDUserCenterImpl.h"

@implementation YDUserCenterModule

#pragma mark - 服务
- (void)setupService {
    [self registerUserCenterService];
    
    self.isSetupService = YES;
}

- (void)registerUserCenterService {
    
}

- (void)cleanService {
    self.isSetupService = NO;
}

#pragma mark - 接口
- (void)registerInterfaces {
    [self registerUserCenterInterfaces];
    
    self.isRegisteredInterface = YES;
}

- (void)registerUserCenterInterfaces {
    YDUserCenterImpl *impl = [YDUserCenterImpl shareInterface];
    YDBaseInterface *iface = [[YDBaseInterface alloc] init];
    
    [iface implementWith:impl];
    
    [self.interfaceDic setObject:iface forKey:NSStringFromProtocol(@protocol(YDUserCenterProtocol))];
    [self.interfaceArray addObject:iface];
}

- (void)unRegisterInterfaces {
    // 注销
    [self.interfaceDic removeAllObjects];
    [self.interfaceArray removeAllObjects];
    
    self.isRegisteredInterface = NO;
}
@end
