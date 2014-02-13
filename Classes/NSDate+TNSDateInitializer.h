//
//  NSDate+TNSDateInitializer.h
//  Pods
//
//  Created by Takuji Nishibayashi on 2014/02/03.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (TNSDateInitializer)

#pragma mark - NSCalendar accessor
+ (NSCalendar *)tns_defaultCalendar;

+ (void)tns_setDefaultCalendar:(NSCalendar *)calendar;

#pragma mark - number value initializer
+ (NSDate *)dateWithYear:(NSInteger)year
                   month:(NSInteger)month
                     day:(NSInteger)day
                    hour:(NSInteger)hour
                  minute:(NSInteger)minute
                  second:(NSInteger)second
                calendar:(NSCalendar *)calendar;

+ (NSDate *)dateWithYear:(NSInteger)year
                   month:(NSInteger)month
                     day:(NSInteger)day
                    hour:(NSInteger)hour
                  minute:(NSInteger)minute
                  second:(NSInteger)second;

+ (NSDate *)dateWithYear:(NSInteger)year
                   month:(NSInteger)month
                     day:(NSInteger)day
                calendar:(NSCalendar *)calendar;

+ (NSDate *)dateWithYear:(NSInteger)year
                   month:(NSInteger)month
                     day:(NSInteger)day;

+ (NSDate *)dateWithHour:(NSInteger)hour
                  minute:(NSInteger)minute
                  second:(NSInteger)second
                calendar:(NSCalendar *)calendar;

+ (NSDate *)dateWithHour:(NSInteger)hour
                  minute:(NSInteger)minute
                  second:(NSInteger)second;

#pragma mark - ymd string initializer
+ (NSDate *)dateWithYMDString:(NSString *)ymdString separator:(NSString *)separator calendar:(NSCalendar *)calendar;

+ (NSDate *)dateWithYMDString:(NSString *)ymdString separator:(NSString *)separator;

#pragma mark - dateformatter initializer
+ (NSDate *)dateWithFormatString:(NSString *)formatString dateString:(NSString *)dateString calendar:(NSCalendar *)calendar;

+ (NSDate *)dateWithFormatString:(NSString *)formatString dateString:(NSString *)dateString;
@end
