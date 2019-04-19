//
//  ToolObject.m
//  FlyingDog
//
//  Created by Toommi on 2017/8/4.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#import "ToolObject.h"
#import <CoreText/CoreText.h>
@implementation ToolObject

// 正则判断手机号码地址格式
+ (BOOL)isMobileNumber:(NSString *)mobileNum {
    
    //    电信号段:133/153/180/181/189/177
    //    联通号段:130/131/132/155/156/185/186/145/175／176
    //    移动号段:134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
    //    虚拟运营商:170
    
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[05-8])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    return [regextestmobile evaluateWithObject:mobileNum];
}
/**
 正则判断手机号码地址格式
 
 @param phone 手机号
 @return 结果
*/
+ (BOOL)validatePhone:(NSString *)phone {
    if (phone.length != 11) {
        
        return NO;
    }
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[0, 1, 6, 7, 8], 18[0-9]
     *移动号段：134 135 136 137 138 139 147 148 150 151 152 157 158 159 172 178 182 183 184 187 188 198
     *联通号段： 130 131 132 145 146 155 156 166 171 175 176 185 186
     *电信号段：133 149 153 173 174 177 180 181 189 199
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134 135 136 137 138 139 147 148 150 151 152 157 158 159 172 178 182 183 184 187 188 198
     */
    NSString *CM = @"^1(3[4-9]|4[78]|5[0-27-9]|7[08]|8[2-478]|9[8])\\d{8}$";
    /**
     * 中国联通：China Unicom
     * 130 131 132 145 146 155 156 166 171 175 176 185 186
     */
    NSString *CU = @"^1(3[0-2]|4[56]|5[56]|6[6]|7[0156]|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133 149 153 173 174 177 180 181 189 199
     */
    NSString *CT = @"^1(3[3]|4[9]|53|7[0347]|8[019]|9[9])\\d{8}$";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:phone] == YES)
        || ([regextestcm evaluateWithObject:phone] == YES)
        || ([regextestct evaluateWithObject:phone] == YES)
        || ([regextestcu evaluateWithObject:phone] == YES)) {
        
        return YES;
        
    } else {
        
        return NO;
    }
}
/**
 校检身份证号
 
 @param identityCard 身份证号码
 @return 结果
 */
+ (BOOL)checkIDCard:(NSString *)identityCard {
    //判断是否为空
    if (identityCard==nil||identityCard.length <= 0) {
        return NO;
    }
    //判断是否是18位，末尾是否是x
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    if(![identityCardPredicate evaluateWithObject:identityCard]){
        return NO;
    }
    //判断生日是否合法
    NSRange range = NSMakeRange(6,8);
    NSString *datestr = [identityCard substringWithRange:range];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat : @"yyyyMMdd"];
    if([formatter dateFromString:datestr]==nil){
        return NO;
    }
    
    //判断校验位
    if(identityCard.length==18)
    {
        NSArray *idCardWi= @[ @"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2" ]; //将前17位加权因子保存在数组里
        NSArray * idCardY=@[ @"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2" ]; //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        int idCardWiSum=0; //用来保存前17位各自乖以加权因子后的总和
        for(int i=0;i<17;i++){
            idCardWiSum+=[[identityCard substringWithRange:NSMakeRange(i,1)] intValue]*[idCardWi[i] intValue];
        }
        
        int idCardMod=idCardWiSum%11;//计算出校验码所在数组的位置
        NSString *idCardLast=[identityCard substringWithRange:NSMakeRange(17,1)];//得到最后一位身份证号码
        
        //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2){
            if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"]){
                return YES;
            }else{
                return NO;
            }
        }else{
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if([idCardLast intValue]==[idCardY[idCardMod] intValue]){
                return YES;
            }else{
                return NO;
            }
        }
    }
    return NO;
}
/**
 校验邮箱
 
 @param email 字符
 @return 结果
 */
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
/**
 校验邮箱
 
 @param string 字符
 @return 结果
 */
+ (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}


/**
 自定义分页
 将数组数据分成 pagecount分发到另一个数组
 
 @param data 元数据
 @param pagecount 每页多少数量
 @return 数据@[@[],@[]...]
 */
+(NSArray *)getPageArray:(NSArray *)data withCount:(NSInteger)pagecount{
    
    if (data.count>pagecount) {
        NSMutableArray * array =[NSMutableArray array];
        for (int i = 0; i<data.count; i++) {
            
            if ((i+1)%pagecount == 0 && i != 0) {
                
                NSMutableArray * sub = [[NSMutableArray alloc]init];
                for (int j = i; j>i-pagecount; j--) {
                    [sub addObject:data[j]];
                }
                [array addObject:sub];
            }
            if (i+1 == data.count) {
                if ((i+1)%pagecount != 0) {
                    NSMutableArray * sub = [[NSMutableArray alloc]init];
                    for (int j = i; j>i-(i+1)%pagecount; j--) {
                        [sub addObject:data[j]];
                    }
                    [array addObject:sub];
                }
            }
        }
        return array;
    }else{
        return @[data];
    }
    return @[];
}

/**
 读取本地JSON文件
 
 @param name 文件名字
 @return 字典
 */
+ (NSDictionary *)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}
/**
 将数组打乱
 
 @param array 数组
 @return 返回打乱之后的数组
 */
+(NSArray *)arc4RandomArray:(NSArray *)array{
    return [array sortedArrayUsingComparator:^NSComparisonResult(NSString *str1, NSString *str2) {
        int seed = arc4random_uniform(2);
        if (seed) {
            return [str1 compare:str2];
        } else {
            return [str2 compare:str1];
        }
    }];
}

/**
 获取验证码 按钮字体变化
 
 @param sender 按钮
 */
+(void)codeGCD:(UIButton *)sender{
    __block int timeout = 60;
    sender.userInteractionEnabled = NO;
    //    sender.backgroundColor = [UIColor colorWithRed:166/255.0 green:166/255.0 blue:166/255.0 alpha:1];
    
    //获取全局队列
    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //创建一个定时器，并将定时器的任务交给全局队列执行(并行，不会造成主线程阻塞)
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, global);
    
    // 设置触发的间隔时间
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    //1.0 * NSEC_PER_SEC  代表设置定时器触发的时间间隔为1s
    //0 * NSEC_PER_SEC    代表时间允许的误差是 0s
    dispatch_source_set_event_handler(timer, ^{
        
        timeout --;
        if (timeout <= 0) {
            
            //关闭定时器
            dispatch_source_cancel(timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                sender.userInteractionEnabled = YES;
                
                //                sender.backgroundColor = BTN_NORMAL_COLOR;
                [sender setTitle:@"获取验证码" forState:UIControlStateNormal];
            });
        }else {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSString * title = [NSString stringWithFormat:@"(%ds)获取",timeout];
                
                [sender setTitle:title forState:UIControlStateNormal];
            });
        }
    });
    
    dispatch_resume(timer);
}


+(void)codeGCDtwo:(UIButton *)sender{
    __block int timeout = 60;
    sender.userInteractionEnabled = NO;
    //    sender.backgroundColor = RGBONE(230);
    
    //获取全局队列
    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //创建一个定时器，并将定时器的任务交给全局队列执行(并行，不会造成主线程阻塞)
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, global);
    
    // 设置触发的间隔时间
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    //1.0 * NSEC_PER_SEC  代表设置定时器触发的时间间隔为1s
    //0 * NSEC_PER_SEC    代表时间允许的误差是 0s
    dispatch_source_set_event_handler(timer, ^{
        
        timeout --;
        if (timeout <= 0) {
            
            //关闭定时器
            dispatch_source_cancel(timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                sender.userInteractionEnabled = YES;
                
                //                sender.backgroundColor = [UIColor whiteColor];
                
                [sender setTitle:@"发送" forState:UIControlStateNormal];
            });
        }else {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSString * title = [NSString stringWithFormat:@"%ds",timeout];
                
                [sender setTitle:title forState:UIControlStateNormal];
            });
        }
    });
    
    dispatch_resume(timer);
}
@end
        
