//
//  UIColor+HexColor.h
//  CangEr
//
//  Created by Toommi on 2018/1/22.
//  Copyright © 2018年 Toommi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

/**
 hex 颜色值 转 uicolor

 @param color hex 颜色值
 @return uicolr 颜色值
 */
+ (UIColor *) colorWithHexString: (NSString *)color;
@end
