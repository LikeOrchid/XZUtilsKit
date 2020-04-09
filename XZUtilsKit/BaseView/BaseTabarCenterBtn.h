//
//  CenterBtnTabar.h
//  DiagnosisOnlineDoctor
//
//  Created by yanyu on 2019/6/27.
//  Copyright © 2019 yanyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTabarCenterBtn : UITabBar
@property (nonatomic, strong) UIButton *centerBtn; //中间按钮
@end
/*
 
 
 //利用KVC 将自己的tabbar赋给系统tabBar
 [self setValue:self.cbtnTabar forKeyPath:@"tabBar"];
 
 -(BaseTabarCenterBtn *)cbtnTabar{
     if (!_cbtnTabar) {
         _cbtnTabar = [[BaseTabarCenterBtn alloc] init];
         [_cbtnTabar.centerBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
         //选中时的颜色
         _cbtnTabar.tintColor = [UIColor colorWithRed:27.0/255.0 green:118.0/255.0 blue:208/255.0 alpha:1];
         //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
         _cbtnTabar.translucent = NO;
         
     }
     return _cbtnTabar;
 }
 */

NS_ASSUME_NONNULL_END
