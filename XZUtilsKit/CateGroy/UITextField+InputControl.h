//
//  UITextField+InputControl.h
//  LiveShopping
//
//  Created by yanyu on 2020/4/25.
//  Copyright © 2020 yanyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (InputControl)
/**
 * MARK:  限制输入float 类型 后2位小数
 */
-(BOOL)inputControlFloatWintRange:(NSRange)range  withString:(NSString *)string;
/**
 * MARK:  限制输入float 类型 后num位小数
 */
-(BOOL)inputControlFloatNum:(NSInteger ) num wintRange:(NSRange)range  withString:(NSString *)string;
/**
 * MARK:  限制输入只能输入数字
 */
-(BOOL)inputControlOnlyNumber:(NSString *)string;
/**
 * MARK:  限制输入只能输入英文
 */
-(BOOL)inputControlOnlyEnglish:(NSString *)string;
/**
 * MARK:  限制输入只能输入英文数字
 */
-(BOOL)inputControlEnglishNum:(NSString *)string;

/**
 * MARK:  限制输入只能输入中文
 */
-(BOOL)inputControlOnlyChina:(NSString *)string;
/**
 * MARK:  限制输入只能输入 字母、数字、中文
 */
- (BOOL)inputControRuleNotBlank:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
