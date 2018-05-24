//
//  YDUserCenterImpl.h
//  YDMobileModuleUserCenter
//
//  Created by yafengxn on 2018/5/24.
//  Copyright © 2018年 yongche. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YDMobileInterfaces/YDMobileInterfaces.h>

@interface YDUserCenterImpl : NSObject<YDUserCenterProtocol>

+ (instancetype)shareInterface;

@end
