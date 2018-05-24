//
//  YDBaseInterface.h
//  YDMobileClient
//
//  Created by Daemonson on 2016/9/28.
//  Copyright © 2016年 Daemonson. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YDBaseInterface <NSObject>

@end

@interface YDBaseInterface : NSObject <YDBaseInterface>

@property (nonatomic, assign, readonly) BOOL isImplemented;
@property (nonatomic, weak, readonly)   id<YDBaseInterface> impl;
@property (nonatomic, assign, readonly) Class cls;

+ (instancetype)sharedInterface;

//! 接口创建后，一定将实现类塞进来
- (void)implementWith:(id<YDBaseInterface>) impl;
@end
