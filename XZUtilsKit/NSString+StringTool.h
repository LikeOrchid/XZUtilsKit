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
+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize;
-(CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width  withKern:(CGFloat)ker;
-(NSString*)getWebPLableString;
-(NSString *)stringFormate:(NSString *)ymdhms;
+(NSString *)getCurrentDateString;
//时间
+ (NSString *)time_timestampToString:(NSInteger)timestamp;
+ (BOOL)stringContainsEmoji:(NSString *)string;
+ (BOOL)isChinese:(NSString *)userName;
+(NSString *)numberToString:(int)number;
// 计算时间差
+(NSString *)timeDifference:(NSDate *)beginDate;
+ (NSString *) compareCurrentTime:(NSString *)str;
@end
