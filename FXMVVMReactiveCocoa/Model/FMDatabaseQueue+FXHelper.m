//
//  FMDatabaseQueue+FXHelper.m
//  FXMVVMReactiveCocoa
//
//  Created by GUOFENGXIAN-FULLRICH-IMAC-PC on 2017/3/14.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import "FMDatabaseQueue+FXHelper.h"

@implementation FMDatabaseQueue (FXHelper)

+ (instancetype)sharedInstance {
    static FMDatabaseQueue *databaseQueue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        databaseQueue = [FMDatabaseQueue databaseQueueWithPath:FX_FMDB_PATH];
    });
    return databaseQueue;
}

@end
