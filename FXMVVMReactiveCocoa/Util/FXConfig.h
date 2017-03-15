//
//  FXConfig.h
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/2/18.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#ifndef FXConfig_h
#define FXConfig_h

///------------
/// AppDelegate
///------------

#define FXSharedAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

///----------------------
/// Persistence Directory
///----------------------

#define FX_DOCUMENT_DIRECTORY     NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

#endif /* FXConfig_h */
