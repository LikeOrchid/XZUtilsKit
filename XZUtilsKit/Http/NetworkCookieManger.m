//
//  NewNetworkManger.m
//  OwenInfant
//
//  Created by yanyu on 2019/4/15.
//  Copyright © 2019 yons. All rights reserved.
//

#import "NetworkCookieManger.h"
@interface NetworkCookieManger()
@end
@implementation NetworkCookieManger

+ (NetworkCookieManger *)defalutManage{
    static NetworkCookieManger *_client = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _client = [[NetworkCookieManger alloc]init];
    });
    
    return _client;
}
/** 保存登录的Cookie*/
-(void)saveCookie{
    NSArray * cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject: cookies];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: cookiesData forKey:@"Cookie"];
}
/**有Cookie时需要将Cookie写入*/
-(void)insterCookies {
    NSArray *cookies02 = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"Cookie"]];
    NSHTTPCookieStorage * cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie * cookie in cookies02){
        [cookieStorage setCookie: cookie];
    }
}
/** 退出登录时清除Cookie*/
-(void)removeCookies {
    NSHTTPCookieStorage * manager = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray * cookieStorages = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (NSHTTPCookie *cookie in cookieStorages) {
        [manager deleteCookie:cookie];
    }
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Cookie"];
}
@end
