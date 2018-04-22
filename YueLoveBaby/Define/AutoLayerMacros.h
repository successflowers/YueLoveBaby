//
//  AutoLayerMacros.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/28.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#ifndef AutoLayerMacros_h
#define AutoLayerMacros_h

#pragma mark - 获取屏幕宽高
#define kStatusBarHeight    [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight       44.0
#define kTabBarHeight       ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kTopHeight          (kStatusBarHeight + kNavBarHeight)
#define kIOS5               (KScreenHeight>568 ?NO :YES)

#define KScreenWidth            ([[UIScreen mainScreen] bounds].size.width)
#define KScreenHeight           [[UIScreen mainScreen] bounds].size.height
#define kScreen_Bounds          [UIScreen mainScreen].bounds

#define Iphone6ScaleWidth       KScreenWidth/375.0
#define Iphone6ScaleHeight      KScreenHeight/667.0
#define kIOS7OffHeight          (kIOSVersions>=7.0 ? 64.0 : 0.0)

#pragma mark - 根据ip6的屏幕来拉伸
#define kRealValue(with)    ((with)*(KScreenWidth/375.0f))

#pragma mark - 自定义布局尺寸
#define underLineHeight 1.5f    //下划线高度
#define labelOrButtonSize  kIOS5? 50.f :55.f   //标签／按钮大小

#define loginToSignButtonGap 10.f   //登陆／注册按钮间距
#define kScreenToButtonGap   kIOS5? 22 :35    //屏幕／按钮间距

#define loginButtonTopScreenSideGap KScreenWidth/4.f  //注册按钮／屏幕边间距 （Login）

#define loginButtonToTopHeight kIOS5? KScreenHeight/10.f*6.5  :KScreenHeight/10.f*7  //登陆or注册按钮／Top高度 (CP Fitness)
#define CP_FitnessToTopHeight kIOS5? KScreenHeight/10.f*2.2 :KScreenHeight/10.f*2.5  // CP Fitness标签／Top高度

#define LoginLabelToTopHeight KScreenHeight/10.f*2 //Login标签／TOP高度
#define LoginButtonToTopHeight KScreenHeight/10.f*5.5 //Login标签／TOP高度 (Login)
#define UserNameToTopHeight KScreenHeight/10.f*4 //用户输入框／Top高度

#define ProfileToTopHeight KScreenHeight/10.f*2 //profile/Top高度
#define ProfileButtonToTopHeight KScreenHeight/10.f*5 //profile.btn /top 高度
#define ProfileButtonGap 15.f //profile.btn间距

#define SettingLabToTopHeight KScreenHeight/10.f*4.5

#define line_width 1.f


#endif /* AutoLayerMacros_h */
