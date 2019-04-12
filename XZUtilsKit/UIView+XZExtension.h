//
//  UIView+XZExtension.h
//  FlyingDog
//
//  Created by Toommi on 2017/9/30.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XZExtension)
@property(nonatomic) CGPoint origin;
@property(nonatomic) CGSize size;
@property(nonatomic) CGFloat x;
@property(nonatomic) CGFloat y;

// add by jeffery he
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat left_sd;
@property (nonatomic) CGFloat top_sd;
@property (nonatomic) CGFloat right_sd;
@property (nonatomic) CGFloat bottom_sd;
@property (nonatomic) CGFloat centerX_sd;
@property (nonatomic) CGFloat centerY_sd;

@property (nonatomic) CGPoint origin_sd;
@property (nonatomic) CGSize size_sd;



@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

- (UIViewController *)sui_currentVC;

- (void)dropShadowWithOffset:(CGSize)offset radius:(CGFloat)radius color:(UIColor *)color opacity:(CGFloat)opacity;//使用失败

-(void)addViewshadow;
-(void)addViewBuottomShadow;
-(void)removeAllSubViews;

@end
