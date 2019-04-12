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

-(void)upageTextLineSpacing:(CGFloat) line withKer:(CGFloat) ker on:(NSMutableAttributedString *)attributeString;
-(void)setLableColor:(UIColor *)color withStr:(NSString *)string;
-(CGSize)sizeWithMaxSize:(CGSize)maxSize;
-(void)setLableImageName:(NSString *)name withFrame:(CGRect)rect;
@end
