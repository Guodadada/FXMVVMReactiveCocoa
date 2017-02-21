//
//  FXNavigationProtocol.h
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/2/12.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FXViewModel.h"

@protocol FXNavigationProtocol <NSObject>

- (void)pushViewModel:(FXViewModel *)viewModel animated:(BOOL)animated;
- (void)popViewModelAnimated:(BOOL)animated;
- (void)popToViewModel:(FXViewModel *)viewModel animated:(BOOL)animated;
- (void)popToRootViewModelAnimated:(BOOL)animated;

- (void)presentViewModel:(FXViewModel *)viewModelToPresent animated: (BOOL)flag completion:(VoidBlock)completion;
- (void)dismissViewModelAnimated: (BOOL)flag completion: (VoidBlock)completion;
- (void)presentModalViewModel:(FXViewModel *)modalViewModel animated:(BOOL)animated;
- (void)dismissModalViewModelAnimated:(BOOL)animated;

- (void)resetRootViewModel:(FXViewModel *)viewModel;

@end
