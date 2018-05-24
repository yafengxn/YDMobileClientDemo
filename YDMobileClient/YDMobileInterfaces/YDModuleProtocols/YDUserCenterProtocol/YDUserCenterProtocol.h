//
//  YDUserCenterProtocol.h
//  YDMobileClient
//
//  Created by yafengxn on 2018/5/24.
//  Copyright © 2018年 yongche. All rights reserved.
//

#ifndef YDUserCenterProtocol_h
#define YDUserCenterProtocol_h

#import <UIKit/UIkit.h>
#import "YDBaseInterface.h"

@protocol YDUserCenterProtocol <YDBaseInterface>

- (UIViewController *)getMyViewControllerWithUserInfo:(NSDictionary *)dict;

@end

#endif /* YDUserCenterProtocol_h */
