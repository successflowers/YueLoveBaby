//
//  ZJNetWorkingHelper.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/17.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ZJNetWorkingHelper.h"
#import "NSString+Signature.h"
#import "NSString+TimeConvert.h"

@implementation ZJNetWorkingHelper

+ (AFHTTPSessionManager *)sharedSessionManager
{
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.requestSerializer.timeoutInterval = 10.0;
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        [manager.requestSerializer setValue:@"123" forHTTPHeaderField:@"x-access-id"];
//        [manager.requestSerializer setValue:@"123" forHTTPHeaderField:@"x-signature"];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain",nil];
    });
    return manager;
}

+ (void)postJsonWithUrl:(NSString *)urlStr
              parameter:(NSDictionary *)parameters
                success:(void (^)(NSDictionary*responseObject))success
                   fail:(void(^)(NSError *error))fail
{
    AFHTTPSessionManager *manager = [ZJNetWorkingHelper sharedSessionManager];
    
    
    [manager POST:urlStr parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject) {
            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            success(resultDic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            fail(error);
        }
    }];
}

@end
