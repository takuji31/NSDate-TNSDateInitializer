//
//  TNSDateInitializerSpec.m
//  NSDateTNSInitializerExample
//
//  Created by Takuji Nishibayashi on 2014/02/03.
//  Copyright 2014年 Takuji Nishibayashi. All rights reserved.
//

#import "Kiwi.h"
#import <NSDate-TNSDateInitializer/NSDate+TNSDateInitializer.h>

SPEC_BEGIN(TNSDateInitializerSpec)
        describe(@"TNSDateInitializer", ^{
            __block NSCalendar* calendar = nil;
            beforeAll(^{
                calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
                calendar.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
                NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
                calendar.timeZone = timeZone;
            });
            beforeEach(^{
                [NSDate tns_setDefaultCalendar:nil];
            });
            context(@"defult calendar", ^{
                it(@"should have current calendar as default calendar", ^{
                    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
                    [[[NSDate tns_defaultCalendar] should] equal:currentCalendar];
                });
                it(@"can set calendar", ^{
                    [NSDate tns_setDefaultCalendar:calendar];
                    [[[NSDate tns_defaultCalendar] should] equal:calendar];
                });
            });
            context(@"number value initializer", ^{
                context(@"when created with 1970/01/01 00:00:00", ^{
                    it(@"should correct", ^{
                        NSDate *date = [NSDate dateWithYear:1970 month:1 day:1 hour:0 minute:0 second:0 calendar:calendar];
                        [[date should] equal:[NSDate dateWithTimeIntervalSince1970:0]];
                    });
                });
                context(@"when created with in default calendar", ^{
                    __block NSDate *date = nil;
                    beforeEach(^{
                        [NSDate tns_setDefaultCalendar:calendar];
                        date = [NSDate dateWithYear:2014 month:2 day:3 hour:17 minute:49 second:50];
                    });
                    it(@"should equals date with calendar", ^{
                        NSDate *calendarDate = [NSDate dateWithYear:2014 month:2 day:3 hour:17 minute:49 second:50 calendar:calendar];
                        [[date should] equal:calendarDate];
                    });
                    it(@"should correct date", ^{
                        NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
                    });
                });
            });
        });
SPEC_END
