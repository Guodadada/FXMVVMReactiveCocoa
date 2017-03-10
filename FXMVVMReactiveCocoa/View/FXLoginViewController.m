//
//  FXLoginViewController.m
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/2/14.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import "FXLoginViewController.h"
#import "FXLoginViewModel.h"
#import "UIImage+FXOcticons.h"

@interface FXLoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *avatarButton;

@property (weak, nonatomic) IBOutlet UIImageView *usernameImageView;
@property (weak, nonatomic) IBOutlet UIImageView *passwordImageView;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (nonatomic, strong, readonly) FXLoginViewModel *viewModel;

@end

@implementation FXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.usernameImageView.image = [UIImage octicon_imageWithIdentifier:@"Person"
                                                                   size:CGSizeMake(22, 22)];
    self.passwordImageView.image = [UIImage octicon_imageWithIdentifier:@"Lock"
                                                                   size:CGSizeMake(22, 22)];
    
    RAC(_loginButton, enabled) = _viewModel.validLoginSignal;
    @weakify(self)
    [[_loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self)
        [self.viewModel.loginCommand execute:nil];
    }];
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
