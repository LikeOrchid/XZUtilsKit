//
//  NSString+StringTool.h
//  FlyingDog
//
//  Created by Toommi on 2017/7/22.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (StringTool)
/**
 *  计算文本的宽高
 *
 *  @param str     需要计算的文本
 *  @param font    文本显示的字体
 *  @param maxSize 文本显示的范围
 *
 *  @return 文本占用的真实宽高
 */
+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 设置 字体间间距之后获取高度，好久没看了，应该是这个

 @param lineSpeace 行间距
 @param font 字体
 @param width 宽
 @param ker 子间距
 @return 文本高
 */
-(CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width  withKern:(CGFloat)ker;

/**
 拼接 p 标签

 @return htmlstr
 */
-(NSString*)getWebPLableString;
/**
 后去当前时间字符

 YYYY-MM-dd HH:mm:ss 时间
 @return 字符
 */
+(NSString *)getCurrentDateString;

/**
 时间撮转文字格式的时间

 @param timestamp 时间撮
 @return 文字
 */
+ (NSString *)time_timestampToString:(NSInteger)timestamp;


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
 计算时间差

 @param beginDate 开始时间
 @return 字符
 */
+(NSString *)timeDifference:(NSDate *)beginDate;

/**
 发布时间：如，几个小时前

 @param str 时间字符串 yyyy-MM-dd HH:mm:ss
 @return 字符
 */
+ (NSString *) compareCurrentTime:(NSString *)str;
@end
