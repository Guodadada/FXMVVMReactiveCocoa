//
//  FXRouter.m
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/2/17.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import "FXRouter.h"

static FXRouter *sharedInstance = nil;

@interface FXRouter ()

@property (nonatomic, copy) NSDictionary *viewModelViewMappings;

@end

@implementation FXRouter

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

// 拿到 viewModel 对应的 controller
- (FXViewController *)viewControllerForViewModel:(FXViewModel *)viewModel {
    NSString *viewController = self.viewModelViewMappings[NSStringFromClass(viewModel.class)];
    
    NSParameterAssert([NSClassFromString(viewController) isSubclassOfClass:[FXViewController class]]);
    NSParameterAssert([NSClassFromString(viewController) instancesRespondToSelector:@selector(initWithViewModel:)]);
    
    return [[NSClassFromString(viewController) alloc] initWithViewModel:viewModel];
}

- (NSDictionary *)viewModelViewMappings {
    return @{
             @"FXLoginViewModel":@"FXLoginViewController",
             };
}

@end
