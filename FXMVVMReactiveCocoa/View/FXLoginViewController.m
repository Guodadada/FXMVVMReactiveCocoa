//
//  FXLoginViewController.m
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/2/14.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import "FXLoginViewController.h"
#import "FXLoginViewModel.h"

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
    // Do any additional setup after loading the view from its nib.
    RAC(self.loginButton, enabled) = _viewModel.validLoginSignal;
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
