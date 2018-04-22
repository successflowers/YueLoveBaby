//
//  ZJJumpIndicator.h
//  YueBaby
//
//  Created by 张敬 on 2018/4/18.
//  Copyright © 2018年 张敬. All rights reserved.
//

/*
  1.简介：自定义浏览页面跳跃指示器
  2.
 */

#import <UIKit/UIKit.h>

typedef void(^clickedStateTopBlock)(void);
typedef void(^clickedStateDownBlock)(void);

@interface ZJJumpIndicator : UIControl

@property (nonatomic, strong) UIImage *imageTop;
@property (nonatomic, strong) UIImage *imageDown;

@property (nonatomic, copy) clickedStateTopBlock stateTopBlock;
@property (nonatomic, copy) clickedStateDownBlock stateDownBlock;

@property (nonatomic, strong) UIColor *backColor;
@property (nonatomic, assign) float animationTime;

@end
