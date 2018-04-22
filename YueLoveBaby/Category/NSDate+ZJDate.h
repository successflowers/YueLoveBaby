//
//  NSDate+ZJDate.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/28.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZJYearCompareResult)
{
    ZJYearCompareResult_LastYear = -1,
    ZJYearCompareResult_ThisYear = 0,
    ZJYearCompareResult_NextYear  = 1,
};

typedef NS_ENUM(NSInteger, ZJMonthCompareResult)
{
    ZJMonthCompareResult_LastMonth = -1,
    ZJMonthCompareResult_ThisMonth = 0,
    ZJMonthCompareResult_NextMonth = 1,
};

typedef NS_ENUM(NSInteger, ZJDayCompareResult)
{
    ZJDayCompareResult_LastDay = -1,
    ZJDayCompareResult_ThisDay = 0,
    ZJDayCompareResult_NextDay = 1,
};

@interface NSDate (ZJDate)

+ (NSInteger)day:(NSDate *)date;
+ (NSInteger)month:(NSDate *)date;
+ (NSInteger)year:(NSDate *)date;

+ (NSInteger)firstWeekdayInThisMonth:(NSDate *)date;

+ (NSInteger)totaldaysInThisMonth:(NSDate *)date;

+ (NSInteger)totaldaysInMonth:(NSDate *)date;

+ (NSDate *)lastMonth:(NSDate *)date;

+ (NSDate*)nextMonth:(NSDate *)date;

+ (BOOL)isThisDay:(NSDate *)compareDate;
+ (BOOL)isThisMonth:(NSDate *)compareDate;
+ (BOOL)isThisYear:(NSDate *)compareDate;

+ (NSInteger)compareYear:(NSDate *)compareDate;
+ (NSInteger)compareMonth:(NSDate *)compareDate;
+ (NSInteger)compareDay:(NSDate *)compareDate;



@end
