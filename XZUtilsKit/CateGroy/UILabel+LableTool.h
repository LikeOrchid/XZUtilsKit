//
//  UILabel+LableTool.h
//  JinQian
//
//  Created by Toommi on 2017/11/8.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LableTool)
/**
 修改label内容距 `top` `left` `bottom` `right` 边距
 */
@property (nonatomic, assign) UIEdgeInsets yf_contentInsets;

/**
 更改lable 的间距

 @param line 行间距
 @param ker 字间距
 @param attributeString 富文本
 */
-(void)upageTextLineSpacing:(CGFloat) line withKer:(CGFloat) ker on:(NSMutableAttributedString *)attributeString;

/**
 改变文字颜色

 @param color 颜色
 @param string 要改变的字符串
 */
-(void)setLableColor:(UIColor *)color withStr:(NSString *)string;

/**
 得到label 内容 size

 @param maxSize 设置的最大size
 @return 得到的sieze
 */
-(CGSize)sizeWithMaxSize:(CGSize)maxSize;

/**
 在lable 上添加图片富文本

 @param name 图片名字
 @param rect 图片的位置
 */
-(void)setLableImageName:(NSString *)name withFrame:(CGRect)rect;
@end
