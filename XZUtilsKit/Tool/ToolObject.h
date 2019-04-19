//
//  ToolObject.h
//  FlyingDog
//
//  Created by Toommi on 2017/8/4.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ToolObject : NSObject
/**
 正则判断手机号码地址格式

 @param phone 手机号
 @return 结果
 */
//+ (BOOL)isMobileNumber:(NSString *)mobileNum;
+ (BOOL)validatePhone:(NSString *)phone;

/**
 校验邮箱
 
 @param string 字符
 @return 结果
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;
+ (BOOL)validateEmail:(NSString *)email;

/**
 校检身份证号

 @param identityCard 身份证号码
 @return 结果
 */
+ (BOOL)checkIDCard:(NSString *)identityCard;
//

/**
 自定义分页
 将数组数据分成 pagecount分发到另一个数组

 @param data 元数据
 @param pagecount 每页多少数量
 @return 数据@[@[],@[]...]
 */
+(NSArray *)getPageArray:(NSArray *)data withCount:(NSInteger)pagecount;


/**
 读取本地JSON文件

 @param name 文件名字
 @return 字典
 */
+ (NSDictionary *)readLocalFileWithName:(NSString *)name;

/**
将数组打乱

 @param array 数组
 @return 返回打乱之后的数组
 */
+(NSArray *)arc4RandomArray:(NSArray *)array;

/**
 获取验证码 按钮字体变化
 
 @param sender 按钮
 */
+(void)codeGCD:(UIButton *)sender;
+(void)codeGCDtwo:(UIButton *)sender;
@end
