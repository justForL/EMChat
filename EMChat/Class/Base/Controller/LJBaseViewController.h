//
//  LJBaseViewController.h
//  Chat
//
//  Created by James on 16/7/5.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMSDK.h"
@interface LJBaseViewController : UIViewController
- (void)alertWithMessage:(NSString *)message finish:(void (^)())finished;
@end
