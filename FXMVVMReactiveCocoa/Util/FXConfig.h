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

///------------
/// Client Info
///------------

#define FX_CLIENT_ID     @"ef5834ea86b53233dc41"
#define FX_CLIENT_SECRET @"6eea860464609635567d001b1744a052f8568a99"

///----------------------
/// Persistence Directory
///----------------------

#define FX_DOCUMENT_DIRECTORY     NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

#endif /* FXConfig_h */
