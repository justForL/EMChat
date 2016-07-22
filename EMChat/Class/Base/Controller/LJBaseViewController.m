//
//  LJBaseViewController.m
//  Chat
//
//  Created by James on 16/7/5.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LJBaseViewController.h"
#import "LJRegisterController.h"

@interface LJBaseViewController ()

@end

@implementation LJBaseViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([EMClient sharedClient].isLoggedIn) {
        
    } else {
        [self presentViewController:[[UIStoryboard storyboardWithName:@"RegisterController" bundle:nil]instantiateInitialViewController] animated:YES completion:nil];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)alertWithMessage:(NSString *)message finish:(void (^)())finished  {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        finished();
    }];
    [alertVC addAction:action];
    [self presentViewController:alertVC animated:YES completion:nil];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self setHidesBottomBarWhenPushed:YES];
}
@end
