//
//  FXNavigationControllerStack.h
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/2/12.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FXViewModelServices.h"

@interface FXNavigationControllerStack : NSObject

- (instancetype)initWithServices:(id<FXViewModelServices>)services;

@end
