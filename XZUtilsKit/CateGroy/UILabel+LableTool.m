//
//  UILabel+LableTool.m
//  JinQian
//
//  Created by Toommi on 2017/11/8.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#import "UILabel+LableTool.h"
#import "NSString+StringTool.h"
#import <objc/runtime.h>
/// 获取UIEdgeInsets在水平方向上的值
CG_INLINE CGFloat
UIEdgeInsetsGetHorizontalValue(UIEdgeInsets insets) {
    return insets.left + insets.right;
}

/// 获取UIEdgeInsets在垂直方向上的值
CG_INLINE CGFloat
UIEdgeInsetsGetVerticalValue(UIEdgeInsets insets) {
    return insets.top + insets.bottom;
}

CG_INLINE void
ReplaceMethod(Class _class, SEL _originSelector, SEL _newSelector) {
    Method oriMethod = class_getInstanceMethod(_class, _originSelector);
    Method newMethod = class_getInstanceMethod(_class, _newSelector);
    BOOL isAddedMethod = class_addMethod(_class, _originSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    if (isAddedMethod) {
        class_replaceMethod(_class, _newSelector, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
    } else {
        method_exchangeImplementations(oriMethod, newMethod);
    }
}
@implementation UILabel (LableTool)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ReplaceMethod([self class], @selector(drawTextInRect:), @selector(yf_drawTextInRect:));
        ReplaceMethod([self class], @selector(sizeThatFits:), @selector(yf_sizeThatFits:));
    });
}

- (void)yf_drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = self.yf_contentInsets;
    [self yf_drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

- (CGSize)yf_sizeThatFits:(CGSize)size {
    UIEdgeInsets insets = self.yf_contentInsets;
    size = [self yf_sizeThatFits:CGSizeMake(size.width - UIEdgeInsetsGetHorizontalValue(insets), size.height-UIEdgeInsetsGetVerticalValue(insets))];
    size.width += UIEdgeInsetsGetHorizontalValue(insets);
    size.height += UIEdgeInsetsGetVerticalValue(insets);
    return size;
}

const void *kAssociatedYf_contentInsets;
- (void)setYf_contentInsets:(UIEdgeInsets)yf_contentInsets {
    objc_setAssociatedObject(self, &kAssociatedYf_contentInsets, [NSValue valueWithUIEdgeInsets:yf_contentInsets] , OBJC_ASSOCIATION_RETAIN);
}

- (UIEdgeInsets)yf_contentInsets {
    return [objc_getAssociatedObject(self, &kAssociatedYf_contentInsets) UIEdgeInsetsValue];
}


/**
 更改lable 的间距
 
 @param line 行间距
 @param ker 字间距
 @param attributeString 富文本
 */
-(void)upageTextLineSpacing:(CGFloat) line withKer:(CGFloat) ker on:(NSMutableAttributedString *)attributeString{
    if (attributeString == nil) {
        attributeString = [[NSMutableAttributedString alloc]initWithString:self.text];
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:line];
    
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    NSDictionary *dic = @{ NSParagraphStyleAttributeName:paragraphStyle, NSKernAttributeName:[NSNumber numberWithFloat:ker]
                           };
    [attributeString addAttributes:dic range:NSMakeRange(0, [self.text length])];
    
    self.attributedText = attributeString;
}

/**
 改变文字颜色
 
 @param color 颜色
 @param string 要改变的字符串
 */
-(void)setLableColor:(UIColor *)color withStr:(NSString *)string{
    NSMutableAttributedString * attributeString = [[NSMutableAttributedString alloc]initWithString:self.text];
    NSRange rang = [self.text rangeOfString:string];
    [attributeString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(rang.location, string.length)];
    self.attributedText = attributeString;
}
/**
 得到label 内容 size
 
 @param maxSize 设置的最大size
 @return 得到的sieze
 */
-(CGSize)sizeWithMaxSize:(CGSize)maxSize {
    NSDictionary *dict = @{NSFontAttributeName : self.font};
    CGSize size =  [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesDeviceMetrics attributes:dict context:nil].size;
    return  size;
}
/**
 在lable 上添加图片富文本
 
 @param name 图片名字
 @param rect 图片的位置
 */
-(void)setLableImageName:(NSString *)name withFrame:(CGRect)rect{
    NSMutableAttributedString *attri =     [[NSMutableAttributedString alloc] initWithString:self.text];
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = [UIImage imageNamed:name];
    // 设置图片大小
    attch.bounds = rect;
    
    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    [attri appendAttributedString:string];
    
    // 用label的attributedText属性来使用富文本
    self.attributedText =attri;
}

/**
 设置多子字符串 字体颜色

 @param colors 颜色数组一一对应
 @param strs  子字符串数组一一对应
 */
-(void)setLableColors:(NSArray<UIColor*>*)colors whitStrings:(NSArray<NSString *>*)strs {
 
    NSMutableArray * rangesArray = [NSMutableArray array];
    for (NSString *str in strs) {
        NSArray *ranges = [NSString getSubStringRanges:self.text str:str];
        [rangesArray addObject:ranges];
    }
    
    NSMutableAttributedString * attributeString = [[NSMutableAttributedString alloc]initWithString:self.text];

    for (int i = 0; i<rangesArray.count; i++) {
        NSArray *ranges = [rangesArray objectAtIndex:i];
        UIColor*color = [colors objectAtIndex:i];
        NSString *str = [strs objectAtIndex:i];
        
        for (NSNumber *location in ranges) {
            NSInteger loc = [location integerValue];
            [attributeString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(loc, str.length)];
        }
    }
}
@end
