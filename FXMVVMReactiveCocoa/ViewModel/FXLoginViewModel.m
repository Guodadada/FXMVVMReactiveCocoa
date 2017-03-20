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
    
    // get avatarURL form FMDB
    RAC(self, avatarURL) = [[RACObserve(self, username)
                             map:^(NSString *username) {
                                 return [[OCTUser fx_fetchUserWithRawLogin:username] avatarURL];
                             }] distinctUntilChanged];
    
    self.validLoginSignal = [RACSignal combineLatest:@[RACObserve(self, username), RACObserve(self, password)]
                                              reduce:^(NSString *username, NSString *password){
                                                  return @(username.length > 0 && password.length > 0);
                                              }];
    
    @weakify(self)
    void (^doNext)(OCTClient *) = ^(OCTClient *authenticatedClient){
        LOG(@"run doNext");
    };
    
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSString *oneTimePassword) {
        @strongify(self)
        OCTUser *user = [OCTUser userWithRawLogin:self.username
                                           server:[OCTServer dotComServer]];
        return [[OCTClient signInAsUser:user
                              password:self.password
                       oneTimePassword:oneTimePassword
                                scopes:OCTClientAuthorizationScopesUser | OCTClientAuthorizationScopesRepository    // 登录的权限设置
                                  note:nil
                               noteURL:nil
                           fingerprint:nil] doNext:doNext];
    }];
    
    [OCTClient setClientID:FX_CLIENT_ID clientSecret:FX_CLIENT_SECRET];
}

@end
