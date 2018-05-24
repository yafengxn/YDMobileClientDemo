//
//  YDMyViewController.m
//  YDMobileModuleUserCenter
//
//  Created by yafengxn on 2018/5/24.
//  Copyright © 2018年 yongche. All rights reserved.
//

#import "YDMyViewController.h"

@interface YDMyViewController ()

@end

@implementation YDMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"个人信息";
    
    [self setupNavItems];
}

- (void)setupNavItems {
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]
                                 initWithTitle:@"关闭"
                                 style:UIBarButtonItemStylePlain
                                 target:self
                                 action:@selector(closeMy)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)closeMy {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
