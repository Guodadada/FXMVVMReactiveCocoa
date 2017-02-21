//
//  FXLoginViewModel.h
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/2/14.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import "FXViewModel.h"

@interface FXLoginViewModel : FXViewModel

@property (nonatomic, copy, readonly) NSURL *avatarURL;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, strong, readonly) RACSignal *validLoginSignal;
@property (nonatomic, strong, readonly) RACCommand *loginCommand;

@end
