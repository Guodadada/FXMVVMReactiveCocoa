//
//  FXHomepageViewModel.h
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/3/20.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import "FXTabBarViewModel.h"
#import "FXNewsViewModel.h"
#import "FXReposViewModel.h"
#import "FXExploreViewModel.h"
#import "FXProfileViewModel.h"

@interface FXHomepageViewModel : FXTabBarViewModel

@property (nonatomic, strong, readonly) FXNewsViewModel *newsViewModel;
@property (nonatomic, strong, readonly) FXReposViewModel *reposViewModel;
@property (nonatomic, strong, readonly) FXExploreViewModel *exploreViewModel;
@property (nonatomic, strong, readonly) FXProfileViewModel *profileViewModel;

@end
