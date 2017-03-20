//
//  FXTabBarController.m
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/3/20.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import "FXTabBarController.h"

@interface FXTabBarController ()

@property (nonatomic, strong, readwrite) UITabBarController *tabBarController;

@end

@implementation FXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController = [[UITabBarController alloc] init];
    [self addChildViewController:self.tabBarController];
    [self.view addSubview:self.tabBarController.view];
}

// 自转
- (BOOL)shouldAutorotate {
    return self.tabBarController.selectedViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.tabBarController.selectedViewController.supportedInterfaceOrientations;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.tabBarController.selectedViewController.preferredStatusBarStyle;
}

@end
