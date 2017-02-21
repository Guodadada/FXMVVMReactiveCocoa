//
//  FXConstant.h
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/2/12.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#ifndef FXConstant_h
#define FXConstant_h

///-----
/// Log
///-----

#ifdef DEBUG
#define LOG(...) NSLog(@"\n(%s) 第-%d-行\n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__]);
#else
#define LOG(...);
#endif

///-----
/// Block
///-----

typedef void(^VoidBlock)();

#endif /* FXConstant_h */
