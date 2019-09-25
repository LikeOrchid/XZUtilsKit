//
//  UITableView+EstimateHeight.m
//  FlyDog
//
//  Created by Toommi on 2017/11/6.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#import "UITableView+EstimateHeight.h"
@implementation UITableView (EstimateHeight)

/**
 设置简单的文字空视图
 
 @param num 数组数量
 @param str 字符
 */
-(void)setNormalListView:(NSInteger )num  withString:(NSString *)str{
    UIView *normal =[self viewWithTag:999];
    if (normal == nil) {
        normal = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        normal.tag = 999;
        normal.backgroundColor = [UIColor whiteColor];
        normal.userInteractionEnabled = NO;
        //lable
        UILabel * lab=  [[UILabel alloc]initWithFrame:CGRectMake(0, 100, normal.frame.size.width, 20)];
        lab.textColor = [UIColor grayColor];
        lab.text= str ;
        lab.textAlignment = NSTextAlignmentCenter;
        [normal addSubview:lab];
        
        [self addSubview:normal];
    }
    self.separatorStyle = num>0;
    normal.hidden = num;
    
}
@end
