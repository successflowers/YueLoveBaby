//
//  ZJNetWorking.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/17.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ZJNetWorking.h"

@interface ZJNetWorking()
{
    BOOL _flag;
    id _result;
    NSString *_eMsg;
}
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
   /* [ZJNetWorkingHelper postJsonWithUrl:urlStr parameter:parameters
                                success:^(NSDictionary *responseObject){
                                    
                                    _flag = NO;_result = nil;_eMsg = nil;
                                    if (responseObject)
                                    {
                                        long errnoNumber = [[responseObject objectForKey:@"errno"] longValue];
                                        if (errnoNumber == 0){
                                            _flag = YES;
                                            _result = responseObject;
                                            //DDLog(@"success  %@",responseObject);
                                        }
                                    }else{
                                        _eMsg = @"数据异常";
                                        DDLog(@"%@",[responseObject objectForKey:@"errmsg"]);
                                    }
                                    callBack(_flag,_result,_eMsg);
                                }
                                   fail:^(NSError *error){
                                       if (error){
                                           _eMsg = [NSString stringWithFormat:@"%@",error];
                                           DDLog(@"%@",error);
                                       }
                                       callBack(_flag,_result,_eMsg);
                                   }
    ];*/ 
}

@end
