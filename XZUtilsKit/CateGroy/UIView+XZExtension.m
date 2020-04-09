//
//  UIView+XZExtension.m
//  FlyingDog
//
//  Created by Toommi on 2017/9/30.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#import "UIView+XZExtension.h"

@implementation UIView (XZExtension)

-(CGFloat)x {
    return self.frame.origin.x;
}
-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
    
}
-(CGFloat)y {
    return self.frame.origin.y;
}

-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)left_sd {
    return self.frame.origin.x;
}

- (void)setLeft_sd:(CGFloat)x_sd {
    CGRect frame = self.frame;
    frame.origin.x = x_sd;
    self.frame = frame;
}

- (CGFloat)top_sd {
    return self.frame.origin.y;
}

- (void)setTop_sd:(CGFloat)y_sd {
    CGRect frame = self.frame;
    frame.origin.y = y_sd;
    self.frame = frame;
}

- (CGFloat)right_sd {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight_sd:(CGFloat)right_sd {
    CGRect frame = self.frame;
    frame.origin.x = right_sd - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom_sd {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom_sd:(CGFloat)bottom_sd {
    CGRect frame = self.frame;
    frame.origin.y = bottom_sd - frame.size.height;
    self.frame = frame;
}

- (CGFloat)centerX_sd
{
    return self.left_sd + self.width_sd * 0.5;
}

- (void)setCenterX_sd:(CGFloat)centerX_sd
{
    self.left_sd = centerX_sd - self.width_sd * 0.5;
}

- (CGFloat)centerY_sd
{
    return self.top_sd + self.height_sd * 0.5;
}

- (void)setCenterY_sd:(CGFloat)centerY_sd
{
    self.top_sd = centerY_sd - self.height_sd * 0.5;
}

- (CGFloat)width_sd {
    return self.frame.size.width;
}

- (CGFloat)height_sd {
    return self.frame.size.height;
}

- (CGPoint)origin_sd {
    return self.frame.origin;
}

- (void)setOrigin_sd:(CGPoint)origin_sd {
    CGRect frame = self.frame;
    frame.origin = origin_sd;
    self.frame = frame;
}

- (CGSize)size_sd {
    return self.frame.size;
}

- (void)setSize_sd:(CGSize)size_sd {
    [self setSize:size_sd];
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

// 兼容旧版本

- (CGFloat)left
{
    return self.left_sd;
}

- (void)setLeft:(CGFloat)left
{
    self.left_sd = left;
}

- (CGFloat)right
{
    return self.right_sd;
}

- (void)setRight:(CGFloat)right
{
    self.right_sd = right;
}

- (CGFloat)width
{
    return self.width_sd;
}

- (CGFloat)height
{
    return self.height_sd;
}

- (CGFloat)top
{
    return self.top_sd;
}

- (void)setTop:(CGFloat)top
{
    self.top_sd = top;
}

- (CGFloat)bottom
{
    return self.bottom_sd;
}

- (void)setBottom:(CGFloat)bottom
{
    self.bottom_sd = bottom;
}

- (CGFloat)centerX
{
    return self.centerX_sd;
}

- (void)setCenterX:(CGFloat)centerX
{
    self.centerX_sd = centerX;
}

- (CGFloat)centerY
{
    return self.centerY_sd;
}

- (void)setCenterY:(CGFloat)centerY
{
    self.centerY_sd = centerY;
}

- (CGPoint)origin
{
    return self.origin_sd;
}

- (void)setOrigin:(CGPoint)origin
{
    self.origin_sd = origin;
}

- (CGSize)size
{
    return self.size_sd;
}


#pragma mark - 其它
/**
得到view 当前的控制器

@return 控制器
*/
- (UIViewController *)sui_currentVC
{
    Class aClass = NSClassFromString(@"UIViewController");
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:aClass]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

/**
* 删除所有子视图
*/
-(void)removeAllSubViews{
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
}

#pragma mark -阴影

//设置阴影
- (void)dropShadowWithOffset:(CGSize)offset radius:(CGFloat)radius color:(UIColor *)color opacity:(CGFloat)opacity {
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    self.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = opacity;
}
-(void)addViewshadow{
    self.layer.shadowColor = [UIColor lightGrayColor].CGColor;//shadowColor阴影颜色
    self.layer.shadowOffset = CGSizeMake(3,3);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = 0.8;//阴影透明度，默认0
    self.layer.shadowRadius = 3;//阴影半径，默认3
}
-(void)addViewBuottomShadow {
    self.layer.shadowColor = [UIColor whiteColor].CGColor;//shadowColor阴影颜色
    self.layer.shadowOffset = CGSizeMake(0,2);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = 0.4;//阴影透明度，默认0
    self.layer.shadowRadius = 1.5;//阴影半径，默认3
}

-(void)ShowNotDataIcon {
    UIImageView * icon = [UIImageView new];
    icon.backgroundColor = [UIColor redColor];
    [self addSubview:icon];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:icon
                                                     attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:icon
                                                     attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:icon
                                                     attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:1
                                                      constant:100]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:icon
                                                     attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1
                                                      constant:100]];

    
}


@end
/*
 
 //    NSDictionary *metrics = @{@"padding":@30,@"leftPadding":@10,@"rightPadding":@10,@"height":@40,@"width":@50}
 //
 //
 //    self addConstraint:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[icon(100)]" options:0 metrics:metrics views:<#(nonnull NSDictionary<NSString *,id> *)#>]
 //垂直居中
 [self.view addConstraint:[NSLayoutConstraint constraintWithItem:BackView
                                                       attribute:NSLayoutAttributeCenterY
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self.view
                                                       attribute:NSLayoutAttributeCenterY
                                                      multiplier:1
                                                        constant:0]];
 //水平居中
 [self.view addConstraint:[NSLayoutConstraint constraintWithItem:BackView
                                                       attribute:NSLayoutAttributeCenterX
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self.view
                                                       attribute:NSLayoutAttributeCenterX
                                                      multiplier:1
                                                        constant:0]];

//约束条件
 [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[BackView(320)]" options:0 metrics:metrics views:viewsButton]];
 [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[BackView(350)]" options:0 metrics:metrics views:viewsButton]];
 */
