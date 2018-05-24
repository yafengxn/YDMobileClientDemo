//
//  YDBaseInterface.m
//  YDMobileClient
//
//  Created by Daemonson on 2016/9/28.
//  Copyright © 2016年 Daemonson. All rights reserved.
//

#import "YDBaseInterface.h"

@interface YDBaseInterface()
@property (nonatomic, weak)   id<YDBaseInterface>       impl;
@property (nonatomic, assign) Class                     cls;
@end

@implementation YDBaseInterface

+ (instancetype)sharedInterface {
    static dispatch_once_t onceToken;
    static id _sharedInterface = nil;
    dispatch_once(&onceToken, ^{
        _sharedInterface = [[self alloc] init];
    });
    return _sharedInterface;
}

- (void)implementWith:(id<YDBaseInterface>)impl {
    self.impl = impl;
    self.cls = [impl class];
}

- (BOOL)isImplemented {
    return  self.impl != nil;
}

//!是否响应选择子
- (BOOL) respondsToSelector:(SEL)aSelector {
    return (self.impl && [self.impl respondsToSelector:aSelector]) || (self.cls && [self.cls respondsToSelector:aSelector]);
}

//!通过实现类转发
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (self.impl && [self.impl respondsToSelector:aSelector]) {
        return self.impl;
    } else if (self.cls && [self.cls respondsToSelector:aSelector]) {
        return self.cls;
    } else {
        return nil;
    }
}
@end
