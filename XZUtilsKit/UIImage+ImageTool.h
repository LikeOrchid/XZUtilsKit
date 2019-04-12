//
//  UIImage+ImageTool.h
//  FlyingDog
//
//  Created by Toommi on 2017/7/22.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageTool)
+(UIImage*)createImageWithColor:(UIColor*)color;
+(UIImage*)OriginImage:(UIImage *)image scaleToSize:(CGSize)size;
+ (UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
+(UIImage *)setDataImage:(NSData *)data placeher:(UIImage *)placeImage;
-(UIImage *)imageWithRoundedCornersSize:(float)cornerRadius;
+ (UIImage *)getTextImage:(NSString *)name;

+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;
@end
