//
//  OCTUser+FXPersistence.h
//  FXMVVMReactiveCocoa
//
//  Created by GUOFENGXIAN-FULLRICH-IMAC-PC on 2017/3/15.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import <OctoKit/OctoKit.h>

@interface OCTUser (FXPersistence)

+ (instancetype)fx_fetchUserWithRawLogin:(NSString *)rawLogin;

@end
