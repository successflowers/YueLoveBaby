//
//  ZJNetWorking+Testing.m
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/25.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "ZJNetWorking+Testing.h"

@implementation ZJNetWorking (Testing)
- (void)userRegistWithUserModelCallBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = @"https://api.miyabaobei.com/index/floatad";
    //NSStringFormat(URL_Server, URL_Banner);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    //[parameters setValue:APP_ID forKey:@"app_id"];
  [parameters setValue:APP_Auth_Session forKey:@"auth_session"];
//    [parameters setValue:APP_Bi_Session_Id forKey:@"bi_session_id"];
//    [parameters setValue:APP_Channel_Code forKey:@"channel_code"];
//    [parameters setValue:APP_Device_Token forKey:@"device_token"];
//
//
//    [parameters setValue:App_Dvc_Id forKey:@"dvc_id"];
//    [parameters setValue:APP_Ios_Idfa forKey:@"ios_idfa"];
//    [parameters setValue:APP_Ios_Mac forKey:@"ios_mac"];
//    [parameters setValue:APP_Ios_Openudid forKey:@"ios_openudid"];
//    [parameters setValue:APP_Ios_Uuid forKey:@"ios_uuid"];
//
//    [parameters setValue:APP_No_encrypt forKey:@"no_encrypt"];
//    [parameters setValue:APP_Params forKey:@"params"];
//    [parameters setValue:APP_Regid forKey:@"regid"];
//    [parameters setValue:APP_Session forKey:@"session"];
//    [parameters setValue:APP_Sign forKey:@"sign"];
//    [parameters setValue:APP_TimeStamp forKey:@"timestamp"];
//    [parameters setValue:APP_Version forKey:@"version"];
//
    [self getResponseDataWithUrl:urlStr parameter:parameters callBack:callBack];
}
@end
