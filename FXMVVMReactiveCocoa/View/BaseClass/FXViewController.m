//
//  FXViewController.m
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/2/14.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import "FXViewController.h"
#import "FXViewModel.h"

@interface FXViewController ()

@property (nonatomic, strong, readwrite) FXViewModel *viewModel;

@end

@implementation FXViewController

// 调用 alloc 方法，[super alloc] 默认会调用 allocWithZone。
// 绑定 ViewModel
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    FXViewController *viewController = [super allocWithZone:zone];
    @weakify(viewController)
    [[viewController rac_signalForSelector:@selector(viewDidLoad)]
     subscribeNext:^(id  _Nullable x) {
         @strongify(viewController)
         [viewController bindViewModel];
    }];
    return viewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithViewModel:(FXViewModel *)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)bindViewModel {
    // System title view
    RAC(self, title) = RACObserve(self.viewModel, title);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
