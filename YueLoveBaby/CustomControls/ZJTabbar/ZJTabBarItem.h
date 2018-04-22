//
//  ZJTabBarItem.h
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/22.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJTabBarItem : UIControl

@property (nonatomic, strong) UIImage *tabbarIcon;
@property (nonatomic, copy) NSString *tabbarText;
@property (nonatomic, strong) CATextLayer *tabbarTitleLayer;

@end
