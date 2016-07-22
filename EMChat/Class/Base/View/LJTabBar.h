//
//  LJTabBar.h
//  Chat
//
//  Created by James on 16/7/4.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
@class LJTabBar;
//声明一个代理协议
@protocol LJTabBarDelegate <NSObject>
@optional
- (void)tabBar:(LJTabBar *)tabBar withSelecteIndex:(NSInteger)index;

@end
@interface LJTabBar : UIView
@property (nonatomic, assign) id<LJTabBarDelegate> delegate;
- (void)addButtonWithImg:(UIImage *)image andImgSel:(UIImage *)imageSel;
@end
