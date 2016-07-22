//
//  LJTabBar.m
//  Chat
//
//  Created by James on 16/7/4.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LJTabBar.h"

@interface LJTabBar ()
@property(nonatomic, weak) UIButton *currentBtn;
@end
@implementation LJTabBar

//新建按钮的方法，并设置默认图片和选中状态图片
- (void)addButtonWithImg:(UIImage *)image andImgSel:(UIImage *)imageSel {
    //创建按钮
    UIButton *button = [[UIButton alloc] init];
    
    //    设置按钮图片
    
    
    [button setImage:image forState:UIControlStateNormal ];
    
    [button setImage:imageSel forState:UIControlStateSelected];
    
    [button addTarget:self
               action:@selector(btnClick:)
     forControlEvents:UIControlEventTouchDown];
    //        button.backgroundColor = [UIColor redColor];
    //        添加到tabBar上
    [self addSubview:button];
}

//按钮的点击事件
- (void)btnClick:(UIButton *)sender {
    //    声明全局属性，取消上一次按钮的选中状态
    self.currentBtn.selected = NO;
    //    当前选中按钮变为yes
    sender.selected = YES;
    //    将当前按钮赋值给全局变量
    self.currentBtn = sender;
    //    切换控制器
    //    self.selectedIndex = sender.tag;
    if ([self.delegate respondsToSelector:@selector(tabBar:withSelecteIndex:)]) {
        [self.delegate tabBar:self withSelecteIndex:sender.tag];
    }
}


//设置按钮的frame
-(void)layoutSubviews{
    [super layoutSubviews];
    //    遍历当前的view 设置frame
    for (int i = 0; i<self.subviews.count; i++) {
        //        获取CZButton
        UIButton *button = self.subviews[i];
        //    按钮的宽高
        CGFloat btnW = kScreenWidth / self.subviews.count;
        CGFloat btnH = self.bounds.size.height;
        
        //        按钮的XY
        CGFloat btnX = i * btnW;
        CGFloat btnY = 0;
        //        设置button的frame
        button.frame = CGRectMake(btnX, btnY, btnW, btnH);
        //        设置button的tag用于切换页面
        button.tag = i;
        if (button.tag == 0) {
            [self btnClick:button];
        }
        
    }
}

@end
