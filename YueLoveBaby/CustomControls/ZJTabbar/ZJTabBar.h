//
//  ZJTabBar.h
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/21.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const  ZJTabBarScrollViewTopNotification;
FOUNDATION_EXPORT NSString *const  ZJTabBarScrollViewDownNotification;

typedef void(^tabbarClickedBlock)(int tag);

@interface ZJTabBar : UIView

@property (nonatomic, copy) tabbarClickedBlock block;

@end
