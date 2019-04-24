//
//  NewNetworkManger.h
//  OwenInfant
//
//  Created by yanyu on 2019/4/15.
//  Copyright © 2019 yons. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkCookieManger : NSObject
+ (NetworkCookieManger *)defalutManage;
/** 保存登录的Cookie*/
-(void)saveCookie;
/**有Cookie时需要将Cookie写入*/
-(void)insterCookies;
/** 退出登录时清除Cookie*/
-(void)removeCookies;
@end

NS_ASSUME_NONNULL_END
