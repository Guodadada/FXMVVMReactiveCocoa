//
//  OCTUser+FXPersistence.m
//  FXMVVMReactiveCocoa
//
//  Created by GUOFENGXIAN-FULLRICH-IMAC-PC on 2017/3/15.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import "OCTUser+FXPersistence.h"

@implementation OCTUser (FXPersistence)

+ (instancetype)fx_fetchUserWithRawLogin:(NSString *)rawLogin {
    if (rawLogin.length == 0) return nil;
    __block OCTUser *user = nil;
    [[FMDatabaseQueue sharedInstance] inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:@"SELECT * FROM User WHERE rawLogin = ? OR login = ? OR email = ? LIMIT 1;", rawLogin, rawLogin, rawLogin];
        @onExit {
            [rs close];
        };
        if (rs == nil) {
            FXLogLastError(db);
            return ;
        }
        if ([rs next]) {
            user = [MTLJSONAdapter modelOfClass:[OCTUser class] fromJSONDictionary:rs.resultDictionary error:nil];
        }
    }];
    return user;
}

@end
