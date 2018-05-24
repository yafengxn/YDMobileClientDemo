//
//  YDUserCenterImpl.m
//  YDMobileModuleUserCenter
//
//  Created by yafengxn on 2018/5/24.
//  Copyright © 2018年 yongche. All rights reserved.
//

#import "YDUserCenterImpl.h"
#import "YDMyViewController.h"

@implementation YDUserCenterImpl

+ (instancetype)shareInterface {
    static dispatch_once_t onceToken;
    static YDUserCenterImpl *_impl = nil;
    dispatch_once(&onceToken, ^{
        _impl = [[YDUserCenterImpl alloc] init];
    });
    
    return _impl;
}


- (UIViewController *)getMyViewControllerWithUserInfo:(NSDictionary *)dict {
    YDMyViewController *myVC = [[YDMyViewController alloc] init];
    // 处理dict
    // ...
    return myVC;
}

@end
