//
//  NSString+TimeConvert.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/17.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "NSString+TimeConvert.h"

@implementation NSString (TimeConvert)

+ (NSString *)obtainCurrentDateUTCTimeString
{
    NSDate *date = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}
@end
