//
//  LJRegisterController.m
//  Chat
//
//  Created by James on 16/7/5.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LJRegisterController.h"

@interface LJRegisterController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;

@end

@implementation LJRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerBtnClick:(id)sender {
    if (self.userNameTF.text.length == 0) {
        
        [self alertWithMessage:@"用户名不能为空" finish:nil];
        return;
    }
    if (self.passWordTF.text.length == 0) {
        [self alertWithMessage:@"密码不能为空" finish:nil];
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        

    EMError *error = [[EMClient sharedClient] registerWithUsername:self.userNameTF.text password:self.passWordTF.text];
    if (error==nil) {
        [self alertWithMessage:@"注册成功" finish:^{
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        //自动登录
        [self autoLogin];
        //登录
        [self login];

        
    }else{
        [self alertWithMessage:error.errorDescription finish:^{
            
        }];
    }
            });
}
- (IBAction)loginBtnClick:(id)sender {
    
    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"LJLoginViewController" bundle:nil]instantiateInitialViewController] animated:YES];
}

- (void)autoLogin {
    EMError *error = [[EMClient sharedClient] loginWithUsername:self.userNameTF.text password:self.passWordTF.text];
    if (!error)
    {
        [[EMClient sharedClient].options setIsAutoLogin:YES];
    }
}

- (void)login{
    EMError *error = [[EMClient sharedClient] loginWithUsername:self.userNameTF.text password:self.passWordTF.text];
    if (!error) {
        NSLog(@"登录成功");
    }
}

- (void)alertWithMessage:(NSString *)message finish:(void (^)())finished  {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        finished();
    }];
    [alertVC addAction:action];
    [self presentViewController:alertVC animated:YES completion:nil];
}

@end
