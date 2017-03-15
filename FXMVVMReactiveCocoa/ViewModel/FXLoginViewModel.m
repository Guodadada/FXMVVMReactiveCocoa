//
//  FXLoginViewModel.m
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/2/14.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import "FXLoginViewModel.h"

@interface FXLoginViewModel ()

@property (nonatomic, copy,readwrite) NSURL *avatarURL;

@property (nonatomic, strong, readwrite) RACSignal *validLoginSignal;
@property (nonatomic, strong, readwrite) RACCommand *loginCommand;

@end

@implementation FXLoginViewModel

- (void)initialize {
    [super initialize];
    
    RAC(self, avatarURL) = [[RACObserve(self, username)
                             map:^(NSString *username) {
                                 return [[OCTUser fx_fetchUserWithRawLogin:username] avatarURL];
    }] distinctUntilChanged];
    
    _validLoginSignal = [RACSignal combineLatest:@[RACObserve(self, username), RACObserve(self, password)]
                                          reduce:^(NSString *username, NSString *password){
        return @(username.length > 0 && password.length > 0);
    }];
    
    
}

@end
