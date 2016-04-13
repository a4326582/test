

#import "DateTool.h"

@implementation DateTool
/**
 *  获取当前时间的时间戳（例子：1464326536）
 *
 *  @return 时间戳字符串型
 */
+ (NSString *)getCurrentTimestamp
{
    //获取系统当前的时间戳
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%f", a];
    // 转为字符型
    return timeString;
}

/**
 *  获取当前标准时间（例子：2015-02-03）
 *
 *  @return 标准时间字符串型
 */
+ (NSString *)getCurrentStandarTime
{
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"yyyyMMddHHmmss"];
    
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    return locationString;
}

/**
 *  时间戳转换为时间的方法
 *
 *  @param timestamp 时间戳
 *
 *  @return 标准时间字符串
 */
+ (NSString *)timestampChangesStandarTime:(NSString *)timestamp format:(NSString *)format
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];//@"yyyy-MM-dd-HHMMss"
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
    
//    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
//    [formatter setTimeZone:timeZone];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
    
}

+(NSString *)timeToweek:(NSString *)time{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *formatterDate = [inputFormatter dateFromString:time];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    //    [outputFormatter setDateFormat:@"HH:mm 'on' EEEE MMMM d"];
    // For US English, the output is:
    // newDateString 10:30 on Sunday July 11
    [outputFormatter setDateFormat:@"EEEE"];
    NSString *newDateString = [outputFormatter stringFromDate:formatterDate];
    return newDateString;
}


//根据指定日期返回 七天
+(NSArray *)getOneWeekWithDateStr:(NSString *)dateStr andWithFormat:(NSString *)format{
    NSString *dateString = dateStr;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //@"yyyy-MM-dd HH:mm:ss"
    [formatter setDateFormat:format];
    NSDate *date = [formatter dateFromString:dateString];
    //    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents* dc1 = [[NSDateComponents alloc] init];
    //    [dc1 setMonth:1];
    
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i < 7; i++) {
        [dc1 setDay:i];
        NSDate *nextDate = [ gregorian dateByAddingComponents:dc1 toDate:date options:0];
        [arr addObject:[formatter stringFromDate:nextDate]];
    }
    return arr;
}
//返回当天 时间字符串
+(NSString *)getCurrentStandarTimeWithFormat:(NSString *)format
{
    //@"yyyyMMddHHmmss"
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:format];
    
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    return locationString;
}



/**
 *  日期数据转换   yy/MM/dd -> yy-MM-dd
 *
 *  @param dateStr yy/MM/dd
 *
 *  @return yy-MM-dd
 */
+(NSString *)dateSubAndChangeWithDateStrFormat:(NSString *)dateStr{
    NSArray *array = [dateStr componentsSeparatedByString:@"/"];
    NSMutableString *str = [NSMutableString stringWithFormat:@"%@-%@-%@",array[0],array[1],array[2]];
    return str;
}







+(NSString *)changeDateToChineseWithStr:(NSString *)str andWithType:(YMDType)type{
    if(type == YearAndMonth){
        NSRange range;
        range.length = 7;
        range.location = 0;
        str = [str stringByReplacingOccurrencesOfString:@"/"withString:@"年"];
        str = [str substringWithRange:range];
        str = [NSString stringWithFormat:@"%@月",str];
        return str;
    }else if(type == YearAndMonthAndDay){
        NSArray *b = [str componentsSeparatedByString:@"年月"];
        NSMutableString *arr = [NSMutableString string];
        for (NSInteger i = 0; i < b.count; i++) {
            if(i==0){
                [arr appendString:[NSString stringWithFormat:@"%@年",b[i]]];
            }else if(i==1){
                [arr appendString:[NSString stringWithFormat:@"%@月",b[i]]];
            }else if(i==2){
                [arr appendString:[NSString stringWithFormat:@"%@日",b[i]]];
            }
            
        }
        return arr;
    }else{
        return @"";
    }
}





+(NSString *)timeAddDayWithDate:(NSString *)dateString dayCount:(NSInteger)count{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy/MM/dd"];
    
    NSDate *date = [formatter dateFromString:dateString];
    
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents* dc1 = [[NSDateComponents alloc] init];
    //    [dc1 setMonth:count];
    [dc1 setDay:count+1];
    NSDate *nextmonthDate = [ gregorian dateByAddingComponents:dc1 toDate:date options:0];
    
    return [formatter stringFromDate:nextmonthDate];
}


@end
