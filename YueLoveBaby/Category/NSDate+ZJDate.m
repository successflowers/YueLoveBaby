//
//  NSDate+ZJDate.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/28.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "NSDate+ZJDate.h"

@implementation NSDate (ZJDate)

+ (NSInteger)day:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components day];
}

+ (NSInteger)month:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components month];
}

+ (NSInteger)year:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components year];
}


+ (NSInteger)firstWeekdayInThisMonth:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;
}

+ (NSInteger)totaldaysInThisMonth:(NSDate *)date{
    NSRange totaldaysInMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return totaldaysInMonth.length;
}

+ (NSInteger)totaldaysInMonth:(NSDate *)date{
    NSRange daysInLastMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInLastMonth.length;
}

+ (NSDate *)lastMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

+ (NSDate*)nextMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

+ (BOOL)isThisDay:(NSDate *)compareDate
{
    BOOL isThisDay = NO;
    NSInteger today = [self day:[NSDate date]];
    NSInteger compareDay = [self day:compareDate];
    if (today == compareDay) {
        isThisDay = YES;
    }
    return isThisDay;
}

+ (BOOL)isThisMonth:(NSDate *)compareDate
{
    BOOL isThisMonth = NO;
    NSInteger month = [self day:[NSDate date]];
    NSInteger compareMonth= [self day:compareDate];
    if (month == compareMonth) {
        isThisMonth = YES;
    }
    return isThisMonth;
}

+ (BOOL)isThisYear:(NSDate *)compareDate
{
    BOOL isThisYear = NO;
    NSInteger year = [self day:[NSDate date]];
    NSInteger compareYear = [self day:compareDate];
    if (year == compareYear) {
        isThisYear = YES;
    }
    
    return isThisYear;
}



+ (NSInteger)compareDay:(NSDate *)compareDate {
    
    ZJDayCompareResult dayCompareResult = ZJDayCompareResult_ThisDay;\
    NSInteger isThisYear  = [self compareYear:compareDate];
    NSInteger isThisMonth = [self compareMonth:compareDate];
    
    NSInteger day = [self day:[NSDate date]];
    NSInteger compareDay = [self day:compareDate];
    NSInteger isThisDay = compareDay - day;
    
    switch (isThisYear) {
        case -1:
        {
            dayCompareResult = ZJDayCompareResult_LastDay;
        }
            break;
            
        case 0:
        {
           
            if (isThisMonth == 0) {
                if (isThisDay == 0) {
                    dayCompareResult = ZJDayCompareResult_ThisDay;
                }else if (isThisDay >0)
                {
                    dayCompareResult = ZJDayCompareResult_NextDay;
                }else
                {
                    dayCompareResult = ZJDayCompareResult_LastDay;
                }
                
            }else if (isThisMonth >0)
            {
                dayCompareResult = ZJDayCompareResult_NextDay;
            }else
            {
                dayCompareResult = ZJDayCompareResult_LastDay;
            }
        }
            break;
        case 1:
        {
            dayCompareResult = ZJDayCompareResult_NextDay;
        }
            break;
            
        default:
            
            break;
    }
    
    return dayCompareResult;
}

+ (NSInteger)compareYear:(NSDate *)compareDate
{
    ZJYearCompareResult yearCompareResult = ZJYearCompareResult_ThisYear;
    NSInteger year = [self year:[NSDate date]];
    NSInteger compareYear = [self year:compareDate];
    NSInteger isThisYear = compareYear - year;
    
    switch (isThisYear) {
        case -1:
            yearCompareResult = ZJYearCompareResult_LastYear;
            break;
        case 0:
            yearCompareResult = ZJYearCompareResult_ThisYear;
            break;
        default:
            yearCompareResult = ZJYearCompareResult_NextYear;
            break;
    }
    
    return yearCompareResult;
}

+ (NSInteger)compareMonth:(NSDate *)compareDate {
    
    ZJMonthCompareResult monthCompareResult = ZJMonthCompareResult_ThisMonth;
    NSInteger isThisYear = [self compareYear:compareDate];
    
    NSInteger month = [self month:[NSDate date]];
    NSInteger compareMonth= [self month:compareDate];
    NSInteger isThisMonth = compareMonth - month;
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    switch (isThisYear) {
        case -1:
        {
            monthCompareResult = ZJMonthCompareResult_LastMonth;
        }
            break;
            
        case 0:
        {
            if (isThisMonth == 0) {
                monthCompareResult = ZJMonthCompareResult_ThisMonth;
            }else if (isThisMonth >0)
            {
                monthCompareResult = ZJMonthCompareResult_NextMonth;
            }else
            {
                monthCompareResult = ZJMonthCompareResult_LastMonth;
            }
        }
            break;
        case 1:
        {
            monthCompareResult = ZJMonthCompareResult_NextMonth;
        }
            break;
            
        default:
        
            break;
    }
    
    return monthCompareResult;
}

@end
