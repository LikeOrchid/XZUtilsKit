//
//  NSObject+ObjectTool.h
//  XZUtilsKitDemo
//
//  Created by zx on 2019/9/25.
//  Copyright © 2019 yanyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ObjectTool)
/**
 获取当前控制器
 
 @return 控制器
 */
+ (UIViewController*)currentViewController;

@end

NS_ASSUME_NONNULL_END
