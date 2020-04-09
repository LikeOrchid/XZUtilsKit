//
//  CommonlyMacro.h
//  FlyingDog
//
//  Created by Toommi on 2017/7/20.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#ifndef CommonlyMacro_h
#define CommonlyMacro_h
///屏幕宽度
#define SCREEN_W  [UIScreen mainScreen].bounds.size.width

///屏幕高度
#define SCREEN_H [UIScreen mainScreen].bounds.size.height
///屏幕比例
#define SCALE SCREEN_W/320

// RGBA 颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

// RGB 颜色
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

// RGB  单色 颜色
#define RGBONE(C) RGBA(C,C,C,1.0f)

#define HEX(x)  [UIColor colorWithHexString:x]


///得到系统版本号
#define kSystemVersion [[UIDevice currentDevice] systemVersion]

///得到沙盒路径
#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

///NSUserDefaults
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

#define POST_NOT(name) [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil];

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

#define kTabbarHeight self.navigationController.tabBarController.tabBar.frame.size.height

#define kBottomSafeHeight   (CGFloat)(kTopHeight>64?(34):(0))

// Log日志
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...){}
#endif

#endif /* CommonlyMacro_h */
