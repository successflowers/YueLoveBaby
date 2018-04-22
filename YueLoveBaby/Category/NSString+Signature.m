//
//  NSString+Signature.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/17.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "NSString+Signature.h"
#import "NSString+HmacUtils.h"
#import "NSString+TimeConvert.h"

@implementation NSString (Signature)
+ (NSString *)signatureWithAppKey:(NSString *)appKey
                           secret:(NSString *)secret
                        parameter:(NSDictionary *)parameter
                            token:(NSString *)token
{
    NSString *signatureStr = @"";
    
    NSString *timestamp = [NSString obtainCurrentDateUTCTimeString];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:parameter];
    [dict setObject:appKey forKey:@"appkey"];
    [dict setObject:timestamp forKey:@"timestamp"];
    if (![token isEqualToString:@""] && token != nil) {
        [dict setObject:token forKey:@"token"];
    }
    NSString *sortedStr = [NSString sort:dict isASC:YES];
    signatureStr = [NSString hmac:sortedStr withKey:secret];
    return signatureStr;
}

//对字典进行排序
+ (NSString*)sort:(NSDictionary*)parameter isASC:(BOOL)isASC {
    if (parameter) {
        NSArray *allKeyArr = [parameter allKeys];
        NSArray *afterSortKeyArr;
        if (isASC) {
            afterSortKeyArr = [allKeyArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                NSComparisonResult result = [obj1 compare:obj2];
                return result;
            }];
        }else {
            afterSortKeyArr = [allKeyArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                NSComparisonResult result = [obj2 compare:obj1];
                return result;
            }];
        }
        NSString *resultStr = [NSString string];
        
        for (NSString *key in afterSortKeyArr) {
            NSString *valueString = [parameter objectForKey:key];
            NSString *temp = [NSString stringWithFormat:@"%@%@",key,valueString];
            resultStr = [resultStr stringByAppendingString:temp];
        }
        //        NSString *sortedStr = [resultStr lowercaseString];
        return resultStr;
    }
    return @"";
}

@end
