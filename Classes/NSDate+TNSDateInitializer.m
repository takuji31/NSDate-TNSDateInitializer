//
//  NSDate+TNSDateInitializer.m
//  Pods
//
//  Created by Takuji Nishibayashi on 2014/02/03.
//
//

#import "NSDate+TNSDateInitializer.h"

@implementation NSDate (TNSDateInitializer)

static NSCalendar *TNSDefaultCalendar = nil;

+ (NSCalendar *)tns_defaultCalendar {
    if (!TNSDefaultCalendar) {
        TNSDefaultCalendar = [NSCalendar currentCalendar];
    }
    return TNSDefaultCalendar;
}

+ (void)tns_setDefaultCalendar:(NSCalendar *)calendar {
    TNSDefaultCalendar = calendar;
}

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second calendar:(NSCalendar *)calendar {
    if (!calendar) {
        calendar = [self tns_defaultCalendar];
    }
    NSDate *referenceDate = [self dateWithTimeIntervalSince1970:0];
    NSCalendarUnit calendarUnit = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponents = [calendar components:calendarUnit fromDate:referenceDate];
    dateComponents.calendar = calendar;
    dateComponents.timeZone = calendar.timeZone;
    dateComponents.year = year;
    dateComponents.month = month;
    dateComponents.day = day;
    dateComponents.hour = hour;
    dateComponents.minute = minute;
    dateComponents.second = second;
    return [calendar dateFromComponents:dateComponents];
}

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second {
    return [self dateWithYear:year month:month day:day hour:hour minute:minute second:second calendar:nil];
}

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day calendar:(NSCalendar *)calendar {
    return [self dateWithYear:year month:month day:day hour:0 minute:0 second:0 calendar:nil];
}

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    return [self dateWithYear:year month:month day:day hour:0 minute:0 second:0];
}

+ (NSDate *)dateWithHour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second calendar:(NSCalendar *)calendar {
    return [self dateWithYear:0 month:0 day:0 hour:hour minute:minute second:second calendar:calendar];
}


+ (NSDate *)dateWithHour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second {
    return [self dateWithYear:0 month:0 day:0 hour:hour minute:minute second:second calendar:nil];
}

+ (NSDate *)dateWithYMDString:(NSString *)ymdString separator:(NSString *)separator calendar:(NSCalendar *)calendar {
    NSArray *strings = [ymdString componentsSeparatedByString:separator];
    NSAssert(strings.count >= 3, @"ymd string must be separated more than three. current is %@", @(strings.count));
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    return [self dateWithYear:[[numberFormatter numberFromString:strings[0]] integerValue]
                        month:[[numberFormatter numberFromString:strings[1]] integerValue]
                          day:[[numberFormatter numberFromString:strings[2]] integerValue]
                     calendar:calendar];
}

+ (NSDate *)dateWithYMDString:(NSString *)ymdString separator:(NSString *)separator {
    return [self dateWithYMDString:ymdString separator:separator calendar:nil];
}

+ (NSDate *)dateWithFormatString:(NSString *)formatString dateString:(NSString *)dateString calendar:(NSCalendar *)calendar {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatString;
    dateFormatter.calendar = calendar;
    return [dateFormatter dateFromString:dateString];
}


+ (NSDate *)dateWithFormatString:(NSString *)formatString dateString:(NSString *)dateString {
    return [self dateWithFormatString:formatString dateString:dateString calendar:[NSDate tns_defaultCalendar]];
}


@end
