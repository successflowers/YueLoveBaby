//
//  ZJNetWorking.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/17.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ZJNetWorking.h"

static BOOL flag;
static id result;
static NSString *eMsg;

@interface ZJNetWorking()

@end

@implementation ZJNetWorking

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static ZJNetWorking *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark ----- public methods ------
- (void)getResponseDataWithUrl:(NSString *)urlStr parameter:(NSDictionary*) parameters callBack:(BusinessOperationCallback)callBack
{
    
    [ZJNetWorkingHelper  postJsonWithUrl:urlStr parameter:parameters
                                success:^(NSDictionary *responseObject){
                                    
                                    flag = NO;result = nil;eMsg = nil;
                                    if (responseObject)
                                    {
                                        long errnoNumber = [[responseObject objectForKey:@"errno"] longValue];
                                        if (errnoNumber == 0){
                                            flag = YES;
                                            result = responseObject;
                                            //DDLog(@"success  %@",responseObject);
                                        }
                                    }else{
                                        eMsg = @"数据异常";
                                        DDLog(@"%@",[responseObject objectForKey:@"errmsg"]);
                                    }
                                    callBack(flag,result,eMsg);
                                }
                                   fail:^(NSError *error){
                                       if (error){
                                           eMsg = [NSString stringWithFormat:@"%@",error];
                                           DDLog(@"%@",error);
                                       }
                                       callBack(flag,result,eMsg);
                                   }
    ];
}


@end
