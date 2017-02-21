//
//  FXViewModel.h
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/2/12.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FXViewModelServices;

@interface FXViewModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

- (instancetype)initWithServices:(id<FXViewModelServices>)services params:(NSDictionary *)params;
- (void)initialize;

@end
