//
//  LJLoginViewController.m
//  Chat
//
//  Created by James on 16/7/5.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LJLoginViewController.h"
#import "EMSDK.h"
@interface LJLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation LJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonClick:(id)sender {
    
    
    
    EMError *error = [[EMClient sharedClient] loginWithUsername:self.userNameTF.text password:self.passwordTF.text];
    if (!error) {
        NSLog(@"登录成功");
        [[EMClient sharedClient].options setIsAutoLogin:YES];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
