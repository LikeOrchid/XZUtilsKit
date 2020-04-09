//
//  UITableView+EstimateHeight.h
//  FlyDog
//
//  Created by Toommi on 2017/11/6.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (EstimateHeight)
/**
 设置简单的文字空视图

 @param num 数组数量
 @param str 字符
 */
-(void)setNormalListView:(NSInteger )num  withString:(NSString *)str;

@end
