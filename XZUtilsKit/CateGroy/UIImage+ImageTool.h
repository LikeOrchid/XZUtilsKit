//
//  UIImage+ImageTool.h
//  FlyingDog
//
//  Created by Toommi on 2017/7/22.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageTool)

/**
 --根据颜色创建图片

 @param color 颜色
 @return uiimage
 */
+(UIImage*)createImageWithColor:(UIColor*)color;

/**
 --改变图片的大小

 @param image 图片
 @param size 指定的size
 @return image
 */
+(UIImage*)OriginImage:(UIImage *)image scaleToSize:(CGSize)size;

/**
 --添加通用模糊效果
  vImage属于Accelerate.Framework，需要导入 Accelerate下的 Accelerate头文件

 @param image 图片
 @param blur 是模糊度
 @return image
 */
+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

/**
 --通过 data 设置图片

 @param data 数据流
 @param placeImage 替换图片
 @return image
 */
+(UIImage *)setDataImage:(NSData *)data placeher:(UIImage *)placeImage;

/**
 --生成圆角

 @param cornerRadius 圆角大小
 @return image
 */
-(UIImage *)imageWithRoundedCornersSize:(float)cornerRadius;

/**
 --根据文字生成图片

 @param name 字符
 @return image
 */
+(UIImage *)getTextImage:(NSString *)name;

/**
 --压缩图片到指定文件大小 kb

 @param image 图片
 @param size 大小 kb 单位
 @return image
 */
+(NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;
/**
 设置黑白图片
 
 @param image tup
 @return 图片
 */
+ (UIImage *)blackAndWhite:(UIImage *)image;
/**
 将视图切成图片
 
 @param view 视图
 @return 图片
 */
-(UIImage*)convertViewToImage:(UIView*)view;
@end
