//
//  LoginViewController.m
//  GD_GoodMom
//
//  Created by lanou3g on 16/5/24.
//  Copyright © 2016年 温哲. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"
@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark----登录按钮
- (IBAction)loginAction:(id)sender {
    
    __weak LoginViewController *loginVC = self;
    
    UIAlertController *alertControlller = [UIAlertController alertControllerWithTitle:@"提示" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if ([alertControlller.message isEqualToString:@"登录成功"]) {
            [loginVC dismissViewControllerAnimated:YES completion:nil];
            
        }
        
    }];
    [alertControlller addAction:action];
    
    //判断用户名和密码是否为空
    if ([_userNameTextField.text isEqualToString:@""] || [_passwordTextField.text isEqualToString:@""]) {
        
        alertControlller.message = @"用户名或密码不能为空";
        [self presentViewController:alertControlller animated:YES completion:nil];
        
    }else{
        
        
        [AVUser logInWithUsernameInBackground:self.userNameTextField.text password:self.passwordTextField.text block:^(AVUser *user, NSError *error) {
            
            if (user != nil) {
                
                alertControlller.message = @"登录成功";
                User *user1 = [User new];
                
                user1.userName = _userNameTextField.text;
                user1.password = _passwordTextField.text;
                
                
                //存储数据到本地
                [FileHandle saveUserInfo:user1];
                NSLog(@"%@",user1);
                    //传值
                loginVC.completion(user1);
                
                 [loginVC dismissViewControllerAnimated:YES completion:nil];
                
                
            }
            
        }];
    
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

#pragma mark------注册按钮
- (IBAction)registerAction:(id)sender {
    
    __weak LoginViewController *loginVC = self;
    RegisterViewController *registerVC = [RegisterViewController new];
    [loginVC presentViewController:registerVC animated:YES completion:nil];
    
}
#pragma mark-----退出按钮
- (IBAction)exitAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
