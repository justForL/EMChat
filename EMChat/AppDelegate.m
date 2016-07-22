//
//  AppDelegate.m
//  Chat
//
//  Created by James on 16/7/4.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "AppDelegate.h"
#import "LJNavigationController.h"
#import "LJTabBarController.h"
#import "EMSDK.h"
#import "EaseUI.h"
#define appKey @"2032251#chat"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self setUpUI];
    [self setUpEmClientWithapplication:application Options:launchOptions];
    
    self.window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [[LJTabBarController alloc]init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [UINavigationBar appearance].barTintColor = [UIColor colorWithHexString:@"11cd6e"];
    return YES;
}
/**
 *  融云相关设置
 *
 *  @param application   <#application description#>
 *  @param launchOptions <#launchOptions description#>
 */
- (void)setUpEmClientWithapplication:(UIApplication *)application Options:(NSDictionary *)launchOptions {
    EMOptions *options = [EMOptions optionsWithAppkey:appKey];
    options.apnsCertName = @"istore_dev";
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    
    [[EaseSDKHelper shareHelper] easemobApplication:application
                      didFinishLaunchingWithOptions:launchOptions
                                             appkey:appKey
                                       apnsCertName:@"istore_dev"
                                        otherConfig:@{kSDKConfigEnableConsoleLogger:[NSNumber numberWithBool:YES]}];
}
/**
 *  外观设置
 */

- (void)setUpUI {
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

    [[EMClient sharedClient] applicationDidEnterBackground:application];

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[EMClient sharedClient] applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
