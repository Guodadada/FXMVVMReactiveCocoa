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

/**
 1. ViewController 继承 FXViewController.
 2. FXViewController 中的 initWithViewModel: 方法获取到 ViewController 对应的 ViewModel，并赋值给私有 viewModel（readwrite） 属性.
 3. 子类绑定的 viewModel（readOnly）从父类中拿值。子类中声明的 viewModel 有两个作用，1.现在权限，2.调用到父类的 viewModel get 方法。
 */
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.usernameImageView.image = [UIImage fx_octicon_imageWithIdentifier:@"Person"
                                                                   size:CGSizeMake(22, 22)];
    self.passwordImageView.image = [UIImage fx_octicon_imageWithIdentifier:@"Lock"
                                                                   size:CGSizeMake(22, 22)];
}

- (void)bindViewModel {
    [super bindViewModel];
    // 绑定 userName, password
    RAC(self.viewModel, username) = self.usernameTextField.rac_textSignal;
    RAC(self.viewModel, password) = self.passwordTextField.rac_textSignal;
    // avatar
    @weakify(self)
    [RACObserve(self.viewModel, avatarURL) subscribeNext:^(NSURL *avatarURL) {
        @strongify(self)
        [self.avatarButton sd_setImageWithURL:avatarURL forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"default-avatar"]];
    }];
    // loginBtn
    RAC(self.loginButton, enabled) = self.viewModel.validLoginSignal;
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self)
        LOG(@"点击了登录按钮");
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
