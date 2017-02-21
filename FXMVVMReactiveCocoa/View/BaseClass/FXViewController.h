//
//  FXViewController.h
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/2/14.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FXViewModel;

@interface FXViewController : UIViewController

- (instancetype)initWithViewModel:(FXViewModel *)viewModel;

@end
