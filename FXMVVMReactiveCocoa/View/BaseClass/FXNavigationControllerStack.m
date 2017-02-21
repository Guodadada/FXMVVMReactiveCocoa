//
//  FXNavigationControllerStack.m
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/2/12.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import "FXNavigationControllerStack.h"
#import "FXRouter.h"

@interface FXNavigationControllerStack ()

@property (nonatomic, strong) id<FXViewModelServices> services;
@property (nonatomic, strong) NSMutableArray *navigationControllers;

@end

@implementation FXNavigationControllerStack

- (instancetype)initWithServices:(id<FXViewModelServices>)services {
    self = [super init];
    if (self) {
        _services = services;
        _navigationControllers = [[NSMutableArray alloc] init];
        [self registerNavigationHooks];
    }
    return self;
}

- (void)registerNavigationHooks {
    @weakify(self)
    [[(NSObject *)_services rac_signalForSelector:@selector(pushViewModel:animated:)] subscribeNext:^(id  _Nullable x) {
        
    }];
    
    [[(NSObject *)_services rac_signalForSelector:@selector(resetRootViewModel:)] subscribeNext:^(RACTuple *tuple) {
        @strongify(self)
        [self.navigationControllers removeAllObjects];
        // 通过 viewModel 拿到 viewController
        UIViewController *viewController = [[FXRouter sharedInstance] viewControllerForViewModel:tuple.first];
        
        FXSharedAppDelegate.window.rootViewController = viewController;
    }];
}

@end

