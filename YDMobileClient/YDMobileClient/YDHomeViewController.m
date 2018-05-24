//
//  YDHomeViewController.m
//  YDMobileClient
//
//  Created by yafengxn on 2018/5/24.
//  Copyright © 2018年 yongche. All rights reserved.
//

#import "YDHomeViewController.h"

@interface YDHomeViewController ()

@end

@implementation YDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"Home";
    [self setupNavItems];
}


- (void)setupNavItems {
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]
                                 initWithTitle:@"我的"
                                 style:UIBarButtonItemStylePlain
                                 target:self
                                 action:@selector(openMy)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]
                                 initWithTitle:@"礼盒"
                                 style:UIBarButtonItemStylePlain
                                 target:self
                                 action:@selector(openGift)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)openMy {
    NSLog(@"------- YDHomeViewController ------ openMy --------");
    GETIFACE(iface, YDUserCenterProtocol, YDUserCenterModuleName)
    
    NSDictionary *paramDict = @{};
    UIViewController *myVc = [iface getMyViewControllerWithUserInfo:paramDict];
    UINavigationController *myNav = [[UINavigationController alloc] initWithRootViewController:myVc];
    [self presentViewController:myNav animated:YES completion:nil];
}

- (void)openGift {
    NSLog(@"------- YDHomeViewController ------ openGift --------");
}
@end
