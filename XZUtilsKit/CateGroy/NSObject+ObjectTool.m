//
//  NSObject+ObjectTool.m
//  XZUtilsKitDemo
//
//  Created by zx on 2019/9/25.
//  Copyright © 2019 yanyu. All rights reserved.
//

#import "NSObject+ObjectTool.h"

@implementation NSObject (ObjectTool)

/**
 获取当前控制器

 @return 控制器
 */
+ (UIViewController*)currentViewController{
    
    UIViewController* vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}


@end
