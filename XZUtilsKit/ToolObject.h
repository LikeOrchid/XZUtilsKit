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

// 正则判断手机号码地址格式
//+ (BOOL)isMobileNumber:(NSString *)mobileNum;
+ (BOOL)validatePhone:(NSString *)phone;
//获取验证码
+(void)codeGCD:(UIButton *)sender;
+(void)codeGCDtwo:(UIButton *)sender;
//邮箱
+ (BOOL) validateEmail:(NSString *)email;
//身份证号
+ (BOOL)checkIDCard:(NSString *)identityCard;
//将数组数据分成 pagecount分发到另一个数组
+(NSArray *)getPageArray:(NSArray *)data withCount:(NSInteger)pagecount;

// 读取本地JSON文件
+ (NSDictionary *)readLocalFileWithName:(NSString *)name;
+(NSArray *)arc4RandomArray:(NSArray *)array;
@end
