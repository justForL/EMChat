//
//  LJTabBarController.m
//  Chat
//
//  Created by James on 16/7/4.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LJTabBarController.h"
#import "LJTabBar.h"
#import "LJNavigationController.h"
@interface LJTabBarController ()<LJTabBarDelegate>

@end

@implementation LJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    获取storyboard中的控制器
    
    UIViewController *v1 = [self loadViewControllerWithName:@"LJChatViewController"];
    UIViewController *v2 = [self loadViewControllerWithName:@"LJListViewController"];
    UIViewController *v3 = [self loadViewControllerWithName:@"LJMeViewController"];

    //    添加子控制器
    self.viewControllers = @[ v1, v2, v3 ];
    //    tabbar的view
    LJTabBar *tabBar = [[LJTabBar alloc] init];
    tabBar.delegate = self;
    tabBar.frame = self.tabBar.bounds;
    
    //    循环生成五个按钮
    for (int i = 0; i < self.viewControllers.count; i++) {
        
        //        拼接图片名
        NSString *img = [NSString stringWithFormat:@"TabBar%d", i + 1];
        NSString *imgSel = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        
        UIImage *image = [UIImage imageNamed:img];
        UIImage *imageSel = [UIImage imageNamed:imgSel];
        
        [tabBar addButtonWithImg:image andImgSel:imageSel];
        
        //    button.tag = i;
    }
    //    添加到当前的tabbar上
    [self.tabBar addSubview:tabBar];
}

- (void)tabBar:(LJTabBar *)tabBar withSelecteIndex:(NSInteger)index {
    self.selectedIndex = index;
}
- (UIViewController *)loadViewControllerWithName:(NSString *)name {
    //    获取sb
    UIStoryboard *sb = [UIStoryboard storyboardWithName:name bundle:nil];
    return [sb instantiateInitialViewController];
}
@end
