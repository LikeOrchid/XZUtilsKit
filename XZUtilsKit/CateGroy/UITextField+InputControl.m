//
//  UITextField+InputControl.m
//  LiveShopping
//
//  Created by yanyu on 2020/4/25.
//  Copyright © 2020 yanyu. All rights reserved.
//

#import "UITextField+InputControl.h"

#define NUMBER @"0123456789"
#define ALPHA @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
#define ALPHANUM @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"


@implementation UITextField (InputControl)
/**
 * MARK:  限制输入float 类型 后2位小数
 */
-(BOOL)inputControlFloatWintRange:(NSRange)range  withString:(NSString *)string{
 
    NSString * toBeString = [self.text stringByReplacingCharactersInRange:range withString:string];
    //得到输入框的内容
    if ([toBeString containsString:@"."]) {
        
        NSRange subRange = [toBeString rangeOfString:@"."];
        
        if (toBeString.length - subRange.location > 3) { //如果输入框小数点后大于2位小数
            return NO;
        }
    }
    return YES;
}
/**
 * MARK:  限制输入float 类型 后num位小数
 */
-(BOOL)inputControlFloatNum:(NSInteger ) num wintRange:(NSRange)range  withString:(NSString *)string{
    NSString * toBeString = [self.text stringByReplacingCharactersInRange:range withString:string];
    //得到输入框的内容
    if ([toBeString containsString:@"."]) {
        NSRange subRange = [toBeString rangeOfString:@"."];
        
        if (toBeString.length - subRange.location > num+1) { //如果输入框小数点后大于num位小数
            return NO;
        }
    }
    return YES;
}
/**
 * MARK:  限制输入只能输入数字
 */
-(BOOL)inputControlOnlyNumber:(NSString *)string {
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBER] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    if (![string isEqualToString:filtered]) {
        return NO;
    }
   return YES;
}

/**
 * MARK:  限制输入只能输入英文
 */
-(BOOL)inputControlOnlyEnglish:(NSString *)string {
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:ALPHANUM] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    if (![string isEqualToString:filtered]) {
        return NO;
    }
   return YES;
}

/**
 * MARK:  限制输入只能输入英文数字
 */
-(BOOL)inputControlEnglishNum:(NSString *)string {
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:ALPHA] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    if (![string isEqualToString:filtered]) {
        return NO;
    }
   return YES;
}

/**
 * MARK:  限制输入只能输入中文
 */
-(BOOL)inputControlOnlyChina:(NSString *)string {
    NSString *regex = @"^[\u4E00-\u9FA5]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:string];
}

/**
 * MARK: 字母、数字、中文正则判断（不包括空格）
 */
- (BOOL)inputControRuleNotBlank:(NSString *)str {
    NSString *pattern = @"^[➋➌➍➎➏➐➑➒a-zA-Z\u4E00-\u9FA5\\d]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}

@end
