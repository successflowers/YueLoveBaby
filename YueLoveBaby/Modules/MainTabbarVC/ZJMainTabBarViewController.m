//
//  ZJMainTabBarViewController.m
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/21.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "ZJMainTabBarViewController.h"
#import "ZJTabBar.h"
@interface ZJMainTabBarViewController ()

@property (nonatomic, strong) NSArray *controllsArr;
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *tabbarNomalImageArr;
@property (nonatomic, strong) NSArray *tabbarSelectedImageArr;
@property (nonatomic, strong) ZJTabBar *myTabBar;

@end

@implementation ZJMainTabBarViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView *subView in self.tabBar.subviews) {
        if (![subView isKindOfClass:[ZJTabBar class]]) {
            // 移除原生tabBar上的item
            [subView removeFromSuperview];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = KWhiteColor;
    [self configTabBarVC];
    [self configTabBar];
   
    ZJTabBar *tab =  [[ZJTabBar alloc] init];
    tab.block = ^(int tag) {
       self.selectedViewController = self.viewControllers[tag];
    };
    [self.view addSubview:tab];
}

#pragma mark - configTabBarVC and tabbar
- (void)configTabBarVC
{
    for (int i = 0; i< self.controllsArr.count; i++) {
        UIViewController *controls = self.controllsArr[i];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controls];
        [nav setNavigationBarHidden:YES animated:YES];
        [self addChildViewController:nav];
    }
}

- (void) configTabBar
{
    [[UITabBar appearance] setShadowImage:[UIImage getImageWithColor:KClearColor size:self.tabBar.frame.size]];
    [[UITabBar appearance] setBackgroundImage:[UIImage getImageWithColor:KClearColor size:self.tabBar.frame.size]];
}

#pragma mark - private methodds
#pragma mark - setter and getter
- (NSArray *)controllsArr
{
    if (!_controllsArr) {
        ZJHomeViewController *homeControl = [[ZJHomeViewController alloc] init];
        ZJClassViewController *classControl = [[ZJClassViewController alloc] init];
        ZJCircleViewController *circleControl = [[ZJCircleViewController alloc] init];
        ZJShoppingViewController *shoppingControl = [[ZJShoppingViewController alloc] init];
        ZJMeViewController *meControl = [[ZJMeViewController alloc] init];
        homeControl.view.backgroundColor = KRedColor;
        classControl.view.backgroundColor = KYellowColor;
        circleControl.view.backgroundColor = KGray2Color;
        shoppingControl.view.backgroundColor = KBlueColor;
        meControl.view.backgroundColor = KWhiteColor;
        _controllsArr = @[homeControl, classControl, circleControl, shoppingControl, meControl];
    }
    return _controllsArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
