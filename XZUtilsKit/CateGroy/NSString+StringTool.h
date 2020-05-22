//
//  NSString+StringTool.h
//  FlyingDog
//
//  Created by Toommi on 2017/7/22.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface NSString (StringTool)
#pragma mark - 文本宽高
/**
 *  MARK:-计算文本的宽高
 *
 *  @param str     需要计算的文本
 *  @param font    文本显示的字体
 *  @param maxSize 文本显示的范围
 *
 *  @return 文本占用的真实宽高
 */
+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 MARK:-设置 字体间间距之后获取高度，好久没看了，应该是这个

 @param lineSpeace 行间距
 @param font 字体
 @param width 宽
 @param ker 子间距
 @return 文本高
 */
-(CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width  withKern:(CGFloat)ker;

#pragma mark - 时间文本
/**
 后去当前时间字符

 YYYY-MM-dd HH:mm:ss 时间
 @return 字符
 */
+(NSString *)getCurrentDateString;

/**
 MARK:- 时间撮转文字格式的时间

 @param timestamp 时间撮
 @return 文字
 */
+ (NSString *)time_timestampToString:(NSInteger)timestamp;
/**
 MARK:-计算时间差 根据 date

 @param beginDate 开始时间
 @return 字符
 */
+(NSString *)timeDifference:(NSDate *)beginDate;

/**
 *  MARK:-计算剩余时间
 *
 *  @param endTime   结束日期
 *
 *  @return 剩余时间
 */
+(NSInteger)getCountDownStringWithEndTime:(NSString *)endTime;

/**
 MARK:-发布时间：如，几个小时前

 @param str 时间字符串 yyyy-MM-dd HH:mm:ss
 @return 字符
 */
+ (NSString *) compareCurrentTime:(NSString *)str;

#pragma mark - html 字符

/**
 MARK:-拼接 p 标签

 @return htmlstr
 */
-(NSString*)getWebPLableString;


/**
 * MARK:-常用标签的替换 标签
*/
+ (NSString *)htmlEntityDecode: (NSString *)str;
/**
 * MARK:-删掉P标签
 */
+(NSString *)removeHtmlDecode:(NSString *)str;
/**
 * MARK:-正则去除标签
 */
+(NSString *)removeHtmlWithString:(NSString *)htmlString;


#pragma mark -json 字符串
/*!
 
 * @brief 把格式化的JSON格式的字符串转换成字典
 
 * @param jsonString JSON格式的字符串
 
 * @return 返回字典
 
 */

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
/**
 * 将字段转化为json 字符串
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

#pragma mark -空字符
/**
 *  判断 空字符串
 */
+(NSString*)judeNullString:(NSString *)str;

#pragma mark - 其他
/**
 是否是 中文

 @param userName 字符
 @return 结果
 */
+ (BOOL)isChinese:(NSString *)userName;


/**
 数字转中文，如 111 ->一百一十一

 @param number 数字
 @return 字符
 */
+(NSString *)numberToString:(int)number;

/**
 查找子字符串在父字符串中的所有位置
 @param content 父字符串
 @param tab 子字符串
 @return 返回位置数组
 */

+(NSMutableArray*)getSubStringRanges:(NSString *)content str:(NSString *)tab;

@end
