//
//  FXViewModel.m
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/2/12.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import "FXViewModel.h"

@implementation FXViewModel

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    FXViewModel *viewModel = [super allocWithZone:zone];
    @weakify(viewModel)
    [[viewModel rac_signalForSelector:@selector(initWithServices:params:)] subscribeNext:^(id  _Nullable x) {
        @strongify(viewModel)
        [viewModel initialize];
    }];
    return viewModel;
}

- (instancetype)initWithServices:(id<FXViewModelServices>)services params:(NSDictionary *)params {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)initialize{}

@end
