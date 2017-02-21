//
//  FXRouter.h
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/2/17.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FXViewController.h"
#import "FXViewModel.h"

@interface FXRouter : NSObject

/// Router
+ (instancetype)sharedInstance;

- (FXViewController *)viewControllerForViewModel:(FXViewModel *)viewModel;

@end
