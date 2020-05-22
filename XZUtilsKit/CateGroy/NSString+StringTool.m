//
//  NSString+StringTool.m
//  FlyingDog
//
//  Created by Toommi on 2017/7/22.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#import "NSString+StringTool.h"

@implementation NSString (StringTool)
/**
 *  计算文本的宽高
 *
 *  @param str     需要计算的文本
 *  @param font    文本显示的字体
 *  @param maxSize 文本显示的范围
 *
 *  @return 文本占用的真实宽高
 */
+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName : font};
    CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesDeviceMetrics attributes:dict context:nil].size;
    return  size;
}

/**
 设置 字体间间距之后获取高度，好久没看了，应该是这个
 
 @param lineSpeace 行间距
 @param font 字体
 @param width 宽
 @param ker 子间距
 @return 文本高
 */

-(CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width  withKern:(CGFloat)ker {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    /** 行高 */
    paraStyle.lineSpacing = lineSpeace;
    // NSKernAttributeName字体间距
    NSDictionary *dic;
    if (ker != 0) {
        dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:[NSNumber numberWithFloat:ker]};
    }else {
        dic = @{NSFontAttributeName : font};
    }
   
    CGSize size = [self boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}

#pragma mark -时间字符
/**
 后去当前时间字符
 
 YYYY-MM-dd HH:mm:ss 时间
 @return 字符
 */
+(NSString *)getCurrentDateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *date = [dateFormatter stringFromDate:[NSDate date]];
    
    return date;
}
/**
 时间撮转文字格式的时间
 
 @param timestamp 时间撮
 @return 文字
 */
+ (NSString *)time_timestampToString:(NSInteger)timestamp{
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString* string=[dateFormat stringFromDate:confromTimesp];
    
    return string;
    
}

/**
 计算时间差
 
 @param beginDate 开始时间
 @return 字符
 */
+(NSString *)timeDifference:(NSDate *)beginDate
{
    NSDate *nowDate = [NSDate date];
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth
    | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    //对比时间差
    NSDateComponents *dateCom = [calendar components:unit fromDate:beginDate toDate:nowDate options:0];
    NSString *callTime;
    
    NSInteger hours =  dateCom.hour;
    NSInteger minute = dateCom.minute;
    NSInteger second = dateCom.second;
    
    if (hours != 0) {
        callTime = [NSString stringWithFormat:@"%02ld:%02ld:%02ld",(long)hours,(long)minute,(long)second];
    }else{
        callTime = [NSString stringWithFormat:@"%02ld:%02ld",(long)minute,(long)second];
    }
    
    return callTime;
}

/**
 *  计算剩余时间
 *
 *  @param endTime   结束日期
 *
 *  @return 剩余时间
 */
+(NSInteger)getCountDownStringWithEndTime:(NSString *)endTime {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *now = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];//设置时区
    NSInteger interval = [zone secondsFromGMTForDate: now];
    NSDate *localDate = [now  dateByAddingTimeInterval: interval];
    endTime = [NSString stringWithFormat:@"%@ 23:59:59", endTime];
    NSDate *endDate = [dateFormatter dateFromString:endTime];
    NSInteger endInterval = [zone secondsFromGMTForDate: endDate];
    NSDate *end = [endDate dateByAddingTimeInterval: endInterval];
    NSUInteger voteCountTime = ([end timeIntervalSinceDate:localDate]);
    
    return voteCountTime;
}

/**
 发布时间：如，几个小时前
 
 @param str 时间字符串 yyyy-MM-dd HH:mm:ss
 @return 字符
 */
+ (NSString *) compareCurrentTime:(NSString *)str
{
    //把字符串转为NSdate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *timeDate = [dateFormatter dateFromString:str];
    
    //得到与当前时间差
    NSTimeInterval  timeInterval = [timeDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    //标准时间和北京时间差8个小时
    timeInterval = timeInterval - 8*60*60;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}


#pragma mark -html 字符串
/**
 拼接 p 标签
 
 @return htmlstr
 */
-(NSString*)getWebPLableString{
    NSString *htmlStr = [NSString stringWithFormat:@"<html> \n"
                             "<head> \n"
                             "<style type=\"text/css\"> \n"
                             "body {font-size:15px;}\n"
                             "</style> \n"
                             "</head> \n"
                             "<body>"
                             "<script type='text/javascript'>"
                             "window.onload = function(){\n"
                             "var $img = document.getElementsByTagName('img');\n"
                             "for(var p in  $img){\n"
                             " $img[p].style.width = '100%%';\n"
                             "$img[p].style.height ='auto'\n"
                             "}\n"
                             "}"
                             "</script>%@"
                             "</body>"
                             "</html>",self];
    return htmlStr;
}
/**
 * 常用标签的替换 标签
*/
+ (NSString *)htmlEntityDecode: (NSString *)str{
    
    str = [str stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    str = [str stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    str = [str stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    str = [str stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    str = [str stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    str = [str stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@"\n"];
    return str;
}
/**
 * 删掉P标签
 */
+(NSString *)removeHtmlDecode:(NSString *)str {
    str = [str stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"<br/>" withString:@""];
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"@／：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\""];
    str = [str stringByTrimmingCharactersInSet:set];
    return str;
}

//正则去除标签
+(NSString *)removeHtmlWithString:(NSString *)htmlString{
    NSRegularExpression * regularExpretion=[NSRegularExpression regularExpressionWithPattern:@"<[^>]*>|\n" options:0 error:nil];
    htmlString = [regularExpretion stringByReplacingMatchesInString:htmlString options:NSMatchingReportProgress range:NSMakeRange(0, htmlString.length) withTemplate:@""];
    return htmlString;
}

#pragma mark- json字符
/*!
 
 * @brief 把格式化的JSON格式的字符串转换成字典
 
 * @param jsonString JSON格式的字符串
 
 * @return 返回字典
 
 */

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
/**
 * 将字段转化为json 字符串
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
#pragma mark-空字符串

/**
 *  判断 空字符串
 */
+(NSString*)judeNullString:(NSString *)str{
    
    if (str.length == 0 ||str == nil || [str isEqual:[NSNull null]]) {
        return @" ";
    }
    return str;
}

#pragma mark-其它

/**
 是否是 中文
 
 @param userName 字符
 @return 结果
 */
+ (BOOL)isChinese:(NSString *)userName
{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:userName];
}

/**
 数字转中文，如 111 ->一百一十一
 
 @param number 数字
 @return 字符
 */
+(NSString *)numberToString:(int)number {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterRoundHalfDown;
    NSString *string = [formatter stringFromNumber:[NSNumber numberWithInt:number]];
    return string;
}

/**
 查找子字符串在父字符串中的所有位置
 @param content 父字符串
 @param tab 子字符串
 @return 返回位置数组
 */

+ (NSMutableArray*)getSubStringRanges:(NSString *)content str:(NSString *)tab {
    int location = 0;
    NSMutableArray *locationArr = [NSMutableArray new];
    NSRange range = [content rangeOfString:tab];
    if (range.location == NSNotFound){
        return locationArr;
    }
    //声明一个临时字符串,记录截取之后的字符串
    NSString * subStr = content;
    while (range.location != NSNotFound) {
        if (location == 0) {
            location += range.location;
        } else {
            location += range.location + tab.length;
        }
        //记录位置
        NSNumber *number = [NSNumber numberWithUnsignedInteger:location];
        [locationArr addObject:number];
        //每次记录之后,把找到的字串截取掉
        subStr = [subStr substringFromIndex:range.location + range.length];
        NSLog(@"subStr %@",subStr);
        range = [subStr rangeOfString:tab];
        NSLog(@"rang %@",NSStringFromRange(range));
    }
    return locationArr;
}

@end
