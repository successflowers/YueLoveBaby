//
//  AppDelegate+AppService.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/26.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "AppDelegate+AppService.h"

@implementation AppDelegate (AppService)

#pragma mark ————— 初始化服务 —————
-(void)initService{
    
}

#pragma mark ————— 初始化window —————
-(void)initWindow{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = KWhiteColor;
    [self.window makeKeyAndVisible];
    
    [self initUserManager];

}

#pragma mark ————— 初始化用户系统 —————
- (void)initUserManager{
    //UIViewController *viewController = nil;
//    //读UserModel
//    UserModel *userModel = [UserModel readUserDefaults];
//    DDLog(@"token = %@",userModel.token);
//    if (!userModel)
//    {
//        viewController = [[RegisterViewController alloc] init];
//    }
//    else
//    {
//        viewController = [[HomeViewController alloc] init];
//    }
//    
   
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//    [nav setNavigationBarHidden:YES animated:YES];
    ZJMainTabBarViewController *vc = [[ZJMainTabBarViewController alloc] init];
    self.window.rootViewController = vc;
    
}

#pragma mark ————— 网络状态变化 —————
- (void)netWorkStateChange:(NSNotification *)notification
{
   
}

#pragma mark ————— OpenURL 回调 —————
// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return YES;
}

#pragma mark ————— 网络状态监听 —————
- (void)monitorNetworkStatus
{
   
}

+ (AppDelegate *)shareAppDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


- (UIViewController *)getCurrentVC{
    
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

-(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [self getCurrentVC];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }else
        if ([superVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)superVC).viewControllers.lastObject;
        }
    return superVC;
}

@end
