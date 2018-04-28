//
//  ZJNetWorkingHelper.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/17.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  AFHTTPSessionManager;

typedef NS_ENUM(NSUInteger,ZJNetWorkingStatus)
{
    ZJNetWorkingStatusUnkown, //未知网络
    ZJNetWorkingStatusNotReachable, //无网络
    ZJNetWorkingStatusReachableViaWAN, //手机网络
    ZJNetWorkingStatusReachableViaWifi  //Wi-Fi网络
};

@interface ZJNetWorkingHelper : NSObject


+ (void)postJsonWithUrl:(NSString *)urlStr
              parameter:(NSDictionary *)parameters
                success:(void (^)(NSDictionary*responseObject))success
                   fail:(void(^)(NSError *error))fail;

@end
