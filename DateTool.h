

#import <Foundation/Foundation.h>
typedef enum YMDType
{
    YearAndMonth =2,
    YearAndMonthAndDay ,

} YMDType;
@interface DateTool : NSObject
/**
 *  获取当前时间的时间戳（例子：1464326536）
 *
 *  @return 时间戳字符串型
 */
+ (NSString *)getCurrentTimestamp;

/**
 *  获取当前标准时间（例子：2015-02-03）
 *
 *  @return 标准时间字符串型
 */
+ (NSString *)getCurrentStandarTime;

/**
 *  时间戳转换为时间的方法
 *
 *  @param timestamp 时间戳
 *
 *  @return 标准时间字符串
 */
+ (NSString *)timestampChangesStandarTime:(NSString *)timestam  format:(NSString *)format;
//时间转换星期
+(NSString *)timeToweek:(NSString *)time;

//返回当天 时间字符串
+(NSString *)getCurrentStandarTimeWithFormat:(NSString *)format;
//根据指定日期返回 七天的日期
+(NSArray *)getOneWeekWithDateStr:(NSString *)dateStr andWithFormat:(NSString *)format;

/**
 *  将yyyy/MM/dd  转成 年月日
 *
 *  @param str  yyyy/MM/dd
 *
 *  @return 年月[日]
 */
+(NSString *)changeDateToChineseWithStr:(NSString *)str andWithType:(YMDType)type;
/**
 *  日期加几个天
 *
 *  @param date  @"2012/01/30"
 *  @param count 天数
 *
 *  @return 返回值
 */
+(NSString *)timeAddDayWithDate:(NSString *)dateString dayCount:(NSInteger)count;
@end
